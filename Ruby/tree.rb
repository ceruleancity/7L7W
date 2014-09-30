#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Tree
    attr_accessor :children, :node_name

    def initialize(name, children=[])
        @children = children
        @node_name = name
    end

    def initialize(name, children={})
        @children = children.to_a.inject([]) do |arr, (a,b)|
            arr.push(Tree.new(a,b))
        end
        @node_name = name
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

#ruby_tree = Tree.new( "Ruby", 
#  [Tree.new("Reia"), 
#   Tree.new("MacRuby")] )

my_tree = Tree.new( "mine", {"grandpa" => {"dad" => {"child 1" => {}, "child 2" => {} }, "uncle" => {"child 3" => {}, "child 4" => {} } } })
my_tree.visit_all {|node| puts node.node_name}

puts "Visiting a node"
my_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
my_tree.visit_all {|node| puts node.node_name}
puts
puts my_tree.children 
puts my_tree.node_name