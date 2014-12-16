class BaeneroidCreateBannerStorages < ActiveRecord::Migration
  def change
    create_table :banner_storages do |t|
      t.string :name

      t.text :html_code, null: false
      t.text :uri, null: false

      t.integer :w
      t.integer :h

      t.integer :view_counter, default: 0
      t.integer :click_counter, default: 0

      t.string :state, null: false

      # t.timestamps
    end
  end
end
