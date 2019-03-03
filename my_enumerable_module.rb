module Enumerable
  def my_each
    # your code here
    for i in self
      yield i if block_given? 
    end
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
      end
    end
    flag
  end

  def my_any?
    flag = false
    self.my_each do |item|
      if block_given?
        if yield item
          flag = true
          break
        end
      end
    end
    flag
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

  def my_count
    self.length
  end

  def my_map(p=nil)
    new_values = []
    for item in self
      if block_given?
        new_val = yield item
      else
        new_val = p.call
      end
      new_values << new_val
    end
    new_values
  end

  def my_inject(memo=nil)
    if memo == nil
      accum = self[0] # set accum to initial val
      idx = 1
    else 
      accum = memo
      idx = 0
    end
    while idx < self.length
      if block_given?
        accum = yield(accum,self[idx])
      else
        accum = nil
      end
      idx += 1
    end
    accum
  end 


  def bubble_sort(arr)
    return if arr.length == 1
    swapped = true
    while swapped
      swapped = false
      (0..arr.length-2).each do |idx|
        if arr[idx] > arr[idx+1]
          arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
          swapped = true
        end
      end
    end
    arr
  end
  
  def bubble_sort_by(arr)
    return if arr.length == 1
    swapped = true
    while swapped
      swapped = false
      (0..arr.length-2).each do |idx|
        comparison = yield arr[idx], arr[idx+1]
        if comparison > 0
          arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
          swapped = true
        end
      end
    end
    arr
  end

end