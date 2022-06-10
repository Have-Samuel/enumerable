require_relative 'my_enumerable'

# defining myList class
class myList
include myEnumerable

def initialize(*list)

  @list = list
end

def each
  @list.each { |element| yield(element) if block_given? }
end

def to_s
  @list.join(', ')
end
end

# Create our list
irb> list = MyList.new(1, 2, 3, 4)
=> #<MyList: @list=[1, 2, 3, 4]>

# Test #all?
irb> list.all? {|e| e < 5}
=> true
irb> list.all? {|e| e > 5}
=> false

# Test #any?
irb> list.any? {|e| e == 2}
=> true
irb> list.any? {|e| e == 5}
=> false

# Test #filter
irb> list.filter {|e| e.even?}
=> [2, 4]