class TaxRates
    # Load the rates just once to avoid reading the file multiple times
    RATES = YAML.load_file(Rails.root.join('config', 'tax_rates.yml'))['tax_rates']
  
    def self.for(province_code)
      RATES[province_code] || {}
    end
  end
  