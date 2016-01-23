class Event < ActiveRecord::Base
    
    validates :name, presence: true, length: { maximum: 50 }
    geocoded_by :address
    after_validation :geocode
    
    has_many :ecomments
  
end
