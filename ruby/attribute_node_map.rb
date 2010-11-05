class AttributeNodeMap
  attr_accessor :my_array, :my_hash

  def initialize key, value
    @my_array = [key, value]
    @my_hash  = { key => value }
  end

  def << key_value_array
    my_array << key_value_array
    key, value = key_value_array
    my_hash.update key => value
  end

  def []= key, value
    my_array << [ key, value ]
    my_hash.update key => value
  end

  def [] key
    if key =~ /^\d$/
      my_array[key]
    else
      my_hash[key]
    end
  end

  def to_array
    my_array
  end

  def to_hash
    my_hash
  end
end
