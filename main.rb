class Knight
  attr_accessor :children, :parent, :coords

  KNIGHTS_MOVESET = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]].freeze

  def initialize(coords, parent = nil)
    @coords = coords
    @parent = parent
    @children = []
  end

  def move_path
    values = []
    current = self
    while current.parent
      values << current.coords
      current = current.parent
    end
    values << current.coords
    values.reverse
  end

  def find_children
    node = self
    KNIGHTS_MOVESET.each do |num|
      row = node.coords[0] + num[0]
      column = node.coords[1] + num[1]
      node.children << Knight.new([row, column], node) if (row >= 0 && row < 8) && (column >= 0 && column < 8)
    end
    node.children
  end
end

class Gameboard
  def knights_move(from, to)
    queue = [Knight.new(from)]
    while queue
      current_node = queue.shift
      return current_node.move_path if current_node.coords == to

      current_node.find_children
      current_node.children.each { |child| queue << child }
    end
  end
end

game = Gameboard.new
p game.knights_move([0, 0], [3, 3])
