Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :days do
    resources :days, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :days, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :days, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
