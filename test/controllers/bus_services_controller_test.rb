require "test_helper"

class BusServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bus_services_index_url
    assert_response :success
  end
end
