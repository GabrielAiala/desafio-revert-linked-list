require_relative 'node'

class Main
  def initialize
    @fifth_node = Node.new("Tchau", nil)
    @forth_node = Node.new("1.5", @fifth_node)
    @third_node = Node.new("1/1/2005 14:00:00", @forth_node)
    @second_node = Node.new("5", @third_node)
    @first_node = Node.new("Oi", @second_node)
  end

  def revert_nodes(node)
    if node.next_node.nil?
      @first_node = node
      return
    end

    revert_nodes(node.next_node)
    node.next_node.next_node = node
    node.next_node = nil
  end

  def print_node(node)
    puts node.value
    print_node(node.next_node) unless node.next_node.nil?
  end

end

main = Main.new
puts "antes de reverter"
main.print_node(main.instance_variable_get(:@first_node))
main.revert_nodes(main.instance_variable_get(:@first_node))
puts "depois de reverter"
main.print_node(main.instance_variable_get(:@first_node))