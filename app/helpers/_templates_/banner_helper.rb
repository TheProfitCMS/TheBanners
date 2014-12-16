module BannerHelper

  def insert(name)
    banner = BannerStorage.find_by_name name
    return '' unless banner

    body = "<iframe id=\"banneroid-#{banner.name}\" src=\"#{banneroid_proxy_url}?id=#{banner.id}\" width=\"#{banner.w}\" height=\"#{banner.h}\"></iframe>"
    wrapper = "<a href=\"#\" target=\"banneroid-#{banner.name}\">"

    body + wrapper
  end
end
