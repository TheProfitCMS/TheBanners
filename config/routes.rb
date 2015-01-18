module TheBanners
  # TheBanners::Routes.mixin(self)

  class Routes
    def self.mixin mapper

      mapper.resources :banners, except: [:show] do
        mapper.collection do
          mapper.get :proxy
          mapper.get :click
        end
      end

    end
  end

end
