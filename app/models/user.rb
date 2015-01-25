class User < ActiveRecord::Base
  'require JSON'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :first_name, :last_name, :user_name, :address, :postcode, :rating, 
                  :last_3_endorsements, :insurance, :profile_picture, :replies_percentage, :email, 
                  :password, :password_confirmation, :remember_me, :reset_password_token, 
                  :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, 
                  :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :role,
                  :bio, :activities, :why_on, 


  #messaging setup
  acts_as_messageable

  #validations
  validates :first_name, :presence => {:message => 'We need your first name I\'m afraid'}
  validates :last_name, :presence => {:message => 'We need your surname I\'m afraid'}
  validates :user_name, :presence => {:message => 'Please choose a username'}, :uniqueness => {:message => 'Sorry that username has already been taken'}
  validates :email, :presence => {:message => 'Please put in an email address'}, :uniqueness => {:message => 'Sorry that email address is already registered'}
  validates :address, :presence => {:message => 'We need to know where the kit is located!'}
  validates :postcode, :presence => {:message => 'We need to know where the kit is located!'}



  #ownerships
  has_many  :kits
  has_many  :kit_ratings, through: :kits
  has_many  :rentals
  has_many  :insurance_policies
  has_many  :insurance_claims, through: :insurance_policies
  has_many  :endorsements

  #image uploader
  mount_uploader :profile_picture, ImageUploader

  def deserialise_endorsements
    return JSON.parse(self.last_3_endorsements)
  end
  
  def update_endorsements
    self.last_3_endorsements = self.endorsements.last(3).to_json(:only => [ :rating, :title, :content, :author_id ])
    self.rating = self.endorsements.average(:rating).to_f
    self.save
  end
  
  private

  #mailboxer functions
  def name
    user_name
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    email
    #if false
    #return nil
  end

  def has_insurance
    # Pull end date of insurance when made.
  end

end