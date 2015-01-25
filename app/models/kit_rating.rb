class KitRating < ActiveRecord::Base
  #attributes
  attr_accessible :rating, :content, :author_id

  #validations
  validates :rating, :presence => {:message => 'Please provide a rating'}

  #ownership
  belongs_to :kit
  belongs_to :author, class_name: "User", :foreign_key => 'author_id'
  

end