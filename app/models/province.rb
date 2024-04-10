# app/models/province.rb
class Province < ApplicationRecord
    has_many :users

    validates :name, presence: true, uniqueness: true

  end
  

  