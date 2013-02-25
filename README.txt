

            -----------------------------------
           |                                   |
           |       Chingu Example Loader       |
           |                                   |
            -----------------------------------

      --     Requires Chingu Gem and Gosu Gem      --
  
    --    Tested on Ruby 1.9.1, 1.9.2, and 1.9.3     --

      --         Forking is encouraged!!           --


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$ ch_loader.rb

  loads the Chingu Examples from a Main Menu.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


GLOBAL CONTROLS:


Esc   Exit            => :exit

Q     Main Menu       => Main

W     Previous Menu   => pop_game_state

Z     Status Update   => puts $window.current_game_state

F     Fart Feature    => :fart


So far it loads Examples 1-5, and Examples 6-8 are stubbed in. 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


PROJECT GOALS:


1.  Move all the example files into the /ch_examples folder.
    I think $LOAD_PATH needs to be specified in order to
    accomplish this....
                        COMPLETED!  I figured it out!! Yes!!

                        Thanks to lol_o2 for pointing me in 
                        the right direction on this.

2.  Add more examples.
                        PENDING...

3.  Improve user interface.
                        PENDING...

4.  Add arrow-toggling of example selections.
                        NOTHING YET.

5.  Add Welcome GameState.
                        NOTHING YET.

6.  Upgrade Fart Feature.
                        NOTHING YET.


BUGS TO FIX:


1.  Problem with title loading (@descr).

2.  Problem with $window.caption-loading. 
    (Shows wrong caption in example gamestates).


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


    Thanks to spooner for suggesting that I try Chingu.


    Special thanks to ippa for providing Chingu.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~