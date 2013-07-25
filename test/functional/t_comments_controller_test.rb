require 'test_helper'

class TCommentsControllerTest < ActionController::TestCase
  setup do
    @t_comment = t_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:t_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create t_comment" do
    assert_difference('TComment.count') do
      post :create, t_comment: { comment: @t_comment.comment, ticket_id: @t_comment.ticket_id, user_id: @t_comment.user_id }
    end

    assert_redirected_to t_comment_path(assigns(:t_comment))
  end

  test "should show t_comment" do
    get :show, id: @t_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @t_comment
    assert_response :success
  end

  test "should update t_comment" do
    put :update, id: @t_comment, t_comment: { comment: @t_comment.comment, ticket_id: @t_comment.ticket_id, user_id: @t_comment.user_id }
    assert_redirected_to t_comment_path(assigns(:t_comment))
  end

  test "should destroy t_comment" do
    assert_difference('TComment.count', -1) do
      delete :destroy, id: @t_comment
    end

    assert_redirected_to t_comments_path
  end
end
