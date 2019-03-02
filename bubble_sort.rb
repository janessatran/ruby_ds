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

