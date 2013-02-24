$LOAD_PATH.unshift File.join(File.expand_path(__FILE__), "..", "ch_examples")

require 'chingu'
require 'gosu'
include Chingu
include Gosu
require 'CORE'
require 'EX'
require 'example1_basics.rb'
require 'example2_gamestate_basics'
require 'example3_parallax'
#puts File.join(File.expand_path(__FILE__), "..", "ch_examples")

#class Example1 < Ex
#	def initialize#(num, descr, cntrls)
#	  @num = num
#	  @descr = descr#{}"Basics"
#	  @cntrls = cntrls#"ARROWS"
#  end
#end

#class Example2 < Play
#end

#class Example3 < Ex3
#  Ex3.new
#end

class Example4 < Test
#  switch_game_state(Test.new)
end

class Example5 < Test
end

class Example6 < Test
end

class Example7 < Ex
end

Core.new.show