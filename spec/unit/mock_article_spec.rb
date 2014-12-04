require_relative '../../mock_article'

class TestMockArticle < Test::Unit::TestCase

  def setup
    @mock_article = MockArticle.new
  end

  def test_author
    assert_match(%r{[A-Z]\w* [A-Z]\w*}, @mock_article.generate_author)
  end

  def test_title
    assert_match(%r{[A-Z]\w*( \w+){0,4}}, @mock_article.generate_title)
  end

  def test_sentence
    assert_match(%r{[A-Z]\w*( \w+){4,9}\.}, @mock_article.generate_sentence)
  end

  def test_content
    assert_match(%r{([A-Z]\w*( \w+){4,9}\.)( \1){0,4}}, @mock_article.generate_content)
  end

  def test_random
    assert_operator(100, :>=, @mock_article.random_number)
    assert_operator(0, :<, @mock_article.random_number)
  end
end