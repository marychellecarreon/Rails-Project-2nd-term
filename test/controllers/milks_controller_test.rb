require 'test_helper'

class MilksControllerTest < ActionController::TestCase
  setup do
    @milk = milks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:milks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create milk" do
    assert_difference('Milk.count') do
      post :create, milk: { avatar: @milk.avatar, city: @milk.city, country: @milk.country, owner: @milk.owner, price: @milk.price }
    end

    assert_redirected_to milk_path(assigns(:milk))
  end

  test "should show milk" do
    get :show, id: @milk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @milk
    assert_response :success
  end

  test "should update milk" do
    patch :update, id: @milk, milk: { avatar: @milk.avatar, city: @milk.city, country: @milk.country, owner: @milk.owner, price: @milk.price }
    assert_redirected_to milk_path(assigns(:milk))
  end

  test "should destroy milk" do
    assert_difference('Milk.count', -1) do
      delete :destroy, id: @milk
    end

    assert_redirected_to milks_path
  end
end
