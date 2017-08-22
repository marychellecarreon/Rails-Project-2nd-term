class Milk < ActiveRecord::Base
    belongs_to :user
    has_many :reviews
    has_many :buys
    
    geocoded_by :city
after_validation :geocode, :if => :city_changed?

 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
