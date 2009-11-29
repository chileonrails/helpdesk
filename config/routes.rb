ActionController::Routing::Routes.draw do |map|
  # map.resources :tickets, :has_many => :comments
  map.resources :tickets do |ticket|
    ticket.resources :comments
  end
  map.resources :statuses

  map.resources :users
  map.resources :user_sessions

  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.signup 'signup', :controller => 'users', :action => 'new'

  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'

  map.root :tickets
end

