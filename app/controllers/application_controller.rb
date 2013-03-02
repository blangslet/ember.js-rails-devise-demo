class ApplicationController < ActionController::Base
  protect_from_forgery
  serialization_scope :current_user
  before_filter :authenticate_user!

  helper_method :current_company

  def current_company
	  @current_company ||= Company.find_by_id!(session[:company_id])
  end
end
