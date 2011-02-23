Rails.application.routes.draw do
  namespace :free_relic do
    resources :metrics, :only => [:index, :destroy]
  end

  match 'free_relic' => 'free_relic/metrics#index', :as => :free_relic_index
end

