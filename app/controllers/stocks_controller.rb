class StocksController < ApplicationController

	def search
		if params[:stock]
			@stock = Stock.find_by_ticker(params[:stock])		# what is the params[:stock]
			@stock ||= Stock.new_from_lookup(params[:stock])
		end

		# debugger

		if @stock
			render partial: 'lookup'
			#render json: @stock
		else
			render status: :not_found, nothing: true  # What the hell is this?
		end
	end

end