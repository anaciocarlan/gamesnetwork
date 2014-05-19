require 'test_helper'

class GameTest < ActiveSupport::TestCase
	
	def test_gamesdatabase 
		dblen = Game.all.size
		assert_not_equal(dblen,0,"No games in the database!")
	end
	
	def test_db	
		dblen = Game.all.size
		assert_not_equal(dblen,0,"The database doesn't have games")
	end
	
	def test_sizeof_file	
		x = Game.all.size
		f = File.new('.\test\unit\test.csv')
		Game.import(f)
		f.close
		y = Game.all.size
		assert_not_equal(x,y,"No imports have been made in the database.")
	end


	def test_publisher
		f = File.new('.\test\unit\test.csv')
		Game.import(f)
		f.close
		a = Game.first.publisher
		b = ""
		assert_not_equal(a,b,"Ther is no publisher")
	end
	
	def test_platforms
		f = File.new('.\test\unit\test.csv')
		Game.import(f)
		f.close
		a = Game.first.platforms
		b = ""
		assert_not_equal(a,b,"Ther are no platforms")
	end


	def test_games	# Testing if the import is valid: does it have a quote?
		f = File.new('.\test\unit\test.csv')
		Game.import(f)
		f.close
		a = Game.first.title
		b = ""
		assert_not_equal(a,b,"There is no game.")
	end





  # test "the truth" do
  #   assert true
  # end
end
