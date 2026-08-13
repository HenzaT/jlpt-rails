require 'test_helper'

class JlptLevelsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should get show' do
    get jlpt_level_path(kanji_characters(:one))
    assert_response :success
  end
end
