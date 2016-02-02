class UsersController < ApplicationController

	def my_portfolio
		@stocks_of_user = current_user.stocks
		@user = current_user
	end

end
