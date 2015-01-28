class Monetaire < ActiveRecord::Base
  #default_scope {where("monetaires.id != ? ", -1)}
  has_many :achats
  scope :monait, -> { where("monetaires.id != ? ", -1) }
end
