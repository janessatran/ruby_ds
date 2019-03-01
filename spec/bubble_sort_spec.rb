require ('./bubble_sort')

describe '#bubble_sort' do

  it 'compares each element in an array, swaps them, until the array is sorted' do
    expect((bubble_sort([4,5,2,1,6]))).to eq([1,2,4,5,6])
  end

  it 'returns the array if the array size is 1' do
    expect((bubble_sort([1]))).to eq([1])
  end
  
end

describe '#bubble_sort_by' do

  it 'uses the yield function' do
    result = bubble_sort_by(['hello', 'hi', 'hey']) do |left, right|
      left.length - right.length
    end
    expect(result).to eq(['hi', 'hey', 'hello'])
  end 
 
end
