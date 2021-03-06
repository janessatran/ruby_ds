require ('./my_enumerable_module.rb')

describe Enumerable do

  describe '#my_each' do

    it 'iterates through each element of the object passed to it' do
      expect(['hi', 'hello', 1, 2].my_each {|i| puts i }).to eq(['hi', 'hello', 1, 2])
    end

    it 'returns an enumerator if no block is given' do
      expect([].my_each).to be_a Enumerable
    end

    it 'returns an enumerator if no block is given' do
      hash = {"a"=>1, "b"=>2}
      expect(hash.my_each).to be_a Enumerable
    end

    it 'iterates through each element in the collection' do
      expect((1..3).my_each {|i| puts i}).to eq(1..3)
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

    it 'returns an enumerator if no block is passed' do
      hash = {"a"=>1, "b"=>2}
      expect(hash.select).to be_a Enumerable
    end

    it 'returns items that meet the condition' do
      shopping_cart = {"apples"=>3, "bananas"=>9}
      expect(shopping_cart.select {|k,v| v > 3}).to eq({"bananas"=>9})
    end

  end

  describe '#my_all?' do

    it 'returns true if all values meet the conditions passed in the block' do
      expect(['cat', 'hat', 'bat'].my_all? {|i| i.length == 3}).to eq(true)
    end

    it 'returns false if all values do not meet the condition passed in the block' do
      expect(['cat', 'hat', 'banana'].my_all? {|i| i.length == 3}).to eq(false)
    end

    it 'passes an implicit block if no block is passed and returns true if none of the values are nil or false' do
      expect((1..3).my_all?).to eq(true)
    end

    it 'passes an implicit block if no block is passed and returns true if none of the values are nil or false' do
      expect([nil, 0, 1].my_all?).to eq(false)
    end

  end

  describe '#my_any?' do

    it 'returns true if any value meets the condition' do
      expect(['a', 'b', 'c', 1].my_any? {|i| i.is_a? Numeric}).to eq(true)
    end

    it 'returns false if none of the values meet the condition' do
      expect([1,2,3].my_any? {|i| i.is_a? String}).to eq(false)
    end

    it 'passes an implicit block if no block is passed and returns true if none of the values are nil or false' do
      expect([nil, 0, 1].my_any?).to eq(false)
    end

    it ' returns true if any value meets the condition' do
      math_ops = [:+, :-, :*, :/, :==, :=~]
      expect(math_ops.my_any?{|i| i == '+'.to_sym}).to eq(true)
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

    it 'counts the number of items in enum that equals the item if an argument is passed' do
      expect([1,2,24,2,5,8].my_count(2)).to eq(2)
    end

    it 'counts the number of elements yielding a true value if a block is given' do
      expect([1,2,3,4].my_count{|i| i % 2 == 0}).to eq(2)
    end
  end

  describe '#my_map' do

    it 'applies a function to each element in the array' do
      expect([1,2,3].my_map {|i| i*2}).to eq([2, 4, 6])
    end

    it 'if no block is given, an enumerator is returned instead' do
      expect([1,2,3].my_map).to be_a Enumerable
    end

    it 'if a proc is given, run the proc' do
      squareIt = Proc.new {|x| x*x}
      expect([1,2,3].my_map(squareIt)).to eq([1,4,9])
    end

    it 'if a proc is given and a block is given, run the proc' do
      squareIt = Proc.new {|x| x*x}
      expect([1,2,3].my_map(squareIt) {|x| puts x}).to eq([1,4,9])
    end

  end

  describe '#my_inject' do

    it 'combines all elements in a function by applying operation specified in block' do
      expect(([1,2,3,4]).my_inject(0) {|memo, item| memo + item}).to eq(10)
    end

    it 'combines all elements in a function by applying operation specified in block' do
      expect([1,2,3,4].my_inject {|product, item| product * item}).to eq(24)
    end

    it 'combines all elements in a function by applying operation specified in block' do
      expect((1..4).my_inject {|product, item| product * item}).to eq(24)
    end

    it 'returns nil if no block is passed to operate on' do
      expect(([0,1,2].my_inject {})).to eq(nil)
    end

    it 'returns the total price of the shopping cart' do 
      shopping_cart = ['carrots', 'bananas', 'apples']
      item_prices = {'carrots' => 3, 'bananas' => 2, 'apples' => 4}
      expect(shopping_cart.my_inject(0) {|total, item| total + item_prices[item]}).to eq(9)
    end

    it 'combines all elements in a function by applying operation specified in block' do
      expect([1,2,3,4].my_inject {|product, item| product * item}).to eq(24)
    end

    it 'combines all elements in a function by applying operation specified by symbol passed as param' do
      expect([1,2,3,4].my_inject(:*)).to eq(24)
    end

    it 'combines all elements in a function by applying operation specified by symbol passed as string' do
      expect([1,2,3,4].my_inject('+')).to eq(10)
    end

    it 'takes an integer parameter as the initial memo value if passed with a symbol' do
      expect([1,2,3,4].my_inject(3, :+)).to eq(13)
    end
    
  end

end