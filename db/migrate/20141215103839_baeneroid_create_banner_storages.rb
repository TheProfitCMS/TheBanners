class BaeneroidCreateBannerStorages < ActiveRecord::Migration
  def change
    create_table :banner_storages do |t|
      t.string :name
      t.text :html_code
      t.integer :w
      t.integer :h
      t.text :uri
      t.integer :view_counter
      t.integer :click_counter
      t.string :state

      # t.timestamps
    end
  end
end
