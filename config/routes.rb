Rails.application.routes.draw do
  get "/transactions" => "transactions#index"
  post "/transactions" => "transactions#create"
end
