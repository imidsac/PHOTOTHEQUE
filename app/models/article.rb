class Article < ActiveRecord::Base
	#default_scope { where("articles.id != ? ", -1)}
	has_many :alignes#, -> { where.not(id: Aligne.where("achat_id = ?", achat_id))}
	has_many :ventelignes
	has_many :achats, through: :alignes
	has_many :ventes, through: :ventelignes

	searchable do
    text :name, :reference, :etat
    #text :reference#, :publish_month
=begin
    text :comments do
      comments.map(&:content)
    end
    time :published_at
    string :publish_month
=end
  end
  
  def publish_month
    published_at.strftime("%B %Y")
  end
	
end
