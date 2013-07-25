require 'test_helper'

class PattachmentsControllerTest < ActionController::TestCase
  setup do
    @pattachment = pattachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pattachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pattachment" do
    assert_difference('Pattachment.count') do
      post :create, pattachment: { project_id: @pattachment.project_id }
    end

    assert_redirected_to pattachment_path(assigns(:pattachment))
  end

  test "should show pattachment" do
    get :show, id: @pattachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pattachment
    assert_response :success
  end

  test "should update pattachment" do
    put :update, id: @pattachment, pattachment: { project_id: @pattachment.project_id }
    assert_redirected_to pattachment_path(assigns(:pattachment))
  end

  test "should destroy pattachment" do
    assert_difference('Pattachment.count', -1) do
      delete :destroy, id: @pattachment
    end

    assert_redirected_to pattachments_path
  end
end
