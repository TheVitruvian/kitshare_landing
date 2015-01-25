class Kit < ActiveRecord::Base

  #attributes
  attr_accessible :user, :category, :kind, :sub_kind, :title, :daily_price, :weekly_price, :monthly_price, :condition, :description, :insurance_required, :location, :photo1, :photo2, :photo3, :photo4, :photo5, :longtitude, :latitude

  #geocoder
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  #validations
  validates :category, :presence => {:message => 'Please input a category'}
  validates :kind, :presence => {:message => 'Please input a type'}
  

  #ownership
  has_many :rentals
  has_many :kit_ratings, dependent: :destroy
  has_many :kit_photos, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :kit_photos

end