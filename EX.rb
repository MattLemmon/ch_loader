












































#
#  EX CLASS  EX CLASS  EX CLASS  EX CLASS  EX CLASS
#
class Ex < Chingu::GameState
	def initialize(num, descr, cntrls)
    @num = num
	  @descr = descr
	  @cntrls = cntrls
    super(options)

    @title1 = Chingu::Text.create(:text=>"Example #{@num} - #{@descr}" , :x=>280, :y=>150, :size=>28)

    @title2 = Chingu::Text.create(:text=>"- Press ENETER to start -" , :x=>270, :y=>210, :size=>24)

    @title3 = Chingu::Text.create(:text=>"Press Q for Menu" , :x=>300, :y=>500, :size=>20)

    $window.caption = "Chingu Example #{@num}  -  Controls: #{@cntrls}"

    self.input = { :enter  => :go, 
                   :return => :go,
                   :f      => :fart   }
  end

  def go
    x = "hi"
    puts x
    @title1.text = "EX   EX   EX   EX   EX   EX"
#    push_game_state(____)
  end

  def fart
  	puts "jhkwqbf34hr93h89778h43fio!!!"
  end
end