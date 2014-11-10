class OrderPdf < Prawn::Document
	def initialize(prestation)
		super
		text "Prestation be yan no!!"
	end
end