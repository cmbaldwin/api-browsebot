Rails.application.routes.draw do

	namespace :api, defaults: { format: :json } do
		namespace :v1 do
			resources :yahoo_data, only: [:index]
				get 'yahoo_data/get_auth_code' => 'yahoo_data#get_auth_code', as: 'get_yahoo_auth_code'
			post 'authenticate' => 'authentication#authenticate', as: 'authenticate'
		end
	end

	root to: "application#index"

end
