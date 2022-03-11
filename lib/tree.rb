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
        
        left_side = arr[0..mid]
        right_side = arr[(mid + 1)..-1]
        
        new_node = Node.new(left_side.pop)
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

        return nil if current_node.data == val

        if current_node.data < val
            current_node.right = Node.new(val)
        else
            current_node.left = Node.new(val)
        end
    end

    def delete_helper(val, r = @root)
        return nil if r.nil?
        found = false
        found = true if (r.left.data == val or r.right.data == val)
        return r if found
        if r.data < val
            r = r.right
        else
            r = r.left
        end
        delete_helper(val, r)
    end

    def lowest_value(val, r = @root)
        return if r.nil?
        r = r.right
        if r.left.nil?
            lowest_value(val, r)
        else
            until r.left.nil?
                r = r.left
            end
            r
        end
    end

    def delete(val)
        search_node = find(val)

        return nil if search_node.nil?

        
        
        temp_left = search_node.left
        temp_right = search_node.right

        if temp_left.nil? and temp_right.nil?
            parent_node = delete_helper(search_node.data)
            parent_node.left = nil if parent_node.left == search_node
            parent_node.right = nil if parent_node.right == search_node
            search_node = nil
        else
            new_node = lowest_value(val, search_node)
            node_parent = delete_helper(new_node.data)
            if new_node.right.nil?
                delete(new_node.data)
            else
                new_node = new_node.right
                node_parent.left = new_node      
            end
            search_node.data = new_node.data
        end
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

end