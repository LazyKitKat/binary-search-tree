require_relative 'node'

class Tree
    attr_accessor :root
    def initialize(arr)
        @root = build_tree(arr)
    end
    def build_tree(arr)
        return if arr.empty?

        arr = arr.uniq.sort
        mid = arr.length / 2
        
        left_side = arr[0...mid]
        right_side = arr[(mid + 1)..-1]
        
        new_node = Node.new(arr[mid])
        new_node.left = build_tree(left_side)
        new_node.right = build_tree(right_side)

        new_node

    end

    def find(val, r = @root)
        return if r.nil?
        return r if r.data == val

        if r.data < val
            r = r.right
        else
            r = r.left
        end
        find(val, r)
    end

    def helper(var, r = @root)
        if r.data < var
                return r if r.right.nil?
                r = r.right
                helper(var, r)
        else
                return r if r.left.nil?
                r = r.left
                helper(var, r)
        end
    end
    
    def insert(val)
        current_node = helper(val)
        if current_node.data < val
            current_node.right = Node.new(val)
        else
            current_node.left = Node.new(val)
        end
    end

    def delete(val)
        
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

end