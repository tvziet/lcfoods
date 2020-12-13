module NewsHelper
  def five_notable_news
    all_notable_news  = News.notable.order(created_at: :desc)
    five_notable_news = all_notable_news.limit(5) if all_notable_news.any?
  end
end