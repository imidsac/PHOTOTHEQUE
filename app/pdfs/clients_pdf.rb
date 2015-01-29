class ClientsPdf < PdfA4p
  def initialize(clients)
    super()
    @clients = clients
    #@view = view
    #text "Order goes here"
    header
    table_entier
    footer

  end


  def table_entier
    move_down 20
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
      self.cell_style = {:border_lines => [:dotted]}

      self.row_colors = ['ECECEC', 'FFFFFF']
      self.position = :center
      self.header = true


    end


  end

  def item_header
    ['N°', {content: "Client", colspan: 2}, 'Adresse', 'Phone', 'E-mail', 'Type']
  end

  def item_rows
    @id = 0

    @clients.map do |item|
      [
          @id+=1,
          item.nom,
          item.prenom,
          item.address,
          item.phone,
          item.email,
          if item.type_cl=='o'
            'Ordinnaire'
          else
            item.type_cl=='g'
            'Grossiste'
          end
      ]
    end
  end

  def ligne_table
    [item_header, *item_rows]
  end


end