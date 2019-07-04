require './Linked List/linked_list.rb'
require './Linked List/node.rb'

describe 'LinkedList' do
  before do
    @linked_list = LinkedList.new
  end

  it 'sets head and tail to nil' do
    expect(@linked_list.head).to eq(nil)
    expect(@linked_list.tail).to eq(nil)
  end

  it 'adds the new node to the end of the list' do
    @linked_list.append(4)

    expect(@linked_list.head).not_to be_nil
    expect(@linked_list.head.value).to eq(4)
  end

  it 'adds the new node to the front of the list' do
    @linked_list.append(4)
    @linked_list.prepend(5)

    expect(@linked_list.head.value).to eq(5)
    expect(@linked_list.tail.value).to eq(4)
  end

  it 'returns the node at the given index' do
    @linked_list.append(4)
    @linked_list.append(6)
    @linked_list.append(2)
    @idx = @linked_list.at(1)

    expect(@idx.value).to eq(6)
  end

  it 'removes the last element from the list on pop' do
    @linked_list.append(4)
    @linked_list.append(6)
    @linked_list.append(2)
    @last_element = @linked_list.pop

    expect(@last_element.value).to eq(2)
  end

  
  it 'returns nil on pop if linked list is empty' do
    @last_element = @linked_list.pop

    expect(@last_element).to eq(nil)
  end

  it 'returns true if the passed value is in the list' do
    @linked_list.append(4)
    @linked_list.append(6)
    @linked_list.append(2)

    expect(@linked_list.contains?(2)).to eq(true)
  end

  it 'returns false if the passed value is not in the list' do
    @linked_list.append(4)
    @linked_list.append(6)
    @linked_list.append(2)

    expect(@linked_list.contains?(7)).to eq(false)
  end

  it 'returns the index of the node containing data if found' do
    @linked_list.append(4)
    @linked_list.append(6)
    @linked_list.append(2)

    expect(@linked_list.find(4)).to eq(0)
  end

  it 'returns nil if the node is not found in the list' do
    @linked_list.append(4)
    @linked_list.append(6)
    @linked_list.append(2)

    expect(@linked_list.find(7)).to eq(nil)
  end

  it 'prints the list as a string' do
    @linked_list.append(4)
    @linked_list.append(6)
    @linked_list.append(2)

    expect(@linked_list.to_s).to eq("[ 4 ] -> [ 6 ] -> [ 2 ] -> [ nil ]")
  end
end
