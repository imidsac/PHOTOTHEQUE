class Prestation < ActiveRecord::Base
  has_many :prestationlignes, dependent: :destroy
  belongs_to :client
  belongs_to :employe
  accepts_nested_attributes_for :prestationlignes
end
