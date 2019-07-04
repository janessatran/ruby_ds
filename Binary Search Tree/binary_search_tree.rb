class Node
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = nil
    @right = nil
  end
end

class MyBinarySearchTree
  attr_accessor :root_node

  def initialize
    @root_node = nil
  end

  def build_tree(data)
    data.each do |value|
      if @root_node.nil?
        @root_node = Node.new(value)
      else
        insert(@root_node, value)
      end
    end
  end

  def insert(node, value)
    # return duplicates
    if node.value == value
      return node
    elsif value < node.value
      if node.left.nil?
        node.left = Node.new(value)
      else
        insert(node.left, value)
      end
    else
      if node.right.nil?
        node.right = Node.new(value)
      else
        insert(node.right, value)
      end
    end
  end

  # Start with root, add to queue to mark as visited
  # Dequeue the first element
  # Add the element's neighbors to the queue
  # Dequeue and repeat until all nodes have been visited and queue is empty
  def breadth_first_search(value)
    search_queue = [@root_node]

    until search_queue.empty?
      curr_node = search_queue.shift
      return curr_node if curr_node.value == value
      search_queue << curr_node.left unless curr_node.left.nil?
      search_queue << curr_node.right unless curr_node.right.nil?
    end
    return nil
  end

  # Begin fron root node, add node to stack
  # Until stack is empty
  # a) pop off top and compare that node to search node
  # b) if comparisons are not true, add subtree to stack
  # repeat a) and b) until node is found
  def depth_first_search(value)
    search_stack = [@root_node]

    until search_stack.empty?
      curr_node = search_stack.pop
      return curr_node if curr_node.value == value
      search_stack << curr_node.left unless curr_node.left.nil?
      search_stack << curr_node.right unless curr_node.right.nil?
    end
    return nil
  end

  def find_by_dfs_rec(search)
    dfs_rec(@root_node, search)
  end

  def dfs_rec(node, search)
    return nil if node.nil?
    return node if node.value == search
    left_search = dfs_rec(node.left, search)
    return dfs_rec(node.right, search) if left_search.nil?
    return left_search
  end
end