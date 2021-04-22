require 'minitest/autorun'
require './cookie.rb'

class TestCookie < Minitest::Test
    # Cookie has a sugar method or not 
    def test_cookie_has_sugar_method
    # Given
    c=Cookie.new(5,10)
    # When
    result=c.sugar
    # Then
    assert_equal(result,5)    
    end

    # It should have has sugar set method 
    def test_cookie_has_sugar_set_method
        # Given: A cookie with 6g of Sugar and 15g of Butter
        c=Cookie.new(6,15)
        # When
        c.sugar= 10
        # Then
        assert_equal(c.sugar,10)
    end
    # It should have a method to tell callories count of the cookie 
    def test_calorie_count
        # Given: a cookie with 5g of Sugar and 8g of Butter
        c=Cookie.new(5,8)
        # When: we call  'calorie_count' method
        result=c.calorie_count
        #
        #Then
        assert_equal(result,92)
    end

end