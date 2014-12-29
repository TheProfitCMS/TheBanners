module TheBanners
  # TheBanners::Routes.mixin(self)

  class Routes
    def self.mixin mapper
      mapper.get 'the_banners/proxy' => 'the_banners#proxy', as: 'the_banners_proxy'
      mapper.get 'the_banners/ping' => 'the_banners#ping', as: 'the_banners_ping'

      mapper.get 'the_banners/index' => 'the_banners#index', as: 'the_banners_index'

      mapper.get 'the_banners/new' => 'the_banners#new', as: 'new_the_banners'
      mapper.get 'the_banners/edit/:id' => 'the_banners#edit', as: 'edit_the_banners'

      mapper.post   'the_banners' => 'the_banners#create', as: 'create_the_banners'
      mapper.patch  'the_banners/:id' => 'the_banners#update', as: 'update_the_banners'
      mapper.delete 'the_banners/:id' => 'the_banners#destroy', as: 'destroy_the_banners'
    end
  end

end
