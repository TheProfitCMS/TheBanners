module Baeneroid
  module Model
    extend ActiveSupport::Concern

    validates_inclusion_of :state, in: %w(draft publication)

    before_create do
      draft!
    end

    def inc_view_count!
      conn.update("update `banner_storages` set `view_counter` = `view_counter` + 1 where `id` = #{self.id}")
      true
    end

    def inc_click_count!
      conn.update("update `banner_storages` set `click_counter` = `click_counter` + 1 where `id` = #{self.id}")
      true
    end

    def draft!
      update_attributes(state: 'draft')
    end

    def publication!
      update_attributes(state: 'publication')
    end

    private

    def conn
      self.class.connection
    end

  end
end