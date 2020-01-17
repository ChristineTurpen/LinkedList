# initializing the linked list class
class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

# Method that prints "12 --> 99 --> 37 --> nil" when called
def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

# initializes the Stack
class Stack
  attr_accessor :data

  def initialize
    @data = nil
  end

  # Pushes a value onto the stack
  def push(value)
    if @data == nil
      node1 = LinkedListNode.new(value)
      @data = node1
    else
      node1 = LinkedListNode.new(value, @data)
      @data = node1
    end
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the stack and return the value to the user
  def pop
    if @data == nil
      return @data
    else
      get_value = @data.value
      @data = @data.next_node #give me the value stored in next node
      return get_value #give me the value stored in variable
    end
  end
end

# method used to reverse the linked list
def reverse_list(list)
  stack = Stack.new #creates an object of a new empty stack

  while list 
    stack.push(list.value)  # push a value onto the stack
    list = list.next_node   # list values (in nodes) on the stack
  end
    # pops a node from the stack, and shows the data from that node
    LinkedListNode.new(stack.pop, stack.data)
end


#accessor methods
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

# code used for output:
print_values(node3) # prints the contents of the Linked List

puts "-------"

revlist = reverse_list(node3) # prints contents of Linked List in reverse

print_values(revlist) 
# should produce the following output: 
# 12 --> 99 --> 37 --> nil 
# ------ 
# 37 --> 99 --> 12 --> nil