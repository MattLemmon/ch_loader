#!/usr/bin/env ruby
require 'rubygems' rescue nil
$LOAD_PATH.unshift File.join(File.expand_path(__FILE__), "..", "..", "lib")
require 'chingu'
include Gosu

#
# A minimalistic Chingu example.
# Chingu::Window provides #update and #draw which calls corresponding methods
# for all objects based on Chingu::Actors
#
# Image["picture.png"] is a deployment safe shortcut to Gosu's Image.new and
# supports multiple locations for "picture.png"
# By default current dir, media\ and gfx\ is searched. To add own directories:
#
# Image.autoload_dirs << File.join(self.root, "data", "my_image_dir")  
# 
class Ex1 < Chingu::GameState
  def initialize #(options = {})
    super
#    super #(640,480,false)              # leave it blank and it will be 800,600,non fullscreen
    $window.caption = "Chingu Example 1  -  Controls: ARROWS"
    self.input = { :escape => :exit } # exits example on Escape
    
    @player = Player.create(:x => 200, :y => 200, :image => Image["spaceship.png"])
    @player.input = { :holding_left => :move_left, :holding_right => :move_right, 
                      :holding_up => :move_up, :holding_down => :move_down }
  end
  
  def update
    super
    $window.caption = "FPS: #{$window.fps} milliseconds_since_last_tick: #{$window.milliseconds_since_last_tick}"
  end
end

class Player < Chingu::GameObject  
  def move_left;  @x -= 2; end
  def move_right; @x += 2; end
  def move_up;    @y -= 2; end
  def move_down;  @y += 2; end
end


# Game.new.show