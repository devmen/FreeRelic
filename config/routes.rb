Rails.application.routes.draw do
  namespace :free_relic do
    root :to => 'pages#index'
  end
end

