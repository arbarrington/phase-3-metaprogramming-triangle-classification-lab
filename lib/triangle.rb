class Triangle
  # write code here
  attr_reader :side1, :side2, :side3

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  class TriangleError < StandardError
  end

  def kind
    validate_triangle
    if side1 == side2 && side2 == side3 && side1 > 0
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    elsif side1 != side2 && side2 != side3 && side1 != side3
      :scalene
    end
  end

  def validate_triangle
    raise TriangleError unless valid_triangle_inequality?
  end

  def valid_triangle_inequality?
    side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end
end
