Rails.application.routes.draw do
  namespace :api do
    namespace :robot do
      post ':robot_id/orders', to: 'orders#command'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
                        