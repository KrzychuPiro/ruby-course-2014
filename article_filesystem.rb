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

end