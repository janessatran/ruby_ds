require './Binary Search Tree/binary_search_tree.rb'

describe 'MyBinarySearchTree' do
  before do
    @tree = MyBinarySearchTree.new
  end

  it 'builds a binary search tree' do
    @arr = [1, 7, 4, 12]
    @tree.build_tree(@arr)

    expect(@tree.root_node.value).to eq(1)
    expect(@tree.root_node.right.value).to eq(7)
    expect(@tree.root_node.left).to eq(nil)
    expect(@tree.root_node.right.right.value).to eq(12)
    expect(@tree.root_node.right.left.value).to eq(4)
  end

  it 'uses breadth-first-search to find the node' do
    @arr = [1, 7, 4, 23, 8, 9]
    @tree.build_tree(@arr)
    @item = @tree.breadth_first_search(8)

    expect(@item.value).to eq(8)
    expect(@item.right.value).to eq(9)
    expect(@item.left).to eq(nil)
  end

  it 'uses depth-first-search to find the node' do
    @arr = [1, 7, 4, 23, 8, 9]
    @tree.build_tree(@arr)
    @item = @tree.depth_first_search(8)

    expect(@item.value).to eq(8)
    expect(@item.right.value).to eq(9)
    expect(@item.left).to eq(nil)
  end

  it 'uses depth-first-search recursion to find the node' do
    @arr = [1, 7, 4, 23, 8, 9]
    @tree.build_tree(@arr)
    @item = @tree.find_by_dfs_rec(8)

    expect(@item.value).to eq(8)
    expect(@item.right.value).to eq(9)
    expect(@item.left).to eq(nil)
  end
end
