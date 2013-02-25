



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
	def initialize(n, descr, cntrls, example)
    @n = n
	  @descr = descr
	  @cntrls = cntrls
    @example = example
    super(options)
    $window.caption = "Chingu Example #{@n} - #{@descr}"
    @title1 = Chingu::Text.create(:text=>"Example #{@n} - #{@descr}" , :x=>110, :y=>130, :size=>52)

    @title2 = Chingu::Text.create(:text=>" Controls:" , :x=>120, :y=>230, :size=>42)

    @title3 = Chingu::Text.create(:text=>"#{@cntrls}" , :x=>290, :y=>230, :size=>42)

    @title0 = Chingu::Text.create(:text=>"Enter to Continue" , :x=>110, :y=>350, :size=>46)


#    @title4 = Chingu::Text.create(:text=>"W  -  Prev Menu" , :x=>8, :y=>32, :size=>20)
#    @title5 = Chingu::Text.create(:text=>"F  -  Fart Feature" , :x=>10, :y=>54, :size=>20)
#    @title6 = Chingu::Text.create(:text=>"Z  -  Status Log" , :x=>10, :y=>76, :size=>20)


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

  def setup
    $window.caption = "Chingu Example #{@n} - #{@descr}"
  end

end