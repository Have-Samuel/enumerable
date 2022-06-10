module myEnumerable
  def enumerable?
    true
  end
end

class myList
  include myEnumerable
end

mylist = mylist.new
p mylist.enumerable?

# the all? functionality

%w[ant bear cat].all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].all? { |word| word.length >= 4 } #=> false
%w[ant bear cat].all?(/t/)                        #=> false
[1, 2i, 3.14].all?(Numeric)                       #=> true
[nil, true, 99].all?                              #=> false
[].all?                                           #=> true

# the any? functionality
%w[ant bear cat].any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].any? { |word| word.length >= 4 } #=> true
%w[ant bear cat].any?(/d/)                        #=> false
[nil, true, 99].any?(Integer)                     #=> true
[nil, true, 99].any?                              #=> true
[].any?                                           #=> false

# the filter functionality 
(1..10).find_all { |i|  i % 3 == 0 }   #=> [3, 6, 9]

[1,2,3,4,5].select { |num|  num.even?  }   #=> [2, 4]

[:foo, :bar].filter { |x| x == :foo }   #=> [:foo]

module myEnumerable
def all?
  each do |element|
    return false unless yield(element)
  end
  true
end

def any?
  each do |element|
    return true if yield(element)
  end
  false
end

def filter result = []
  each do |element|
    result << element if yield(element)
  end
  result
end

def max 
  max = nil
  each do |element|
    max = element if max.nil? || element > max
  end
  max
end

def min
  min = nil
  each do |element|
    min = element if min.nil? || element < min
  end
  min
end

def sort
  result = []
  each do |element|
    result << element
  end
  result.sortend
  end