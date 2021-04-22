require 'minitest/autorun'

class AwesomeTest < Minitest::Test
    def test_something # 👈🏻 test method should begin with "test_"
        assert_equal(2,1+1)
        #  we have a method assert_equal from minitest, What it does is checks first argument is equal to the second argument. '.' depicts the test is pass
        # 'F' denotes the failure of the test with actual and expected results
    end
end