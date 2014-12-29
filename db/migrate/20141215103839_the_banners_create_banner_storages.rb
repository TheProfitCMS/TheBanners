class TheBannersCreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.string :slug

      t.text :html_code, null: false
      t.text :uri, null: false

      t.integer :w
      t.integer :h

      t.integer :view_counter, default: 0
      t.integer :click_counter, default: 0

      t.string :state, null: false

      # t.timestamps
    end

    add_index :banners, :state
    add_index :banners, :view_counter
    add_index :banners, :click_counter
  end
end
