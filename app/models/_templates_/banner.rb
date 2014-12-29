class Banner < ActiveRecord::Base
  include ::TheBanners::Model

  has_attached_file :image, styles: { small: '200x200>' } #, default_url: "/images/:style/missing.png"

  validates_uniqueness_of :name
  validates_inclusion_of :state, in: %w(draft publication)
  validates_presence_of :w, :h

  validates :image, attachment_presence: false
  validates_attachment_content_type :image, content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"]

  before_save do
    self.slug = self.name.to_slug_param
  end


  def iframe_content
    %Q(
      <img src="#{image.url}" alt="#{self.slug}"/>
      #{self.html_code}
    )
  end


  def self.insert_chunk(slug, target)
    banner = where(slug: slug, state: 'publication').first
    return nil unless banner

    %Q(
      <div style="position:relative;">
        <iframe src="#{target}?id=#{banner.id}" width="#{banner.w}" height="#{banner.h}"> </iframe>

        <a href="#{target}?id=#{banner.id}&click=true"
          style="position:absolute; top:0; left:0; display:inline-block; width:#{banner.w}px; height:#{banner.h}px; z-index:5;"></a>
      </div>
    )
  end

end
