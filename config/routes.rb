module Baeneroid
  # Baeneroid::Routes.mixin(self)

  class Routes
    def self.mixin mapper
      mapper.get 'baeneroid/proxy' => 'baeneroid#proxy', as: 'baeneroid_proxy'
      mapper.get 'baeneroid/ping' => 'baeneroid#ping', as: 'baeneroid_ping'

      mapper.get 'baeneroid/index' => 'baeneroid#index', as: 'baeneroid_index'

      mapper.get 'baeneroid/new' => 'baeneroid#new', as: 'new_baeneroid'
      mapper.get 'baeneroid/edit/:id' => 'baeneroid#edit', as: 'edit_baeneroid'

      mapper.post   'baeneroid' => 'baeneroid#create', as: 'create_baeneroid'
      mapper.patch  'baeneroid/:id' => 'baeneroid#update', as: 'update_baeneroid'
      mapper.delete 'baeneroid/:id' => 'baeneroid#destroy', as: 'destroy_baeneroid'
    end
  end

end
