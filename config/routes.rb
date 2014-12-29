module TheBanners
  # TheBanners::Routes.mixin(self)

  class Routes
    def self.mixin mapper
      mapper.get 'banners/proxy' => 'banners#proxy', as: 'banners_proxy'
      mapper.get 'banners/ping' => 'banners#ping', as: 'banners_ping'

      mapper.get 'banners/index' => 'banners#index', as: 'banners_index'

      mapper.get 'banners/new' => 'banners#new', as: 'new_banners'
      mapper.get 'banners/edit/:id' => 'banners#edit', as: 'edit_banners'

      mapper.post   'banners' => 'banners#create', as: 'create_banners'
      mapper.patch  'banners/:id' => 'banners#update', as: 'update_banners'
      mapper.delete 'banners/:id' => 'banners#destroy', as: 'destroy_banners'
    end
  end

end
