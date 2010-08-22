module BlogHelper

  def link_to_blog_post(post, options = {})
    text = options[:text] || false
    link_to((text || post.title), 
      blog_post_path(:year => post.year, :month => post.month, :day => post.day, :id => post.to_param),
      options)
  end
  
  def formatted_post(post)
    post.body.gsub!(/\[\[(.*?)(\|(.*?))?\]\]/) {
      unless $1 == "more"
        post = Post.find($1)
        post ? link_to_blog_post(post, :text => $3) : "Beitrag '#{$1}' nicht gefunden!"
      end
    }
    BlueCloth.new(post.body).to_html
  end

  def formatted_post_excerpt(post)
    splitted = post.body.split("[[more]]")
    if splitted.size == 2
      post.body = "#{splitted.first} (#{link_to_blog_post(post, :text => 'weiterlesen', :class => 'more')})"
    end
    
    formatted_post(post)
  end
  
end
