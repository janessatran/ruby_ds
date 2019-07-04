class Node
  attr_accessor :value, :next_node

  def initialize(data = nil, next_node = nil)
    @value = data
    @next_node = next_node
  end

end
