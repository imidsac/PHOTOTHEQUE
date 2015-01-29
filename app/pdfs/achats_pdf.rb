class AchatPdf < PdfA4l

  def initialize(achat, alignes, fourni, total_gros, total_detail, monait, view)
    super()
    @achat = achat
    @alignes = alignes
    @fourni = fourni
    @monait = monait
    @total_gros = total_gros
    @total_detail = total_detail
    @view = view

    header
    table_entier_fourni
    table_entier
    footer


  end


  ## Table de info fournisseur ......

  def table_entier_fourni
    move_down 1
    table table_info_fourni do
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

  def table_info_fourni
    [table_thead_fourni, table_tbody_fourni]
  end

  def table_thead_fourni
    [
        {content: 'Date'},
        {content: 'Fournisseur'},
        {content: 'Total'},
        {content: 'Etat de commande'}
    ]
  end

  def table_tbody_fourni
    [
        {content: "#{@achat.date_achat.strftime("%d %b %Y A %H:%M")}"},
        if @achat.fournisseur_id != -1
          {content: "#{@fourni.name_company}"}
        else
          {content: "#{@achat.fournisseur_libre}"}
        end,
        {content: "#{@view.number_to_currency(@achat.somme, precision: 0, unit: "#{@monait.code_money}", format: "%n %u")}"},
        if @achat.etat_achat =='t'
          {content: 'Totalement livret'}
        elsif @achat.etat_achat =='p'
          {content: 'Partiellement livret'}
        else
          {content: 'Non livret'}
        end
    ]
  end

  ## Table de Alignes ......
  def table_entier
    move_down 5
    table ligne_table do
      style(
          rows(1..-1).column(0),
          :font_size => 8,
          :align => :center
      )
      style(
          rows(1..-1).columns(1..2),
          :align => :left,
          :font_size => 8,
          :style => [:bold]
      )
      style(
          rows(1..-1).columns(3..-1),
          :align => :right,
          :font_size => 8,
          :style => [:italic]
      )
      style(
          row(0..1),
          font: "Times-Roman",
          :font_size => 8,
          :background_color => 'AFB8BE',
          :style => [:bold, :italic],
          :align => :center
      )

      style(
          row(0..1),
          :font_style => :bold,
          :font_size => 8,
          :padding => [5, 10, 5, 10],
          :border_lines => [:solid],
          #:border_color => ('ff00ff'),
          :align => :center
      )
      #style(row(4), padding: [12, 10], :font_style => :bold)
      #style(columns(1..4), :align => :center)
      self.cell_style = {:border_lines => [:dotted]}

      self.row_colors = ['ECECEC', 'FFFFFF']
      self.position = :center
      #self.header = true


    end
  end


  def item_header
    if @achat.monetaire_id == -1
    [
        {content: 'N°', rowspan: 2},
        {content: 'Produit', colspan: 2, rowspan: 2},
        {content: 'Qt', rowspan: 2},
        {content: 'P.u', rowspan: 2},
        {content: 'Montant', rowspan: 2},
        {content: 'Detail', colspan: 2},
        {content: 'Gros', colspan: 2}
    ]
    else
    [
        {content: 'N°', rowspan: 2},
        {content: 'Produit', colspan: 2, rowspan: 2},
        {content: 'Qt', rowspan: 2},
        {content: 'P.u', colspan: 2},
        {content: 'Montant', colspan: 2},
        {content: 'Detail', colspan: 2},
        {content: 'Gros', colspan: 2}
    ]
    end
  end

  def item_header2
    if @achat.monetaire_id == -1
    [
        {content: 'P.u'},
        {content: 'Montant'},
        {content: 'P.u'},
        {content: 'Montant'}
    ]
    else
    [
        {content: "#{@monait.code_money}"},
        {content: 'CFA'},
        {content: "#{@monait.code_money}"},
        {content: 'CFA'},
        {content: 'P.u'},
        {content: 'Montant'},
        {content: 'P.u'},
        {content: 'Montant'}
    ]
    end
  end

  def item_rows
    @id = 0

    @alignes.map do |item|
      if @achat.monetaire_id == -1
      [
          @id+=1,
          item.name, item.reference,
          @view.number_to_currency(item.qte, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.prix_u, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.montant, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.pdetail, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.pdetail*item.qte, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.pgros, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.pgros*item.qte, precision: 0, unit: "", format: "%n %u")
      ]
      else
      [
          @id+=1,
          item.name, item.reference,
          @view.number_to_currency(item.qte, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.prix_u, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.prix_u1, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.montant, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.montant1, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.pdetail, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.pdetail*item.qte, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.pgros, precision: 0, unit: "", format: "%n %u"),
          @view.number_to_currency(item.pgros*item.qte, precision: 0, unit: "", format: "%n %u")
      ]
      end
    end
  end

  def total_ligne
    if @achat.monetaire_id == -1
    [

        {content: 'TOTAL', colspan: 5, size: 10, :align => :center, :font_style => :bold},
        {content: "#{@view.number_to_currency(@achat.somme, precision: 0, unit: "", format: "%n %u")}", size: 9, :align => :center, :font_style => :bold},
        {content: ''},
        {content: "#{@view.number_to_currency(@total_detail, precision: 0, unit: "", format: "%n %u")}", size: 9, :align => :center, :font_style => :bold},
        {content: ''},
        {content: "#{@view.number_to_currency(@total_gros, precision: 0, unit: "", format: "%n %u")}", size: 9, :align => :center, :font_style => :bold}
    ]
    else
    [
        {content: 'TOTAL', colspan: 6, size: 10, :align => :center, :font_style => :bold},
        {content: "#{@view.number_to_currency(@achat.somme, precision: 0, unit: "", format: "%n %u")}", size: 9, :align => :center, :font_style => :bold},
        {content: "#{@view.number_to_currency(@achat.somme * @monait.valeur, precision: 0, unit: "", format: "%n %u")}", size: 9, :align => :center, :font_style => :bold},
        {content: ''},
        {content: "#{@view.number_to_currency(@total_detail, precision: 0, unit: "", format: "%n %u")}", size: 9, :align => :center, :font_style => :bold},
        {content: ''},
        {content: "#{@view.number_to_currency(@total_gros, precision: 0, unit: "", format: "%n %u")}", size: 9, :align => :center, :font_style => :bold}
    ]
    end
  end

  def ligne_table
    [item_header, item_header2, *item_rows, total_ligne]
  end

  ## Fin Table de Alignes ......




end