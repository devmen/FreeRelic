Rails.application.routes.draw do
  namespace :free_relic do
    resources :dashboard, :only => [:index, :destroy]
    resources :metrics, :only => [:index, :destroy]
  end

  match 'free_relic' => 'free_relic/dashboard#index', :as => :free_relic_index
  match 'free_relic/metrics/:type/(:sort_by)' => 'free_relic/metrics#index', :as => :free_relic_metrics
end

