module Baeneroid
  # Baeneroid::Routes.mixin(self)

  class Routes
    def self.mixin mapper

      mapper.resources :baeneroid, only: [] do
        mapper.collection do
          mapper.get :ping
          mapper.get :proxy
        end
      end

      # mapper.resources :comments, only: [] do
      #   mapper.collection do
      #     mapper.get :total_draft
      #     mapper.get :total_published
      #     mapper.get :total_deleted
      #     mapper.get :total_spam
      #   end
      # end
      #
    end
  end

end
