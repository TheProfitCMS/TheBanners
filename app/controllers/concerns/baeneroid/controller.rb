module Baeneroid
  module Controller
    extend ActiveSupport::Concern

    def ping
      render text: 'Pong'
    end

  end
end
