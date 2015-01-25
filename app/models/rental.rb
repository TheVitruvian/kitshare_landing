class Rental < ActiveRecord::Base

  #attributes
  attr_accessible :user, :renter_id, :kit_id, :start_date, :end_date, :cost, :status

  #validations
  validates :renter_id, presence: true
  validates :kit_id, presence: true
  validates :start_date, :presence => {:message => 'Please input a start date'}
  validates :end_date, :presence => {:message => 'Please input an end date'}
  validates :cost, presence: true
  validates :status, presence: true
  
  #ownership
  belongs_to :user
  belongs_to :renter, class_name: "User", :foreign_key => 'renter_id'
  belongs_to :kit

  

end