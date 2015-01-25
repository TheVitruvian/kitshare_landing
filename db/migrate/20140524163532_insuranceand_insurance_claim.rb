class InsuranceandInsuranceClaim < ActiveRecord::Migration
  def change

    create_table :insurance_policies do |t|
      t.timestamps
      t.belongs_to  :user
      t.integer     :policy_number
      t.float       :price
      t.date        :start_date
      t.date        :end_date
    end

    create_table :insurance_claims do |t|
      t.timestamps
      t.integer     :claim_number
      t.float       :cost
      t.boolean     :closed
      t.date        :closed_date
      t.belongs_to  :insurance_policy
    end
  end
end
