class AddTaxRatesToProvinces < ActiveRecord::Migration[6.0]
  def change
    add_column :provinces, :tax_rates, :jsonb, default: {}
  end
end
