class VentePdf < PdfA5p
  def initialize(vente, ventelignes, cli, bou, view)
    super()

    @vente = vente
    @ventelignes = ventelignes
    @cli = cli
    @bou = bou
    #@total_gros = total_gros
    #@total_detail = total_detail
    @view = view

    header
    table_entier_cli
    table_entier
    footer


  end


  ## Table de info clisseur ......

  def table_entier_cli
    move_down 1
    table table_info_cli do
      style(
          row(0),
          font: "Times-Roman",
          :font_size => 8,
          :background_color => 'AFB8BE',
          :style => [:bold, :italic],
          :align => :center
      )
      style(
          row(1),
          :font_style => :bold,
          :font_size => 6,
          :padding => [5, 10, 5, 10],
          :border_lines => [:dotted],
          #:border_color => ('ff00ff'),
          :align => :center
      )
      self.position = :center
    end
  end

  def table_info_cli
    [table_thead_cli, table_tbody_cli]
  end

  def table_thead_cli
    [
        {content: 'Date' },
        {content: 'Client' },
        {content: 'Total'},
        {content: 'Etat de vente'}
    ]
  end

  def table_tbody_cli
    [

        {content: "#{@vente.date_vente.strftime("%d %b %Y A %H:%M")}" },

        if @vente.client_id != -1
          {content: "#{@cli.nom}"}

        elsif @vente.client_id == -1 && @vente.boutique_id == -1
          {content: "#{@vente.client_libre}"}

        elsif @vente.boutique_id != -1
          {content: "#{@bou.name}"}
        end,

        {content: "#{@view.number_to_currency(@vente.somme, precision: 0,  unit: " CFA", format: "%n %u")}"},

        if @vente.etat_vente =='t'
          {content: 'Totalement livret'}
        elsif @vente.etat_vente =='p'
          {content: 'Partiellement livret'}
        else
          {content: 'Non livret'}
        end

    ]
  end

  ## Table de ventelignes ......
  def table_entier
    move_down 5
    table ligne_table do
      style(
          rows(1..-1).column(0),
          :font_size => 8,
          :align => :center
      )
      style(
          rows(1..-1).columns(3..-1),
          :align => :right,
          :font_size => 8,
          :style => [:italic]
      )

      style(
          row(0),
          font: "Times-Roman",
          :background_color => 'AFB8BE',
          :style => [:bold, :italic],
          :font_size => 8,
          :align => :center
      )

      style(
          row(0),
          :font_style => :bold,
          :font_size => 8,
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
      #self.header = true


    end


  end

  def item_header
    [
        {content: 'N°'},
        {content: 'Produit', colspan: 2},
        {content: 'Qt'},
        {content: 'P.u'},
        {content: 'Montant'}
    ]
  end
=begin
  def item_header2
    [
        {content: 'P.u' },
        {content: 'Montant' },
        {content: 'P.u' },
        {content: 'Montant' }
    ]
  end
=end

  def item_rows
    @id = 0

    @ventelignes.map do |item|
      [
          @id+=1,
          item.name,item.reference,
          @view.number_to_currency(item.qte, precision: 0,  unit: "", format: "%n %u") ,
          @view.number_to_currency(item.prix_u, precision: 0,  unit: "", format: "%n %u"),
          @view.number_to_currency(item.montant, precision: 0,  unit: "", format: "%n %u")
      ]

    end
  end

  def total_ligne
    [
        {content: 'TOTAL', colspan: 5, size: 10, :align => :center, :font_style => :bold },
        {content: "#{@view.number_to_currency(@vente.somme, precision: 0,  unit: "", format: "%n %u")}", size: 10, :align => :center, :font_style => :bold}
    ]
  end

  def ligne_table
    [item_header, *item_rows, total_ligne]
  end

  ## Fin Table de ventelignes ......

end