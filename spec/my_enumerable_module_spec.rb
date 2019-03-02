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

  describe '#my_all' do
    it 'returns true if all values meet the condition passed in the block' do
      expect(['cat', 'hat', 'bat'].my_all {|i| i.length == 3}).to eq(true)
    end

    it 'returns false if all values do not meet the condition passed in the block' do
      expect(['cat', 'hat', 'banana'].my_all {|i| i.length == 3}).to eq(false)
    end
  end

end