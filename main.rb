require_relative 'lib/tree'
arr = (Array.new(15) { rand(1..100) })
my_tree = Tree.new(arr)
my_tree.balanced?
p my_tree.inorder
p my_tree.postorder
p my_tree.preorder
5.times do
    random = rand(100..200)
    puts "Inserting #{random} to the tree."
    my_tree.insert(random)

end
my_tree.pretty_print
my_tree.balanced?
my_tree.rebalance
my_tree.pretty_print
p my_tree.balanced?
p my_tree.level_order, my_tree.preorder, my_tree.postorder, my_tree.inorder