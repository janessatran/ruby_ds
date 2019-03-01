def bubble_sort(arr)
  if arr.length == 1
    return arr
  end
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
  if arr.length == 1
    return arr
  end
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

bubble_sort_by(['hello', 'hi', 'hey']) do |left, right|
  left.length - right.length
end