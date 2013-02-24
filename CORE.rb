#
#     WINDOW CLASS        WINDOW CLASS        WINDOW CLASS     WINDOW CLASS   
#
class Core < Chingu::Window
  def initialize
    super(800,600)
    self.input = {:esc => :exit, :q => Menu}
    push_game_state(Menu)
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
class Menu < Chingu::GameState 
  def initialize(options = {})
    super
    @title0 = Chingu::Text.create(:text=>"Chingu Example Loader" , :x=>250, :y=>70, :size=>34)
    @title2 = Chingu::Text.create(:text=>"Press a Number (1-7) to choose your EXAMPLE" , :x=>230, :y=>190, :size=>22)
    @title3 = Chingu::Text.create(:text=>"Press Q at any time for MENU" , :x=>270, :y=>120, :size=>22)    
    @title4 = Chingu::Text.create(:text=>" " , :x=>290, :y=>300, :size=>28)

    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7 }
    $window.caption = "CHINGU EXAMPLE LOADER - MENU"
  end

  def ex1
    @title4.text = "Example 1 selected\n(ENTER to Continue)"
    @descr = "Basics"
    @cntrls = "Arrows"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
                 :enter  => Ex1.new, 
    	           :return => Ex.new(1, @descr, @cntrls)  }
  end
  
  def ex2
    @title4.text = "Example 2 selected\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
    	           :enter  => Ex2.new, 
    	           :return => Ex2.new   }
  end

  def ex3
    @title4.text = "Example 3 selected\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
    	           :enter  => Ex3.new, 
    	           :return => Ex3.new   }
  end

  def ex4
    @title4.text = "Example 4 selected\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
                 :enter  => Example4.new, 
                 :return => Example4.new   }
  end

  def ex5
    @title4.text = "Example 5 selected\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
                 :enter  => Example5.new, 
                 :return => Example5.new   }
  end

  def ex6
    @title4.text = "Example 6 selected\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
                 :enter  => Example6.new, 
                 :return => Example6.new   }
  end

  def ex7
    @title4.text = "Example 7 selected\n(ENTER to Continue)"
    self.input = { :"1"=>:ex1, :"2"=>:ex2, :"3"=>:ex3, :"4"=>:ex4, :"5"=>:ex5, :"6"=>:ex6, :"7"=>:ex7,
                 :enter  => Example7.new(7, "Fun!", "Press F for Fart"), 
                 :return => Example7.new(7, "Fun!", "Press F for Fart")   }
  end

  def ex8
    #          Is there a better way to do this?
  end
end




#
#     TEST CLASS     TEST CLASS     TEST CLASS     TEST CLASS     TEST CLASS   
#
class Test < Chingu::GameState
  def initialize(options = {})
    super
#    @m = Menu.m
    @title = Chingu::Text.create(:text=>"   TEST    ..#{options[:level].to_s}...   <Q> Menu   <P> Pause   <R> Restart" , :x=>20, :y=>10, :size=>22)
    @title2 = Chingu::Text.create(:text=>"Example Test", :x=>300, :y=>300, :size=>25)
    $window.caption = "  TEST  TEST  TEST  TEST  TEST  TEST  TEST  TEST  TEST  TEST"
    self.input = { :p => Pause }  # :q => Menu,
  end

end
