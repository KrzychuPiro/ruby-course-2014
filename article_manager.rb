load "article.rb"

class ArticleManager
  def initialize(articles = [])
    @articles = articles
  end
  
  def worst_articles
    return @articles.sort { |a1, a2| a1.positive_votes <=> a2.positive_votes }
  end
  
  def best_articles
    return @articles.sort { |a1, a2| a2.positive_votes <=> a1.positive_votes }
  end
  
  def worst_article
    if @articles.length == 0
      return "No articles"
    else
      worst = @articles[0]
    end
    
    @articles.each do |a|
      if a.positive_votes < worst.positive_votes
        worst = a
      end
    end
    return worst
  end
  
  def best_article
    if @articles.length == 0
        return "No articles"
      else
        best = @articles[0]
      end
      
      @articles.each do |a|
        if a.positive_votes > best.positive_votes
          best = a
        end
      end
    return best
  end
  
  def most_popular_article 
    if @articles.length == 0
          return "No articles"
        else
          popular = @articles[0]
        end
        
        @articles.each do |a|
          if a.votes > popular.votes
            popular = a
          end
        end
    return popular
  end
  
  def include?(pattern)
    return @articles.select { |a| a.include? pattern }
  end
  
  def authors
    return @articles.map { |a| a.author }
  end
  
  def number_of_authors
    return @articles.uniq { |a| a.author }.length
  end
  
  def votes
    sum = 0
    @articles.each { |a| sum += a.votes }
    return sum
  end
  
  def <<(article)
    @articles << article
  end
  
  def to_s
    s = "List of articles:\n\n"
    @articles.each do |article|
      s += "   ***   \n"
      s += article.to_s
      s += "\n\n"
    end
    return s
  end
end