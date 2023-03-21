class Knight
  attr_accessor :children, :parent, :value

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @children = []
  end
end