def delete_elements hash , elements_to_delete

  elements_to_delete.each do |element_to_delete|
    hash.delete(element_to_delete)
  end

  return hash

end

