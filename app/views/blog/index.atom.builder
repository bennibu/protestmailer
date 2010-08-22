atom_feed(:url => blog_url(:format => :atom)) do |feed|
  feed.title("Ausgekohlt.net - Newsfeed")
  feed.updated(@posts.first ? @posts.first.created_at : Time.now.utc)

  for post in @posts
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(formatted_post(post), :type => 'html')
    end
  end
end