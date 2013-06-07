def extract_tags(tag_string)
  tag_string.split(",").map { |t| t.strip }
end

get '/posts' do
  @posts = Post.all
  erb :posts
end

get '/post/new' do
  erb :new_post
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :show_post
end

get '/post/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/post/new' do
  params[:post][:tags] = Tag.create_tags(extract_tags(params[:tag]))

  post = Post.create(params[:post])  #nested hashes, wooohooo!!
  redirect "/post/#{post.id}"
end

post '/post/:id/edit' do  
  post = Post.find(params[:id]).update_attributes(params[:post])
  redirect "/post/#{params[:id]}"
end



