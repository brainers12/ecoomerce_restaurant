class Province < ApplicationRecord
    has_many :users

    attribute :tax_rates, :jsonb, default: {}
    
    validates :name, presence: true, uniqueness: true


  end
  

