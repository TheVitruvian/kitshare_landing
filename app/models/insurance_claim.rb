class InsuranceClaim < ActiveRecord::Base

  #attributes
  attr_accessible :claim_number, :cost, :closed, :closed_date, :insurance_policy_id

  #validations


  #ownership
  belongs_to :insurance_policy
  

end