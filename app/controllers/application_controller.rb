class ApplicationController < ActionController::Base

	def index
		render json: { message: 'Welcome.', notice: notice, alert: alert }.to_json, status: :ok
	end

end
