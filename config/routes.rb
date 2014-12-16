module Baeneroid
  # Baeneroid::Routes.mixin(self)

  class Routes
    def self.mixin mapper

      mapper.get 'ping' => 'baeneroid#ping'
      mapper.get 'proxy' => 'baeneroid#proxy'

    end
  end

end
