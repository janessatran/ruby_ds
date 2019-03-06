module Enumerable
  def my_each
    return self.to_enum unless block_given? 
    for i in self
      yield i 
    end
    self
  end

  def my_each_with_index
    for val, idx in self
      yield val, idx if block_given?
    end
  end

  def my_select
    found_items = []
    idx = 0
    self.my_each do |item|
      if block_given? 
        if yield item
          found_items << item
        end
      else
        found_items = self.to_enum
      end
    end
    found_items
  end

  def my_all?
    flag = true
    self.my_each do |item|
      if block_given?
        if not yield item
          flag = false
          break
        end
      else
        if item.nil? || item == false
          flag = false
        end
      end
    end
    flag
  end

  def my_any?
    truths = []
    self.my_each do |item|
      if block_given?
        if yield item
          truths << item
          break
        end
      else
        if (item.nil? || item == false)
          break
        end
      end
    end
    truths.length > 0 ? true : false
  end

  def my_none?
    flag = true
    self.my_each do |item|
      if block_given?
        if yield item
          flag = false
        end
      end
    end
    flag
  end

  def my_count(args=nil)
    count = 0
    if args.nil? == false
      self.my_each do |item|
        if item == args
          count += 1
        end
      end
    elsif block_given? 
      self.my_each do |item|
        if yield item
          count += 1
        end
      end
    else
      count = self.length
    end
    return count
  end

  def my_map(p=nil)
    new_values = []
    for item in self
      if p.nil? == false
        new_val = p.call(item)
      elsif block_given? 
        new_val = yield item
      end
      new_values << new_val
    end
    new_values
  end

  def my_inject(*args)
    if (args[1].is_a?(Symbol) && args[0].is_a?(Integer))
      memo = args[0]
      self.my_each { |item| memo = memo.method(args[1]).call(item) }
    elsif (block_given? && args[0].is_a?(Integer))
        memo = args[0] # set accum to initial val
        self.my_each {|item| memo = yield(memo, item)}
    elsif (block_given? && args[0].nil?)
      idx = 0
      self.my_each do |item|
        idx == 0 ? memo = item : memo = yield(memo, item)
        idx += 1
      end
    elsif (args.length == 1 && block_given? == false)
      if args[0].is_a?(Symbol)
        idx = 0
        self.my_each do |item|
          idx == 0 ? memo = item : memo =  memo.method(args[0]).call(item)
          idx += 1
        end
      elsif args[0].is_a?(String)
        math_ops = [:+, :-, :*, :/, :==, :=~]
        if math_ops.my_any? {|o| o == args[0].to_sym}
          idx = 0
          self.my_each do |item|
            idx == 0 ? memo = item : memo = memo.method(args[0].to_sym).call(item)
            idx += 1
          end
        else
          raise 'Invalid operator'
        end
      end
    end
  memo
  end

end