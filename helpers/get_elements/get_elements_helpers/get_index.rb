def get_index array , value

  index = 0

  for i in (0..array.count-1)
    if array[i] < value
      index = i
    end
  end

  return index

end
