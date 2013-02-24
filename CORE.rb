#
#     WINDOW CLASS        WINDOW CLASS        WINDOW CLASS     WINDOW CLASS   
#
class Core < Chingu::Window
  def initialize
    super(800,600)
    self.input = {:esc => :exit, :q => Main, :w => :pop, :z => :status, :f=>:fart}
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
    @fart = "&xo|kee<92ujjsllo8!!!"
    puts @fart
  end
end

#
#  PAUSE CLASS
#
class Pause < Chingu::GameState
  def initialize(options = {})
    super
    @title = Chingu::Text.create(:text=>"PAUSED (press 'p' to un-pause)", :x=>200, :y=>200, :size=>20, :color => Color.new(0xFF00FF00))
    self.input = { :p => :un_pause, :q => Main, :r => :reset }
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
#  MAIN MENU    MAIN MENU     MAIN MENU     MAIN MENU     MAIN MENU     MAIN MENU     MAIN MENU     MAIN MENU
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
    @descr = "Basics"
    @cntrls = "Arrows"
    @example = Game
    @title4.text = "Example 1 - #{@descr}\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
                 :enter  => Ex1.new, #(1, @descr, @cntrls, @example), 
    	           :return => Ex.new(1, @descr, @cntrls, @example)  }
    $window.caption = "Chingu Example 1 - #{@descr}"
  end
  
  def ex2
    @title4.text = "Example 2 - #{@descr}\n(ENTER to Continue)"
    @descr = "GameState Basics"
    @cntrls = "Arrows"
    @example = Play

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
    	           :enter  => Ex2.new, #(2, @descr, @cntrls, @example),
    	           :return => Ex.new(2, @descr, @cntrls, @example)  }
    $window.caption = "Chingu Example 2 - #{@descr}"
  end

  def ex3
    @title4.text = "Example 3 - #{@descr}\n(ENTER to Continue)"
    @descr = "Parallax"
    @cntrls = "Arrows, Spacebar"
    @example = Wood
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
    	           :enter  => Ex3.new, 
    	           :return => Ex.new(3, @descr, @cntrls, @example)   }
    $window.caption = "Chingu Example 3 - #{@descr}"
  end

  def ex4
    @title4.text = "Example 4 - #{@descr}\n(ENTER to Continue)"
    @descr = "Multiple GameStates"
    @cntrls = "F1, F2, Arrows, Spacebar"
    @example = Intro
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
                 :enter  => Ex.new(4, @descr, @cntrls, @example),
                 :return => Ex.new(4, @descr, @cntrls, @example)   }
    $window.caption = "Chingu Example 4 - #{@descr}"
  end

  def ex5
    @title4.text = "Example 5 - #{@descr}\n(ENTER to Continue)"
    @descr = "GameStates in Pure Gosu"
    @cntrls = "....."
    @example = Test

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
                 :enter  => Example5.new, 
                 :return => Example5.new   }
    $window.caption = "Chingu Example 5 - #{@descr}"
  end

  def ex6
    @title4.text = "Example 6 - #{@descr}\n(ENTER to Continue)"
    @descr = "Transitional GameState"
    @cntrls = "....."
    @example = Test


    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
                 :enter  => Example6.new, 
                 :return => Example6.new   }
    $window.caption = "Chingu Example 6 - #{@descr}"
  end

  def ex7
    @title4.text = "Example 7 - #{@descr}\n(ENTER to Continue)"
    @descr = "GFX Helpers"
    @cntrls = "Arrows, Arrows, Arrows"
    @example = Test
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
                 :enter  => Example7.new,  #(7, @descr, @cntrls, @example), 
                 :return => Example7.new } #(7, @descr, @cntrls, @example)   }
    $window.caption = "Chingu Example 7 - #{@descr}"
  end

  def ex8
    Example8.new
    #    ... There is probably a better way to do this...
  end
end


