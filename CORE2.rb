#
#     WINDOW CLASS        WINDOW CLASS        WINDOW CLASS     WINDOW CLASS   
#
class Core < Chingu::Window
  def initialize
    super(800,600)
    self.input = {:esc => :exit, :q => Main, :w => :pop, :s => :status, :f=>:fart}
    push_game_state(Main)
  end

  def pop
    if $window.current_game_state.to_s != "Main" then
      pop_game_state
    else
      push_game_state(Main)
    end
  end

  def status
    puts $window.current_game_state
  end

  def fart
    puts "&xo|kee<92ujjsllo8!!!"
  end
end

#
#  PAUSE CLASS
#
class Pause < Chingu::GameState
  def initialize(options = {})
    super
    @title = Chingu::Text.create(:text=>"PAUSED (press 'p' to un-pause)", :x=>200, :y=>200, :size=>20, :color => Color.new(0xFF00FF00))
    self.input = { :p => :un_pause, :q => Menu, :r => :reset }
  end
  def un_pause
    pop_game_state(:setup => false)    # Return the previous game state, dont call setup()
  end  
  def reset
    pop_game_state(:setup => true)
  end
  def draw
    previous_game_state.draw    # Draw prev game state onto screen (in this case our level)
    super                       # Draw game objects in current game state, this includes Chingu::Texts
  end  
end

#
#  MENU    MENU     MENU     MENU     MENU     MENU     MENU     MENU     MENU
#
class Main < Chingu::GameState 
  def initialize(options = {})
    super
    @title0 = Chingu::Text.create(:text=>"Chingu Example Loader" , :x=>250, :y=>70, :size=>34)
    @title2 = Chingu::Text.create(:text=>"Press a Number (1-7) to choose your EXAMPLE" , :x=>230, :y=>190, :size=>22)
    @title3 = Chingu::Text.create(:text=>"Press Q at any time for MAIN MENU" , :x=>270, :y=>120, :size=>22)    
    @title4 = Chingu::Text.create(:text=>" " , :x=>290, :y=>300, :size=>28)

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8 }
    $window.caption = "CHINGU EXAMPLE LOADER - MAIN MENU"
  end
  def ex1
#    switch_game_state(Example1)
    Example1.new
  end
  def ex2
    switch_game_state(Example2)
  end
  def ex3
  end
  def ex4
  end
  def ex5
  end
  def ex6
  end
  def ex7
  end
  def ex8
  end

end

class Example1 < Main
  def initialize
    @descr = "Basics"
    @cntrls = "Arrows"
    @example = Game
#    @title4.text = "Example 1 - #{@descr}\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
                 :enter  => Ex1.new, #(1, @descr, @cntrls, @example), 
    	           :return => Ex.new(1, @descr, @cntrls, @example)  }
    $window.caption = "Chingu Example 1 - #{@descr}"
  end
end

class Example2 < Main
  def ex2
    @descr = "GameState Basics"
    @cntrls = "Arrows"
    @example = Play
    @title4.text = "Example 2 - #{@descr}\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
    	           :enter  => Ex2.new, #(2, @descr, @cntrls, @example),
    	           :return => Ex.new(2, @descr, @cntrls, @example)  }
    $window.caption = "Chingu Example 2 - #{@descr}"
  end
end

class Example3 < Main
  def ex3
    @descr = "Parallax"
    @cntrls = "Arrows, Spacebar"
    @example = Wood
    @title4.text = "Example 3 - #{@descr}\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
    	           :enter  => Ex3.new, 
    	           :return => Ex.new(3, @descr, @cntrls, @example)   }
    $window.caption = "Chingu Example 3 - #{@descr}"
  end
end

class Example4 < Main
  def ex4
    @descr = "Multiple GameStates"
    @cntrls = "F1, F2, Arrows, Spacebar"
    @example = Intro
    @title4.text = "Example 4 - #{@descr}\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
                 :enter  => Ex.new(4, @descr, @cntrls, @example),
                 :return => Ex.new(4, @descr, @cntrls, @example)   }
    $window.caption = "Chingu Example 4 - #{@descr}"
  end
end

class Example5 < Main
  def ex5
    @descr = "GameStates in Pure Gosu"
    @cntrls = "....."
    @example = Test
    @title4.text = "Example 5 - #{@descr}\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
                 :enter  => Example5.new, 
                 :return => Example5.new   }
    $window.caption = "Chingu Example 5 - #{@descr}"
  end
end

class Example6 < Main
  def ex6
    @descr = "Transitional GameState"
    @cntrls = "....."
    @example = Test
    @title4.text = "Example 6 - #{@descr}\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
                 :enter  => Example6.new, 
                 :return => Example6.new   }
    $window.caption = "Chingu Example 6 - #{@descr}"
  end
end

class Example7 < Main
  def ex7
    @title4.text = "Example 7 - #{@descr}\n(ENTER to Continue)"
    @descr = "GFX Helpers"
    @cntrls = "Arrows, Arrows, Arrows"
    @example = Test
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
                 :enter  => Example7.new(7, @descr, @cntrls, @example), 
                 :return => Example7.new(7, @descr, @cntrls, @example)   }
    $window.caption = "Chingu Example 7 - #{@descr}"
  end
end

class Example8 < Main
  def ex8
    #    ... There is probably a better way to do this...
  end
end


