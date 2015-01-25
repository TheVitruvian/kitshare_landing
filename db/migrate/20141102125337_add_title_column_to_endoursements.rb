class AddTitleColumnToEndoursements < ActiveRecord::Migration
  def change
	  change_table (:endorsements) do |t|
      t.string :title
    end
  end
end
