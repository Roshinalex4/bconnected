require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @group = groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group" do
    assert_difference('Group.count') do
      post :create, group: { access: @group.access, allo_invite_others: @group.allo_invite_others, allow_display_logo: @group.allow_display_logo, check_agreement: @group.check_agreement, country_id: @group.country_id, creator: @group.creator, description: @group.description, display_in_directory: @group.display_in_directory, group_name: @group.group_name, group_owner_email: @group.group_owner_email, group_type: @group.group_type, language: @group.language, single_location: @group.single_location, summary: @group.summary, website: @group.website }
    end

    assert_redirected_to group_path(assigns(:group))
  end

  test "should show group" do
    get :show, id: @group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group
    assert_response :success
  end

  test "should update group" do
    put :update, id: @group, group: { access: @group.access, allo_invite_others: @group.allo_invite_others, allow_display_logo: @group.allow_display_logo, check_agreement: @group.check_agreement, country_id: @group.country_id, creator: @group.creator, description: @group.description, display_in_directory: @group.display_in_directory, group_name: @group.group_name, group_owner_email: @group.group_owner_email, group_type: @group.group_type, language: @group.language, single_location: @group.single_location, summary: @group.summary, website: @group.website }
    assert_redirected_to group_path(assigns(:group))
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete :destroy, id: @group
    end

    assert_redirected_to groups_path
  end
end
