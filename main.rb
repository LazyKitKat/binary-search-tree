require_relative 'lib/tree'
arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
my_tree = Tree.new(arr)
p my_tree.root
puts "\n\n"
my_tree.pretty_print
p my_tree.find(325)

puts "\n\n"
my_tree.insert(2)
my_tree.pretty_print
