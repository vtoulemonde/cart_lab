Rails.application.routes.draw do
  root 'welcome#index'
  resources :books
  resources :items

  delete 'items' => 'items#destroy'
  
end
