require './Binary Search Tree/knights_travails.rb'

describe 'Game' do
  before do
    @game = Game.new
  end

  it 'returns the shorted path and all positions visited' do
    path = @game.get_moves([0, 0], [3, 3])

    expect(path).to eq([[3,3], [1,2], [0,0]])
  end

  it 'should work' do
    path = @game.get_moves([3,3],[4,3])

    expect(path).to eq( [[4,3], [2,4], [4,5], [3,3]])
  end
end
