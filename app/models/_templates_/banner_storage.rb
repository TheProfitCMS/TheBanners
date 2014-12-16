class BannerStorage < ActiveRecord::Base
  include ::Baeneroid::Model

  validates_uniqueness_of :name
  validates_inclusion_of :state, in: %w(draft publication)

  before_create do
    draft!
  end

  def self.insert_chunk(name, target)
    banner = find_by_name name
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
