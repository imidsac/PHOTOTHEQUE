class Balance < ActiveRecord::Base
  default_scope {order(:exercice, :mois)}
end
