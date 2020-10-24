Rails.application.routes.draw do
  
get("/", { :controller => "application", :action => "homepage"})
get("/forex", { :controller => "currency", :action => "forex"})
get("/forex/:first_currency", { :controller => "currency", :action => "first_currency"})
get("/forex/:first_currency/:second_currency", { :controller => "currency", :action => "second_currency"})
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
