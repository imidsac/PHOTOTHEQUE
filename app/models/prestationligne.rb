class Prestationligne < ActiveRecord::Base
  belongs_to :prestation
  belongs_to :cadre
  belongs_to :formatphoto
end
