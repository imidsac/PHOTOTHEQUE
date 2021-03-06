class PresPdf < Prawn::Document
  def initialize(prestation, prestationlignes, cli)
  	super(top_margin: 70)
  	@prestation = prestation
  	@prestationlignes = prestationlignes
    @cli = cli

  	#@view = view
    #text "Order goes here"
    header
    line_items
  end
 
  def header
    #This inserts an image in the pdf file and sets the size of the image
    logo = "#{Rails.root}/app/assets/images/images.jpg"
    image logo, width: 130, height: 150
    text "Order \##{@prestation.id}", size: 30, style: :bold
    text "Order \##{@prestation.somme}", size: 30, style: :bold
    text "Client :  \##{@cli.nom}", size: 30, style: :bold

  end

  def line_items
    move_down 20
    table lignetable do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def lignetable
    [['Produit', 'Qte', 'Prix_unitaire', 'Montant']] +
    @prestationlignes.map do |item|
      [item.dimention, item.qte, item.prix_u, item.montant]
    end
  end
 
  
end