require "freeplane_jruby_common_environment.rb"
 # The 'freeplane_jruby_environment.rb' file enables the following:
 # # [1] From now on, you can require the gems installed in "gem_home" (and only those)
 # # [2] Enables these omnipresent-global-methods: node, c, ui, logger, htmlUtils, textUtils, menuUtils, config, invokeAndWait
 # # [3] Enables RubyLiveDebugger.open_debug_here(binding)
 
# To remember ruby syntax, see http://www.zenspider.com/ruby/quickref.html


icons_sorting_order = ["full-1", "full-2", "full-3", "0%", "25%", "50%", "75%", "100%"]

node_children_array = node.children.to_a

node_children_array_sorted = node_children_array.sort do |nodeA, nodeB| 

  nodeA_first_icon = nodeA.icons.icons[0]
		# "icon-name-as-string" or nil
  nodeB_first_icon = nodeB.icons.icons[0]
		# "icon-name-as-string" or nil

  a_index = icons_sorting_order.index(nodeA_first_icon)
		# integer or nil 
  if a_index.nil? 
		a_index = -99 
	end
	# at this point, a_index is an integer and never nil
  


  # b_index = icons_sorting_order.index(nodeB_first_icon) || -99
  b_index = icons_sorting_order.index(nodeB_first_icon) 
	b_index.nil? ? b_index = -99 : b_index = b_index
	# at this point, b_index is an integer and never nil

  value_for_the_sort = case 
                       when a_index < b_index
                         -1
                       when a_index == b_index
                         0	
                       when a_index > b_index
                         1
                       else
                         raise("error! how did we get here?")
                       end
	# at this point, value_for_the_sort is -1 or 0 or 1

end

node_children_array_sorted.each {|a_child_node| a_child_node.moveTo(node,-1) } 

