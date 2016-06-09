class AppleTree
  attr_reader :height, :age, :apples

  def initialize(args={})
    args = {
      height: 1,
      age: 0,
      apples: []
    }.merge(args)
    @height = args[:height]
    @age = args[:age]
    @apples = args[:apples]
  end

  def count_apples
    @apples.size
  end

  def year_gone
    @age += 1
    @height +=( rand(10) + 1) if age <= 10
    (rand(100)+1).times{@apples << Apple.new} if age > 3 and age <= 10
  end

  def pick_apples
    apples = @apples.dup
    @apples.clear
    apples
  end

end

class Apple
end
