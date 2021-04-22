# Create a cookie class
# Cookie has a sugar method or not 
# It should have has sugar set method 
# It should have a method to tell callories count of the cookie 

class Cookie
    attr_accessor :sugar, :butter
    SUGAR_CALORIES=4
    BUTTER_CALORIES=9

    def initialize(sugar,butter)
        @sugar=sugar
        @butter=butter
    end
    def calorie_count
        sugar* SUGAR_CALORIES + butter * BUTTER_CALORIES
    end
end
