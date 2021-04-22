require 'minitest/autorun'
class Rectangle
    attr_accessor :width, :height
    def initialize(width,height)
        @width=width
        @height=height
    end
    def perimeter
        @width* 2 + @height * 2
    end
    def is_square?
        @width == @height
    end
    def area
        @width * @height
    end

end

describe Rectangle do
    describe '.area' do
        it 'return the calculated area of hte rectangle' do
            # Given
            rect = Rectangle.new(4,5)
            # When
            area= rect.area
            # Then
            _(area).must_equal(20)
        end
    end
    describe '.perimeter' do
        it ' return the calcualted perimeter of the rectangle' do
            # Given
            rect=Rectangle.new(4,5)
            #When
            perm = rect.perimeter
            # then
            _(perm).must_equal(18)
        end
    end
    describe 'is_square?' do
        it 'return true if the rectangle is a square' do
            # given
            rect=Rectangle.new(4,4)
            #when
            result=rect.is_square?
            # then
            _(result).must_equal(true)
        end
    end
end