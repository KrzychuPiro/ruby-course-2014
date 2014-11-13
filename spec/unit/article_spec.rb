require_relative '../../article.rb'

class TestArticle < Test::Unit::TestCase

  def setup
    @article = Article.new('Bajka o kocie', "Ala ma Kota! 'Tiny i Ru'biego, oraz ala ma psa")
  end

  def test_simple
    assert_equal(1, @article.like!)
    assert_equal(2, @article.like!)
    assert_equal(1, @article.dislike!)
    assert_equal(2, @article.dislike!)
    assert_equal(3, @article.dislike!)

    assert_equal(-1, @article.positive_votes)
    assert_equal(5, @article.votes)

    assert_match('Ala ma Kota', @article.shortened_to(20))
    assert(@article.include? 'oraz ala ma')

    assert_equal('', @article.author)
    assert_equal(%w(Ala ma Kota 'Tiny i Ru'biego oraz ala ma psa), @article.words)
    assert_equal(%w(Ala ma Kota 'Tiny i Ru'biego oraz psa), @article.distinct_words)
    assert_match('Bajka o kocie', @article.to_s)
  end
end