class TaxRates
    attr_reader :gst, :pst, :hst
  
    # Define the tax rates for each province as per the known information.
  TAX_RATES = {
    "AB" => { gst: 0.05, pst: 0.00, hst: 0.00 }, # Alberta
    "BC" => { gst: 0.05, pst: 0.07, hst: 0.00 }, # British Columbia
    "MB" => { gst: 0.05, pst: 0.07, hst: 0.00 }, # Manitoba
    "NB" => { gst: 0.00, pst: 0.00, hst: 0.15 }, # New Brunswick
    "NL" => { gst: 0.00, pst: 0.00, hst: 0.15 }, # Newfoundland and Labrador
    "NS" => { gst: 0.00, pst: 0.00, hst: 0.15 }, # Nova Scotia
    "ON" => { gst: 0.00, pst: 0.00, hst: 0.13 }, # Ontario
    "PE" => { gst: 0.00, pst: 0.00, hst: 0.15 }, # Prince Edward Island
    "QC" => { gst: 0.05, pst: 0.09975, hst: 0.00 }, # Quebec
    "SK" => { gst: 0.05, pst: 0.06, hst: 0.00 }, # Saskatchewan
    # Add other provinces or territories if necessary
  }.freeze

    def initialize(province_id)
      province_tax_rates = TAX_RATES[province_id.upcase] || {}
      @gst = province_tax_rates[:gst] || 0.0
      @pst = province_tax_rates[:pst] || 0.0
      @hst = province_tax_rates[:hst] || 0.0
    end
  
    def calculate_total_tax(amount)
      (amount * gst) + (amount * pst) + (amount * hst)
    end
  end
  