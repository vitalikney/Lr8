require "test_helper"

class CalcControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get root_url
    assert_response :success
  end

  test "should get view" do
    get calc_view_url, params: {'number': '1000'}
    assert_response :success
  end

  test "should get 'EmptyInputError' for empty input" do
    get calc_view_url
    # хэш assigns позволяет обратиться к контекстной переменной 
    assert_equal 'EmptyInputError', assigns[:result]
  end

  test "should get Enumerator with two values" do
    get calc_view_url, params: {'number': '10'}
    # хэш assigns позволяет обратиться к контекстной переменной 
    result = assigns[:result]
    assert_instance_of Enumerator, result
    assert_equal [0, 0], result.next
    assert_equal [1, 1], result.next
    assert_equal [2, 4], result.next
    assert_equal [3, 9], result.next
  end

end
