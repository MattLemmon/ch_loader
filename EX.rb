
























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






















#
#  EX CLASS  EX CLASS  EX CLASS  EX CLASS  EX CLASS
#
class Ex < Chingu::GameState
	def initialize(num, descr, cntrls, example)
    @num = num
	  @descr = descr
	  @cntrls = cntrls
    @example = example
    super(options)
#    $window.caption = "Chingu Example #{@num} - #{@descr}          Press F for Fart Effect"
    @title1 = Chingu::Text.create(:text=>"Example #{@num} - #{@descr}" , :x=>280, :y=>150, :size=>28)

    @title2 = Chingu::Text.create(:text=>"- Press ENETER to start -" , :x=>270, :y=>210, :size=>24)

    @title3 = Chingu::Text.create(:text=>"Press Q for Menu" , :x=>300, :y=>500, :size=>20)

    self.input = { :enter  => :go, 
                   :return => :go    }
#    puts $window.current_game_state
#    puts $window.game_state_manager.current_game_state
  end

  def go
#    Game.new
#    x = "hi"
#    puts x
#    @title1.text = "EX   EX   EX   EX   EX   EX"
    puts @example
    push_game_state(@example)
  end

end