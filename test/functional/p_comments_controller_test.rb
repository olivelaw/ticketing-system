require 'test_helper'

class PCommentsControllerTest < ActionController::TestCase
  setup do
    @p_comment = p_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:p_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create p_comment" do
    assert_difference('PComment.count') do
      post :create, p_comment: { comment: @p_comment.comment, project_id: @p_comment.project_id, user_id: @p_comment.user_id }
    end

    assert_redirected_to p_comment_path(assigns(:p_comment))
  end

  test "should show p_comment" do
    get :show, id: @p_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @p_comment
    assert_response :success
  end

  test "should update p_comment" do
    put :update, id: @p_comment, p_comment: { comment: @p_comment.comment, project_id: @p_comment.project_id, user_id: @p_comment.user_id }
    assert_redirected_to p_comment_path(assigns(:p_comment))
  end

  test "should destroy p_comment" do
    assert_difference('PComment.count', -1) do
      delete :destroy, id: @p_comment
    end

    assert_redirected_to p_comments_path
  end
end
