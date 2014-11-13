load 'article.rb'

class MockArticle < Article
  @@WORD_LIST = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. Praesent sodales velit quis augue. Cras suscipit, urna at aliquam rhoncus, urna quam viverra nisi, in interdum massa nibh nec erat.'.split(%r{[^\w]+})
  @@LENGTH = @@WORD_LIST.length

  def initialize
    super(self.generate_title, generate_content, self.generate_author)
    self.random_number.times { self.like! }
    self.random_number.times { self.dislike! }
  end
  
  def generate_author
    @@WORD_LIST.sample(2).map{ |word| word.capitalize }.join(' ')
  end
  
  def generate_title
    @@WORD_LIST.sample(Random.rand(1..5)).join(' ').capitalize
  end
  
  def generate_sentence
    (@@WORD_LIST.sample(Random.rand(5..10)).join(' ').capitalize + '.')
  end

  def generate_content
    content = ''
    Random.rand(1..5).times { content += "#{ self.generate_sentence } " }
    content.rstrip
  end
  
  def random_number
    Random.rand(100)
  end
end