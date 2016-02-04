class UsersController < ApplicationController

	def my_portfolio
		@stocks_of_user = current_user.stocks
		@user = current_user
	end

	def my_friends
		@friendships = current_user.friends
	end

end
