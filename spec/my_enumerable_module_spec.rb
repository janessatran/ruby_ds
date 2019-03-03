require ('./my_enumerable_module.rb')

describe Enumerable do

  describe '#my_each' do

    it 'iterates through each element of the object passed to it' do
      expect(['hi', 'hello', 1, 2].my_each {|idx| puts idx }).to eq(['hi', 'hello', 1, 2])
    end

    it 'does nothing if not block is given' do
      expect([].my_each).to eq([])
    end

  end

  describe '#my_each_with_index' do

    it 'returns each item and index in the object' do
      expect(['hi', 'hello'].my_each_with_index {|val, idx| puts "index: #{idx} for val: #{val}" }).to eq(['hi', 'hello'])
    end

  end 

  describe '#my_select' do

    it 'selects items out of the object that appear in the search regex' do
      expect(['a', 'b', 'c', 'd', 'e'].my_select {|i| i =~ /[aeiou]/}).to eq(['a', 'e'])
    end

  end

  describe '#my_all?' do

    it 'returns true if all values meet the conditions passed in the block' do
      expect(['cat', 'hat', 'bat'].my_all? {|i| i.length == 3}).to eq(true)
    end

    it 'returns false if all values do not meet the condition passed in the block' do
      expect(['cat', 'hat', 'banana'].my_all? {|i| i.length == 3}).to eq(false)
    end
  end

  describe '#my_any?' do

    it 'returns true if any value meets the condition' do
      expect(['a', 'b', 'c', 1].my_any? {|i| i.is_a? Numeric}).to eq(true)
    end

    it 'returns false if none of the values meet the condition' do
      expect([1,2,3].my_any? {|i| i.is_a? String}).to eq(false)
    end

  end

  describe '#my_none?' do

    it 'returns true if none of the objects meet the condition' do
      expect([1,2,3].my_none? {|i| i.is_a? String}).to eq(true)
    end

  end

  describe '#my_count' do

    it 'counts the number of objects in the array' do
      expect([1,2,3].my_count).to eq(3)
    end

    it 'counts the number of objects in the array' do
      expect([1,'hello', 3, 5].my_count).to eq(4)
    end

    it 'counts the number of objects in the array' do
      expect([].my_count).to eq(0)
    end

  end

  describe '#my_map' do

    it 'applies a function to each element in the array' do
      expect([1,2,3].my_map {|i| i*2}).to eq([2, 4, 6])
    end

    it 'returns the nil array if no block is given' do
      expect([1,2,3].my_map {}).to eq([nil, nil, nil])
    end
  
  end

  describe '#my_inject' do

    it 'combines all elements in a function by applying operation specified in block' do
      expect(([1,2,3,4]).my_inject(0) {|memo, item| memo + item}).to eq(10)
    end

    it 'combines all elements in a function by applying operation specified in block' do
      expect([1,2,3,4].my_inject {|product, item| product * item}).to eq(24)
    end

    it 'returns nil if no block is passed to operate on' do
      expect(([0,1,2].my_inject {})).to eq(nil)
    end
  
  end

end