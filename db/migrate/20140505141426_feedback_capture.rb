class FeedbackCapture < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :opinion
      t.text :comment
      t.string :email
      t.timestamps
    end
  end
end
