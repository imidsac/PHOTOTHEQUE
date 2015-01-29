class ProduitPdf < PdfA4p
  def initialize(produits, categoriepro, view)
    super()
    @produits = produits
    @categoriepro = categoriepro
    #@produits_nb = produits_nb
    @view = view

    #@view = view
    #text "Order goes here"
    header
    table_entier_fourni
    table_entier
    footer

  end


  ## Table de info fournisseur ......

  def table_entier_fourni
    move_down 5
    table table_info_fourni do
      style(
          row(0),
          font: "Times-Roman",
          :size => 15,
          :background_color => 'AFB8BE',
          :style => [:bold, :italic],
          :align => :center
      )
      style(
          row(1),
          :font_style => :bold,
          :padding => [5, 10, 5, 10],
          :border_lines => [:dotted],
          #:border_color => ('ff00ff'),
          :align => :center
      )
      self.position = :center
    end
  end

  def table_info_fourni
    [table_thead_fourni, table_tbody_fourni]
  end

  def table_thead_fourni
    [
        {content: 'Category' },
        {content: 'Nombre de Produits' }

    ]
  end

  def table_tbody_fourni
    [
        {content: "#{@categoriepro.name}"},
        {content: "#{@produits.size}" }
    ]
  end

  ## Table de Alignes ......
  def table_entier
    move_down 5
    table ligne_table do
      style(
          rows(1..-1).column(0),
          :align => :center
      )
      style(
          rows(1..-1).columns(3..-1),
          :align => :right,
          :style => [:italic]
      )
      style(
          row(0),
          font: "Times-Roman",
          :size => 15,
          :background_color => 'AFB8BE',
          :style => [:bold, :italic],
          :align => :center
      )

      style(
          row(0),
          :font_style => :bold,
          :padding => [5, 10, 5, 10],
          :border_lines => [:solid],
          #:border_color => ('ff00ff'),
          :align => :center
      )
      #style(row(4), padding: [12, 10], :font_style => :bold)
      #style(columns(1..4), :align => :center)
      self.cell_style = { :border_lines => [:dotted] }

      self.row_colors = ['ECECEC', 'FFFFFF']
      self.position = :center
      self.header = true

      #item_rows.align = :centre
    end


  end

  def item_header
    [
        {content: 'N°'},
        {content: 'Produit', colspan: 2 },
        #{content: 'Stock'},
        #{content: 'Stock virtuell'},
        {content: 'Prix En-Detail'},
        {content: 'Prix En-Gros'}
    ]
  end


  def item_rows
    @id = 0

    @produits.map do |item|
      [
          @id+=1,
          item.name,item.reference,
          #@view.number_to_currency(item.stock, precision: 0,  unit: "", format: "%n %u")  ,
          #@view.number_to_currency(item.vstock, precision: 0,  unit: "", format: "%n %u"),
          @view.number_to_currency(item.pdetail, precision: 0,  unit: "", format: "%n %u"),
          @view.number_to_currency(item.pgros, precision: 0,  unit: "", format: "%n %u"),
      ]

    end
  end



  def ligne_table
    [item_header, *item_rows]
  end

  ## Fin Table de Alignes ......

end