class CompanyMembershipsController < ApplicationController
  before_filter :authenticate_user!

  # GET /company_memberships
  # GET /company_memberships.json
  def index
    @company_memberships = CompanyMembership.where(company_id: current_company.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @company_memberships, :meta => {:current_user => current_user, :current_company => current_company} }
    end
  end

  # GET /company_memberships/1
  # GET /company_memberships/1.json
  def show
    @company_membership = CompanyMembership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company_membership }
    end
  end

  # GET /company_memberships/new
  # GET /company_memberships/new.json
  def new
    @company_membership = CompanyMembership.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_membership }
    end
  end

  # GET /company_memberships/1/edit
  def edit
    @company_membership = CompanyMembership.find(params[:id])
  end

  # POST /company_memberships
  # POST /company_memberships.json
  def create
    @company_membership = CompanyMembership.new(params[:company_membership])

    respond_to do |format|
      if @company_membership.save
        format.html { redirect_to @company_membership, notice: 'Company membership was successfully created.' }
        format.json { render json: @company_membership, status: :created, location: @company_membership }
      else
        format.html { render action: "new" }
        format.json { render json: @company_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /company_memberships/1
  # PUT /company_memberships/1.json
  def update
    @company_membership = CompanyMembership.find(params[:id])

    respond_to do |format|
      if @company_membership.update_attributes(params[:company_membership])
        format.html { redirect_to @company_membership, notice: 'Company membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_memberships/1
  # DELETE /company_memberships/1.json
  def destroy
    @company_membership = CompanyMembership.find(params[:id])
    @company_membership.destroy

    respond_to do |format|
      format.html { redirect_to company_memberships_url }
      format.json { head :no_content }
    end
  end
end
