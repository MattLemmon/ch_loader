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
#     WINDOW CLASS        WINDOW CLASS        WINDOW CLASS     WINDOW CLASS   
#
class Core < Chingu::Window
  def initialize
    super(800,600)
    self.input = {:esc => :exit, :q => Main, :w => :pop, :z => :status, :f=>:fart}
    push_game_state(Welcome)
  end

  def pop
    if $window.current_game_state.to_s != "Welcome" then
      pop_game_state
    else
      puts "chill"
#      push_game_state(Welcome)
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
#   WELCOME   WELCOME   WELCOME   WELCOME   WELCOME   WELCOME   WELCOME
#
class Welcome < Chingu::GameState
  def initialize
    super
    self.input = { :b => :boom, :enter => Main, :return => Main }
    @t1 = Chingu::Text.create(:text=>"Chingu Example Loader" , :x=>98, :y=>70, :size=>70)
    @t2 = Chingu::Text.create(:text=>"Global Controls:       Q  -  Main Menu" , :x=>134, :y=>185, :size=>36)
    @t3 = Chingu::Text.create(:text=>"W  -  Previous Menu" , :x=>382, :y=>235, :size=>36)
    @t4 = Chingu::Text.create(:text=>"Z  -  Status Log" , :x=>388, :y=>335, :size=>36)
    @t4 = Chingu::Text.create(:text=>"F  -  Fart Feature" , :x=>391, :y=>285, :size=>36)
    @t5 = Chingu::Text.create(:text=>"Press Enter to Continue" , :x=>240, :y=>420, :size=>40)
    puts "Welcome"
  end

  def boom
    puts $window.current_game_state
    puts "Boom!"
    push_game_state(Main)
  end

end


#
#  MAIN MENU    MAIN MENU     MAIN MENU     MAIN MENU     MAIN MENU     MAIN MENU     MAIN MENU     MAIN MENU
#
class Main < Chingu::GameState 
  def initialize(options = {})
    super
    @title1 = Chingu::Text.create(:text=>"Main Menu" , :x=>290, :y=>65, :size=>56)
    @title2 = Chingu::Text.create(:text=>"Press a Number (1-7)" , :x=>260, :y=>130, :size=>40)
    @title3 = Chingu::Text.create(:text=>"Q  -  Main Menu" , :x=>10, :y=>10, :size=>20)
    @title4 = Chingu::Text.create(:text=>"W  -  Prev Menu" , :x=>8, :y=>32, :size=>20)
    @title5 = Chingu::Text.create(:text=>"F  -  Fart Feature" , :x=>10, :y=>54, :size=>20)
    @title6 = Chingu::Text.create(:text=>"Z  -  Status Log" , :x=>10, :y=>76, :size=>20)
    @title8 = Chingu::Text.create(:text=>" " , :x=>158, :y=>300, :size=>34)
    @title9 = Chingu::Text.create(:text=>" " , :x=>160, :y=>230, :size=>56)
    @title0 = Chingu::Text.create(:text=>" " , :x=>205, :y=>410, :size=>48)

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8 }
    $window.caption = "Chingu Example Loader - MAIN MENU"
  end

  def ex1
    @n = 1
    @descr = "Basics"
    @cntrls = "Arrows"
    @status = Game
    @title8.text = "Controls  -  #{@cntrls} "
    @title9.text = "Ex. #{@n} - #{@descr}"
    @title0.text = "Press Enter to Continue"

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
                 :enter  => Ex1.new, #(1, @descr, @cntrls, @status), 
    	           :return => Ex.new(@n, @descr, @cntrls, @status)  }
    $window.caption = "Chingu Example #{@n} - #{@descr}"
  end
  
  def ex2
    @n = 2
    @descr = "GameState Basics"
    @cntrls = "Arrows"
    @status = Play
    @title8.text = "Controls  -  #{@cntrls} "
    @title9.text = "Ex. #{@n} - #{@descr}"
    @title0.text = "Press Enter to Continue"

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
    	           :enter  => Ex2.new, #(2, @descr, @cntrls, @status),
    	           :return => Ex.new(@n, @descr, @cntrls, @status)  }
    $window.caption = "Chingu Example @n - #{@descr}"
  end

  def ex3
    @n = 3
    @descr = "Parallax"
    @cntrls = "Arrows, Spacebar"
    @status = Wood
    @title8.text = "Controls  -  #{@cntrls} "
    @title9.text = "Ex. #{@n} - #{@descr}"
    @title0.text = "Press Enter to Continue"

    $window.caption = "Chingu Example #{@n} - #{@descr}"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
    	           :enter  => Ex3.new, 
    	           :return => Ex.new(@n, @descr, @cntrls, @status)   }
  end

  def ex4
    @n = 4
    @descr = "Multiple GameStates"
    @cntrls = "F1, F2, Arrows, Spacebar"
    @status = Intro
    @title9.text = "Ex. #{@n} - #{@descr}"
    @title0.text = "Press Enter to Continue"

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
                 :enter  => Ex.new(4, @descr, @cntrls, @status),
                 :return => Ex.new(@n, @descr, @cntrls, @status)   }
    $window.caption = "Chingu Example #{@n} - #{@descr}"
  end

  def ex5
    @n = 5
    @descr = "GameStates in Pure Gosu"
    @cntrls = "....."
    @status = Test
    @title9.text = "Ex. #{@n} - #{@descr}"
    @title0.text = "Press Enter to Continue"

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
                 :enter  => Example5.new, 
                 :return => Example5.new   }
    $window.caption = "Chingu Example #{@n} - #{@descr}"
  end

  def ex6
    @n = 6
    @descr = "Transitional GameState"
    @cntrls = "....."
    @status = Test
    @title9.text = "Ex. #{@n} - #{@descr}"
    @title0.text = "Press Enter to Continue"

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
                 :enter  => Example6.new, 
                 :return => Example6.new   }
    $window.caption = "Chingu Example #{@n} - #{@descr}"
  end

  def ex7
    @n = 7
    @descr = "GFX Helpers"
    @cntrls = "Arrows, Arrows, Arrows"
    @status = Test
    @title9.text = "Ex. #{@n} - #{@descr}"
    @title0.text = "Press Enter to Continue"

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7, :"8"=>:ex8,
                 :enter  => Example7.new,  #(7, @descr, @cntrls, @status), 
                 :return => Example7.new } #(7, @descr, @cntrls, @status)   }
    $window.caption = "Chingu Example 7 - #{@descr}"
  end

  def ex8
    Example8.new
    #    ... There is probably a better way to do this...
  end
end


