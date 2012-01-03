require 'test_helper'

class HomeControllerTest < ActionController::TestCase
 
  test "page header should include link to asset" do
    get :index
    assert_response :success
    assert_select 'body script[type="text/javascript"][src="/assets/templates/test.js"]', true
  end
  
end

class HjsTemplateTest < ActionController::IntegrationTest
  
  test "asset pipeline should serve template" do
    get "/assets/templates/test.js"
    assert_response :success
    assert @response.body == "Ember.TEMPLATES[\"templates_test\"] = Ember.Handlebars.compile(\"{{test}}\\n\");\n"
  end
  
end
