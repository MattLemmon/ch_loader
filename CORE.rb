
#
#     WINDOW CLASS        WINDOW CLASS        WINDOW CLASS     WINDOW CLASS   
#
class Game < Chingu::Window
  def initialize
    super(800,600)
    self.input = {:esc => :exit, :q => Menu}
    
    push_game_state(Menu)
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
    $window.caption = "  TEST  TEST  TEST  TEST  TEST"
    self.input = { :p => Pause }  # :q => Menu,
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
    @title0 = Chingu::Text.create(:text=>"Chingu Example Loader" , :x=>230, :y=>160, :size=>22)
    @title = Chingu::Text.create(:text=>" " , :x=>230, :y=>200, :size=>22)
    @title2 = Chingu::Text.create(:text=>"Press a Number (1-4) to choose your EXAMPLE" , :x=>240, :y=>100, :size=>22)
    @title3 = Chingu::Text.create(:text=>"Press Q at any time for MENU" , :x=>260, :y=>280, :size=>22)    


#    @title1 = Chingu::Text.create (:text=>"Press a Number (1-4) to choose your EXAMPLE" , :x=>100, :y=>100, :size=>32)
#    @title2 = Chingu::Text.create (:text=>"Press Q at any time for MENU" , :x=>300, :y=>400, :size=>24)
    self.input = { :"1" => :ex1, :"2" => :ex2, :"3" => :ex3, :"4"=>:ex4 }
    $window.caption = "CHINGU EXAMPLE LOADER - MENU"
  end

  def ex1
    @title.text = "Example 1 selected (Enter to Continue)"
    self.input = { :enter  => Ex1.new, 
    	           :return => Ex1.new, 
    	           :"2" => :ex2, :"3" => :ex3, :"4"=>:ex4  }
  end
  
  def ex2
    @title.text = "Example 2 selected (Enter to Continue)"
    self.input = { :"1" => :ex1, :"3" => :ex3, :"4"=>:ex4,
    	           :enter  => Ex2.new, 
    	           :return => Ex2.new   }
  end

  def ex3
    @title.text = "Example 3 selected (Enter to Continue)"
    self.input = { :"1" => :ex1, :"2" => :ex2, :"4"=>:ex4,
    	           :enter  => Example3.new, 
    	           :return => Example3.new   }
  end

  def ex4
    @title.text = "Example 4 selected (Enter to Continue)"
    self.input = { :"1" => :ex1, :"2" => :ex2, :"3"=>:ex3,
                 :enter  => Example4.new, 
                 :return => Example4.new   }
  end
end
