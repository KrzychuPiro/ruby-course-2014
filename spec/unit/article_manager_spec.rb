# encoding: utf-8

require_relative '../../article_manager'

class TestArticleManager < Test::Unit::TestCase

  def setup
    a_content = "Ala ma Kota 'Tiny, Ru'biego i takie tam' oraz ala ma psa"
    @bajka = Article.new('Bajka o kocie', a_content, '')
    @bajka.like!
    @bajka.like!
    @bajka.like!
    @bajka.dislike!

    b_content = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. Praesent sodales velit quis augue. Cras suscipit, urna at aliquam rhoncus, urna quam viverra nisi, in interdum massa nibh nec erat.'
    @lorem = Article.new('Lorem Ipsum', b_content , 'Cyceron')
    @lorem.like!
    @lorem.dislike!
    @lorem.like!
    @lorem.dislike!

    c_content = "Litwo! Ojczyzno maja! Ty jesteś jak zdrowie,\nIle cię trzeba cenić, ten tylko się dowie,\nKto cię stracił. Dziś piękność twą w całej ozdobie \nWidzę i opisuję, bo tęsknię po tobie."
    @inwokacja = Article.new('Inwokacja', c_content, 'Adam Mickiewicz')
    @inwokacja.dislike!
    @inwokacja.like!
    @inwokacja.dislike!

    @article_manager = ArticleManager.new([@bajka, @lorem, @inwokacja])
  end

  def test_bests
    assert_equal([@bajka, @lorem, @inwokacja], @article_manager.best_articles)
  end

  def test_worsts
    assert_equal([@inwokacja, @lorem, @bajka], @article_manager.worst_articles)
  end

  def test_best
    assert_equal(@bajka, @article_manager.best_article)
  end

  def test_worst
    assert_equal(@inwokacja, @article_manager.worst_article)
  end

  def test_popular
    assert_equal(@bajka, @article_manager.most_popular_article)
  end

  def test_include
    assert_equal([@lorem], @article_manager.include?('Proin nibh augue'))
  end

  def test_authors
    assert_equal(['', 'Cyceron', 'Adam Mickiewicz'], @article_manager.authors)
  end

  def test_number_of_authors
    assert_equal(3, @article_manager.number_of_authors)
  end

  def test_votes
    assert_equal(11, @article_manager.votes)
  end
end