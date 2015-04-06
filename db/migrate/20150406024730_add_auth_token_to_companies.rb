class AddAuthTokenToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :auth_token, :string
  end
end
