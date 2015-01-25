class KitAddIn < ActiveRecord::Migration
  def change
    
    create_table :kits do |t|
      t.belongs_to  :user
      t.string      :category
      t.string      :kind
      t.string      :sub_kind
      t.string      :title
      t.float       :daily_price
      t.float       :weekly_price
      t.float       :monthly_price
      t.string      :condition
      t.text        :description
      t.boolean     :insurance_required
      t.string      :location

      t.float       :latitude
      t.float       :longitude
      t.timestamps
    end

    create_table :endorsements do |t|
      t.belongs_to  :user
      t.references  :author
      t.float       :rating, :default => 0
      t.text        :content
      
      t.timestamps
    end

    create_table :kit_photos do |t|
      t.belongs_to  :kit
      t.string      :image
      t.boolean     :primary
    end
  end
end
