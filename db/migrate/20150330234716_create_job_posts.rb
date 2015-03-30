class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.string :logo
      t.string :job_title
      t.text :job_description
      t.string :job_tag
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :job_posts, :companies
  end
end
