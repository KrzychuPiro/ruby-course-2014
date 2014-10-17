class Article
  attr_reader :title, :content, :author
  
  def initialize(title, content, author = '')
    @title = title
    @content = content
    @author = author
    @likes = 0
    @dislikes = 0
    @created_at = Time.now
  end
  
  def like!
    @likes += 1
  end
    
  def dislike!
    @dislikes += 1
  end
    
  def positive_votes
    return @likes - @dislikes
  end
    
  def votes
    return @likes + @dislikes
  end
  
  def shortened_to(limit)
    if limit < 4
      return '...'
    else
      return @content[0..limit-4] + '...'
    end 
  end

  def include?(pattern)
    return @content.include? pattern
  end
  
  def words
    return @content.split(%r{[^\w'\w]})  # allow the words which include an apostrophe.
  end
  
  def distinct_words
    return self.words.uniq! { |s| s.downcase }
  end
  
  def to_s
    return @title
    # return ["\"" + @title + "\"", self.shortened_to(70), @author].join("\n")
  end
end
