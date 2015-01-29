class PdfA4p < Prawn::Document

  # Often-Used Constants
  TABLE_ROW_COLORS = ["FFFFFF","DDDDDD"]
  #TABLE_ROW_COLORS = ['ECECEC', 'FFFFFF']
  TABLE_FONT_SIZE = 9
  TABLE_BORDER_STYLE = :grid

  def initialize(default_prawn_options={})
    super(
        :page_size => 'A4',
        :page_layout => :portrait,
        :margin => [20, 30, 20, 30]
    )
    font_size 10
  end

  def header(title=nil)
    logo = "#{Rails.root}/app/assets/images/malinuse.jpg"
    #logo = "#{Rails.root}/app/assets/images/sissoko.png"
    #logo = "#{Rails.root}/app/assets/images/abdoul.png"
    #logo = "#{Rails.root}/app/assets/images/bs.png"
    image logo, width: 520, height: 100, :position => :center  #pour portrait A4
    if title
      text title, size: 14, style: :bold_italic, align: :center
    end
  end

  def footer
    number_pages "<page> / <total>",
                 {:start_count_at => 1,
                  :page_filter => lambda { |pg| pg != 0 },
                  :at => [bounds.right - 30, 50],
                  :align => :left,
                  :size => 15}
  end

  # ... More helpers
end