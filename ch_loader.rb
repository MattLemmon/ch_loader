# $LOAD_PATH ____________________________________________
#            What should I put in the $LOAD_PATH so that I can 
#            move the examples to the '/ch_examples' folder?
#
require 'chingu'
require 'gosu'
include Chingu
include Gosu
require 'CORE'
require 'example1_basics.rb'
require 'example2_gamestate_basics'
require 'example3_parallax'


#class Example1 < Ex1    # < 
#end

#class Example2 < Play     # < 
#end

class Example3 < Ex3
#  Ex3.new
end

class Example4 < Test
#  switch_game_state(Test.new)
end

Game.new.show