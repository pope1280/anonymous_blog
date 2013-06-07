get '/tag/:id' do
  tag = Tag.find(params[:id])
  posts = []
  Post.all.each {|post| posts << post if post.tags.include?(tag) }
  @posts_and_tag = {posts: posts, tag: tag}
  erb :posts_by_tag
end
