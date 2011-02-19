Rails.application.routes.draw do
  namespace :free_relic do
    resources :metrics, :only => [:index, :destroy]
  end
end
