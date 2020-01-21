class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

# this method prints the linked list in reverse when called
def reverse_list(list, previous=nil) 
  following_node = list.next_node 
  if previous == nil #switch pointer to reverse direction
    list.next_node = nil
  else
    list.next_node = previous
  end

  if following_node == nil
    return list
  else
    return reverse_list(following_node, list)
  end
end

# this method prints "12 --> 99 --> 37 --> nil" when called
def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

# accessor methods
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3) #prints the contents of the Linked List

puts "---------"

reverse_list(node3)

print_values(node1) # prints the contents of the Linked List in reverse
# should produce the following output:
# 12 --> 99 --> 37 --> nil
# ---------
# 37 --> 99 --> 12 --> nil