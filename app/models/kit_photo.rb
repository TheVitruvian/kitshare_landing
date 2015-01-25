class KitPhoto < ActiveRecord::Base
  attr_accessible :primary, :image
  
  
  belongs_to :kit
  mount_uploader :image, ImageUploader



end
