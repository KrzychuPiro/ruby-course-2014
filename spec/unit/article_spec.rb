require_relative '../../article.rb'

class TestArticle < Test::Unit::TestCase

  def setup
    @article = Article.new('Bajka o kocie', "Ala ma Kota! 'Tiny i Ru'biego, oraz ala ma psa")
    @article.like!
    @article.like!
    @article.dislike!
    @article.dislike!
    @article.dislike!
  end

  def test_likes
    assert_equal(3, @article.like!)
  end

  def test_dislikes
    assert_equal(4, @article.dislike!)
  end

  def test_positive
    assert_equal(-1, @article.positive_votes)
  end

  def test_votes
    assert_equal(5, @article.votes)
  end

  def test_shorten
    assert_match('Ala ma Kota', @article.shortened_to(20))
  end

  def test_include
    assert(@article.include? 'oraz ala ma')
  end

  def test_author
    assert_equal('', @article.author)
  end

  def test_words
    assert_equal(%w(Ala ma Kota 'Tiny i Ru'biego oraz ala ma psa), @article.words)
  end

  def test_distincts
    assert_equal(%w(Ala ma Kota 'Tiny i Ru'biego oraz psa), @article.distinct_words)
  end

  def test_to_s
    assert_match('Bajka o kocie', @article.to_s)
  end

  def test_stamp
    assert_match(%r{(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday), (January|February|March|April|May|June|July|August|September|October|November|December) \d{1,2}, \d{4}}, @article.created_stamp)
  end
end