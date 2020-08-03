class Api::V1::YahooDataController < Api::ApplicationController

	def index
		yahoo_data = {yahoo: ['data', 'data'], my_yahoo: ['data', 'data']}
		
		render json: { results: yahoo_data }.to_json, status: :ok
	end

	def get_auth_code
		yahoo_data = {yahoo: ['test', 'test'], my_yahoo: ['test', 'data']}
		
		render json: { results: yahoo_data }.to_json, status: :ok
	end

end
