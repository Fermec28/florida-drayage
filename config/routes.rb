Rails.application.routes.draw do
  root "user#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => "/cable"
  
  get "conversations", to: "conversations#index"

  get "quotations", to: "quotations#index"

  post "quotation_validation", to: "quotations#validate" 

  resources :quotations do
    patch "invoices/:id", to: "invoices#upload"
  	resources :invoices do      
    end

    post "invoices/:id", to: "invoices#payment" 
    
  end 

  resources :conversations, only:[:create,:new,:destroy,:show] do
  	resources :messages, only:[:create]
  end

  get "cities", to: "cities#index"
  get "zipcodes", to: "cities#zipcodes"
  
end
