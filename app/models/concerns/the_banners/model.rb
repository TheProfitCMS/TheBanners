module TheBanners
  module Model
    extend ActiveSupport::Concern

    def inc_view_count!
      conn.update("update `banners` set `view_counter` = `view_counter` + 1 where `id` = #{self.id}")
      true
    end

    def inc_click_count!
      conn.update("update `banners` set `click_counter` = `click_counter` + 1 where `id` = #{self.id}")
      true
    end

    def published?
      state == 'publication'
    end

    private

    def conn
      self.class.connection
    end

  end
end
