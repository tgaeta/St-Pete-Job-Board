class AddRemoteLogoToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :remote_logo, :string
  end
end
