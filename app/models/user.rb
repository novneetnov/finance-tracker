class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :user_stocks
	has_many :stocks, through: :user_stocks
	has_many :friendships
	has_many :friends, through: :friendships

	def can_add_stock?(ticker_symbol)
		under_stock_limit? and not stock_already_added?(ticker_symbol)	
	end

	def under_stock_limit?
		user_stocks.count < 10
	end

	def stock_already_added?(ticker_symbol)
		stock = Stock.find_by_ticker(ticker_symbol)
		return user_stocks.include?(stock)
	end

	def full_name
		return "#{self.first_name} #{self.last_name}".strip if self.first_name || self.last_name
		"Anonymous"
	end

end
