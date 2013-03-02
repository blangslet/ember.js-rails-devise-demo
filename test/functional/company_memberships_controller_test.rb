require 'test_helper'

class CompanyMembershipsControllerTest < ActionController::TestCase
  setup do
    @company_membership = company_memberships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_memberships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_membership" do
    assert_difference('CompanyMembership.count') do
      post :create, company_membership: { user_id: @company_membership.user_id }
    end

    assert_redirected_to company_membership_path(assigns(:company_membership))
  end

  test "should show company_membership" do
    get :show, id: @company_membership
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_membership
    assert_response :success
  end

  test "should update company_membership" do
    put :update, id: @company_membership, company_membership: { user_id: @company_membership.user_id }
    assert_redirected_to company_membership_path(assigns(:company_membership))
  end

  test "should destroy company_membership" do
    assert_difference('CompanyMembership.count', -1) do
      delete :destroy, id: @company_membership
    end

    assert_redirected_to company_memberships_path
  end
end
