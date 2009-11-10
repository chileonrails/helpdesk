ActionController::Routing::Routes.draw do |map|
  # map.resources :tickets, :has_many => :comments
  map.resources :tickets do |ticket|
    ticket.resources :comments
  end
  map.resources :statuses

  map.root :tickets
end
