module TheBanners
  module Model
    extend ActiveSupport::Concern

    LOCATIONS = %w(top-800-150 sidebar-200-400 bottom-800-150)

    included do
      has_attached_file :image,
        styles: { small: '200x200>' },
        path: TheBanners.config.images_path,
        url:  TheBanners.config.images_url

      validates_inclusion_of  :state, in: %w(draft publication)
      validates_presence_of   :w, :h
      validates_uniqueness_of :name

      # validates_inclusion_of :location, in: LOCATIONS

      validates :image, attachment_presence: false
      validates_attachment_content_type :image, content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"]

      before_save do
        self.slug = self.name.to_slug_param
      end

      scope :for_location, ->(location) { where(location: location) }
      scope :published, -> { where(state: 'publication') }


      def inc_view_count!
        update_columns(view_counter: self.view_counter + 1)
      end

      def inc_click_count!
        update_columns(click_counter: self.click_counter + 1)
      end

      def published?
        state == 'publication'
      end

      def insert
        banner = self
        target = "/banners/proxy/?id=#{ banner.id }"

        %Q(
          <div style="position:relative;margin:0;padding:0;">
            <iframe
              src="#{ target }"
              width="#{  self.w }"
              height="#{ self.h }"
              border="0"
              allowtransparency="true"
              frameborder="0"
              scrolling="no"
              z-index:4;
            ></iframe>

            #{ banner.link if banner.uri.present? }
          </div>
        )
      end

      def link
        banner = self
        target = "/banners/click/?id=#{ banner.id }"

        %Q(
          <a
            href="#{ target }"
            style="
              position:absolute;
              top:0;left:0;
              display:inline-block;
              width: #{ banner.w }px;
              height:#{ banner.h }px;
              z-index:5;
            "
          ></a>
        )
      end

      def self.locations
        LOCATIONS
      end
    end

  end
end
