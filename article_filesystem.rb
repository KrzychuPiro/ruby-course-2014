load 'article.rb'

class ArticleFilesystem
  ARTICLES_FOLDER = 'articles'

  def self.write(article)
    likes = (article.positive_votes + article.votes)/ 2
    dislikes = article.votes - likes
    f = File.new("#{ARTICLES_FOLDER}/#{article.title.tr(' ', '_')}", 'w')
    f.write("#{article.author}|#{article.title}|#{article.content}|#{likes}|#{dislikes}")
    f.close
  end

  def self.read(path)
    f = File.open(path, 'r')
    rough_article = f.readline.split('|')
    f.close
    article = Article.new(rough_article[1],rough_article[2],rough_article[0])
    rough_article[3].to_i.times { article.like! }
    rough_article[4].to_i.times { article.dislike! }
    article
  end

end