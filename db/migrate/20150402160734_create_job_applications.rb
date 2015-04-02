class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :resume
      t.text :cover_letter
      t.string :phone
      t.string :link
      t.references :job_post, index: true

      t.timestamps null: false
    end
    add_foreign_key :job_applications, :job_posts
  end
end
