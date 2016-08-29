require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  etup do
    @card = crad(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crad)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post :create, card: { 
      	cardNumber: @card.cardNumber
      	expDate: @card.expDate
      	emisor: @card.emisor}
    end

    assert_redirected_to employee_path(assigns(:card))
  end

  test "should show card" do
    get :show, id: @card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card
    assert_response :success
  end

  test "should update card" do
    patch :update, id: @card, card: { 
      	cardNumber: @card.cardNumber
      	expDate: @card.expDate
      	emisor: @card.emisor}
    assert_redirected_to card_path(assigns(:card))
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete :destroy, id: @card
    end

    assert_redirected_to card_path
  end
end
