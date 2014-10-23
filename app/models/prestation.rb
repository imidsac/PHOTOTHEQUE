class Prestation < ActiveRecord::Base
  belongs_to :client
  belongs_to :employe
end
