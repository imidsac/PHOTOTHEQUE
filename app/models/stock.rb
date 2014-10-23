class Stock < ActiveRecord::Base
  belongs_to :cadre
  belongs_to :article
end
