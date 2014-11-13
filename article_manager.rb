load "article.rb"

class ArticleManager
  def initialize(articles = [])
    @articles = articles
  end
  
  def worst_articles
    @articles.sort { |a1, a2| a1.positive_votes <=> a2.positive_votes }
  end
  
  def best_articles
    @articles.sort { |a1, a2| a2.positive_votes <=> a1.positive_votes }
  end
  
  def worst_article
    @articles.min  { |a1, a2| a1.positive_votes <=> a2.positive_votes }
  end
  
  def best_article
    @articles.max  { |a1, a2| a1.positive_votes <=> a2.positive_votes }
  end
  
  def most_popular_article
    @articles.max  { |a1, a2| a1.votes <=> a2.votes }
  end
  
  def include?(pattern)
    @articles.select { |a| a.include? pattern }
  end
  
  def authors
    @articles.map { |a| a.author }
  end
  
  def number_of_authors
    self.authors.length
  end
  
  def votes
    @articles.map { |a| a.votes }.inject(:+)
  end
  
  def <<(article)
    @articles << article
  end
  
  def to_s
    str = "List of articles:\n\n"
    @articles.each { |article| str += "   ***   \n#{article.to_s}\n\n" }
    str
  end
end