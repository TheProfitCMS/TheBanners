module TheBanners
  module Model
    extend ActiveSupport::Concern

    LOCATIONS = %w(top-800-150 sidebar-200-400 bottom-800-150)

    included do
      has_attached_file :image, styles: { small: '200x200>' }, path: TheBanners.config.images_path

      validates_uniqueness_of :name
      validates_inclusion_of :state, in: %w(draft publication)
      # validates_inclusion_of :location, in: LOCATIONS
      validates_presence_of :w, :h

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

      def iframe_content
        %Q(
        <img src="#{image.url}" alt="#{self.slug}"/>
        #{self.html_code}
        )
      end

      def insert(target)
        %Q(
        <div style="position:relative;">
        <iframe src="#{target}?id=#{self.id}" width="#{self.w}" height="#{self.h}"> </iframe>

        <a href="#{target}?id=#{self.id}&click=true"
        style="position:absolute; top:0; left:0; display:inline-block; width:#{self.w}px; height:#{self.h}px; z-index:5;"></a>
        </div>
        )
      end

      def self.locations
        LOCATIONS
      end
    end

  end
end
