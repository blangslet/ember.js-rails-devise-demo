App.PostRoute = Ember.Route.extend({

});

App.PostsRoute = Ember.Route.extend({
  model: function() {
    return App.Post.find();
  }
});

App.PostIndexRoute = Ember.Route.extend({
  setupController: function() {
  	 var post = this.controllerFor('post').get('model'),
        comments = post.get('comments');

    this.controllerFor('post').set('filteredComments', comments);
  }
});

App.PostActiveRoute = Ember.Route.extend({
  setupController: function() {
  	var post = this.controllerFor('post').get('model'),
        comments = post.get('comments');

    var activeComments = comments.filter(function(comment) {
      if (comment.get('isActive')) { return true; }
    });

    this.controllerFor('post').set('filteredComments', activeComments);
  }
});

App.PostInactiveRoute = Ember.Route.extend({
  setupController: function() {
  	var post = this.controllerFor('post').get('model'),
        comments = post.get('comments');

    var inactiveComments = comments.filter(function(comment) {
      if (!comment.get('isActive')) { return true; }
    });

    this.controllerFor('post').set('filteredComments', inactiveComments);
  }
});
