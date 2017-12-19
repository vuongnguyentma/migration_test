class CreatePassports < ActiveRecord::Migration[5.1]
  def change
    create_table :passports do |t|
      t.string :employeeId
      t.string :name
      t.date :dob
      t.string :email
      t.string :project
      t.string :passport
      t.date :issue
      t.date :expire

      t.timestamps
    end
  end
end
