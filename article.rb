require 'date'
require 'stamp'

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
    @likes - @dislikes
  end
    
  def votes
    @likes + @dislikes
  end
  
  def shortened_to(limit)
    if limit < 49
      '...'
    else
      @content[0..limit-4] + '...'
    end 
  end

  def include?(pattern)
    @content.include? pattern
  end
  
  def words
    @content.split(%r{[^\w'\w]}).select { |a| a != '' }
  end
  
  def distinct_words
    self.words.uniq! { |s| s.downcase }
  end
  
  def to_s
    @title
  end

  def created_stamp
    puts Date.parse(@created_at.to_s).stamp('Sunday, May 1, 2000')
  end
end
