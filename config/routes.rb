module Baeneroid
  # Baeneroid::Routes.mixin(self)

  class Routes
    def self.mixin mapper

      mapper.get :ping

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
