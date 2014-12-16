class BaeneroidAddImageColumnsToBannerStorages < ActiveRecord::Migration
  def self.up
    add_attachment :banner_storages, :image
  end

  def self.down
    remove_attachment :banner_storages, :image
  end
end
