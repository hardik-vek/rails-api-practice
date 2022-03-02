require "test_helper"

class Api::V1::BeersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_beer = api_v1_beers(:one)
  end

  test "should get index" do
    get api_v1_beers_url, as: :json
    assert_response :success
  end

  test "should create api_v1_beer" do
    assert_difference("Api::V1::Beer.count") do
      post api_v1_beers_url, params: { api_v1_beer: { name: @api_v1_beer.name } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_beer" do
    get api_v1_beer_url(@api_v1_beer), as: :json
    assert_response :success
  end

  test "should update api_v1_beer" do
    patch api_v1_beer_url(@api_v1_beer), params: { api_v1_beer: { name: @api_v1_beer.name } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_beer" do
    assert_difference("Api::V1::Beer.count", -1) do
      delete api_v1_beer_url(@api_v1_beer), as: :json
    end

    assert_response :no_content
  end
end
