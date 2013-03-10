# Ember.js + Rails + Devise demo app

**Update**: Now current_user and current_company are serialized and accessible in ember app

Demos an ember.js + rails + devise app that uses a hybrid approach: Rails + Devise for user auth, a rails view action for session variable assignment and a scoped ember app that has access to serialized rails methods.

## Also shows:

- Persisting an ember has_many relationship with Rails
- Sorting and filtering in the parent of an ember has_many
- Displaying current_user and current_company rails methods within the scoped ember app

These are simple building blocks with powerful possibilities. This is a quick implementation with zero design, but soon I'll be either fleshing this example out or open-sourcing one of my current ember + rails projects to show more complex and rich examples of how powerful this combination has become. 

To get this demo running:

1. clone or download

2. `cd /app and bundle install`
    
3. `rake db:migrate`
    
4. `rake db:seed`
  
5. `rails s`

6. make it better, PRs welcome! :P


--------- 


Interesting pieces of code: 


1) In the Rails Companies view, on specific company link_to click, pass the company variable to a rails controller action that's passed onward to a helper method to set a devise session variable for current_company.  

    <% @companies.each do |company| %>
      <%= link_to 'Company Dashboard', set_current_company_company_path(:id => company) %>
    <% end %>

    class CompaniesController < ApplicationController

      def set_current_company
        session[:company_id] = params[:id]
        redirect_to assets_path 
      end
      ...
    end

    class ApplicationController < ActionController::Base
    ...
      helper_method :current_company

      def current_company
          @current_company ||= Company.find_by_id!(session[:company_id])
      end
    ...
    end

    App::Application.routes.draw do

    resources :companies do
        member do
          get :set_current_company
        end
      end
    ...

The set_current_company method will set the current_company variable session-wide and redirect the user to the assets/index.html.erb rails view that contains your ember application. 

2) You now need to scope your rails api data for Posts (and Comments, Company_Memberships) for current_company that you want to use in your json api/ember models, like so: 

    class PostsController < ApplicationController

     def index 
        @posts = Post.where(company_id: current_company.id)
        render json: @posts 
     end

    def create
        @post = Post.new(params[:post].merge :company_id => current_company.id)

        respond_to do |format|
          if @post.save
          render json: @post, status: :created, location: @post
          else
          render json: @post.errors, status: :unprocessable_entity 
          end
        end
    end


3) Then serialize the data through AMS to the ember app in a normal way:

    class PostSerializer < ActiveModel::Serializer
      attributes :id, :title, :body, :company_id, :user_id
      has_many :comments
    end


4) Then on to the ember model. 

    App.Post = DS.Model.extend({
      title: DS.attr('string'),
      body: DS.attr('string'),
      comments: DS.hasMany('App.Comment')
    });


5) Ember Controllers, Views and templates should behave as expected. Check out the [demo app] to see super basic implementations.

----

In order to gain access to current_user and current_company, use [active_model_serializers meta data serialization](https://github.com/rails-api/active_model_serializers#attributes) and then [this guy's temporary solution](http://stackoverflow.com/questions/14322945/accessing-meta-information-passed-in-a-json-server-response/14357404#14357404) to map your serializer so that it grabs the meta data and sets it to a global variable in your ember app. This may not be best practices, but for now, it gets the job done.


1) First, set your store.js grab the meta data from your json and set it to a global variable in your serializer: 

    App.CustomRESTSerializer = DS.RESTSerializer.extend({
      extractMeta: function(loader, type, json) {
        var meta;
        meta = json[this.configOption(type, 'meta')];
        if (!meta) { return; }
        Ember.set('App.metaData', meta);
        this._super(loader, type, json);
      }
    });

    App.Store = DS.Store.extend({
      revision: 11,
      adapter:  DS.RESTAdapter.create({
        bulkCommit: false,
        serializer: App.CustomRESTSerializer
        }),
    });

    App.ready = function() {
      App.CompanyMembership.find();
    }

2) Second, in your rails company_memberships_controller.rb render the meta data:

    render json: @company_memberships, :meta => {:current_user => current_user, :current_company => current_company}



3) Finally, call any current_user or current_company attribute straight from your templates:

    Logged in with: {{App.metaData.current_user.email}}
    </br>

    Current Company: {{App.metaData.current_company.name}}
    </br>

