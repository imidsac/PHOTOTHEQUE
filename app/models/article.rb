class Article < ActiveRecord::Base
	#default_scope { where("articles.id != ? ", -1)}
	has_many :alignes, -> {order('articles.name DESC')}
	has_many :ventelignes
	has_many :achats, through: :alignes
	has_many :ventes, through: :ventelignes

	searchable do
    text :name 
    text :reference 
    text :etat
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
