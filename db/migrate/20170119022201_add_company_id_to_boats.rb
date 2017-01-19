class AddCompanyIdToBoats < ActiveRecord::Migration[5.0]
  def change
    add_column :boats, :company_id, :integer
  end
end
