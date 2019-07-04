# A linked list is a linear collection of data elements called nodes
# that point to the next node by means of a pointer.
# Each node holds a single element of data and a pointer to the next node.
# This is an implementation of a linked list in Ruby.
class LinkedList
    attr_accessor :head, :tail, :size

  def initialize(data = nil)
    @linked_list = Array.new
    @head = nil
    @tail = nil
    @curr_node = nil
    @size = 0
  end

  # Adds a new node to the end of the list.
  def append(data)
    @curr_node = Node.new(data)
    if @tail.nil?
      @head = @curr_node
      @tail = @curr_node
    else
      @tail.next_node = @curr_node
      @tail = @curr_node
    end
    @size += 1
  end

  # Adds a new node to the start of the list.
  def prepend(data)
    @curr_node = Node.new(data)
    if @head.nil?
      @head = @curr_node
    else
      @curr_node = Node.new(data)
      @prev_head = @head
      @head = @curr_node
      @head.next_node = @prev_head
    end
    @size += 1
  end

  # Returns total number of nodes in the list.
  def size
    return @size
  end

  # Returns the first node in the list.
  def head
    return @head
  end

  # Returns the last node in the list.
  def tail
    return @tail
  end

  # Returns the node at the given index.
  def at(index)
    return nil if index >= @size || index < 0
    temp_node = @head
    index.times { temp_node = temp_node.next_node }
    return temp_node
  end

  # Removes the last element from the list.
  def pop
    @old_tail = @tail
    @tail = self.at(@size - 1)
    @size =- 1
    return @old_tail
  end

  # Returns true if the passed in value is in the list, otherwise false.
  def contains?(data, node = self.head)
    if node == nil
      return false
    elsif node.value == data
      return true
    else
      contains?(data, node.next_node)
    end
  end

  # Returns the index of the node containing data, nil if not found.
  def find(data, node = self.head, index = 0)
    if node == nil
        return nil
      elsif node.value == data
        return index
      else
        find(data, node.next_node, index += 1)
      end   
  end

  # LinkedList object represented as strings.
  def to_s(node = @head, linked_list_string = "")
    if node
      linked_list_string += "[ #{node.value} ] -> "
      to_s(node.next_node, linked_list_string)
    else
      linked_list_string += "[ nil ]"
    end
  end

end