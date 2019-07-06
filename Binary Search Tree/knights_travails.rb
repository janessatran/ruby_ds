require 'set'

# Build a function knight_moves that shows the simplest path 
# to get from one square to another.
#
# The board is 8x8 and a knight can move the following directions:
#      +/- 2 in one direction
#      +/- 1 in the other direction
class Node
  attr_accessor :value, :parent

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @adjacent_nodes = []
  end

  def add_child(adjacent_node)
    @adjacent_nodes << adjacent_node
  end
end

class Game
  
  # Creates a game board and a knight.
  def initialize
    @game_board = Set.new
    @knight = nil
    @move_options = [[1, 2], [-1, 2], [1, -2], [-1, -2], 
                     [2, 1], [-2, 1], [-2, -1], [2, -1]]
  end

  def valid_position?(position)
    return (position[0] >= 0 && position[0] <= 7) && (position[1] >= 0 && position[1] <= 7)
  end

  def get_moves(start, target)
    return "Invalid starting point" unless valid_position?(start) && valid_position?(target)
    @root_node = Node.new(start)
    @game_board.add(start)
    curr_node = @root_node
    @search_queue = [@root_node]

    until @search_queue.empty?
      curr_node = @search_queue.shift
      if curr_node.value == target
        path = []
        node = curr_node
        until node == nil
          path << node.value
          node = node.parent
        end
        return path
      else
        @move_options.each do |move|
          position = [curr_node.value[0] + move[0], curr_node.value[1] + move[1]]
          if valid_position?(position) and @game_board.include?(position) == false
            @new_node = Node.new(position, curr_node)
            @game_board.add(position)
            @search_queue << @new_node
          end
        end
      end
    end
  end

  def knight_moves(start, target)
    path = get_moves(start, target)
    puts "You made it in #{path.length} moves! Heres your path: "
    puts path
  end

end
