# Verify that you have Ruby installed
ruby -v


# Install Rails
rails --version


# Create a new Rails app
rails new -h
rails new blog
cd blog
ls -l


# Start WEBrick
rails server


# Create a controller and a view:
rails generate controller welcome index


# Navigate to
http://localhost:3000/welcome/index


# config/routes.rb
root to: "welcome#index"


# config/routes.rb
resources :posts


# Create a controller called PostsController:
rails g controller posts


# app/controllers/posts_controller
def new
end


# app/iews/posts/new.html.erb
<h1>New Post</h1>


# app/iews/posts/new.html.erb
<%= form_for :post do |f| %>
  <p>
    <%= f.label :title %><br>
    <%= f.text_field :title %>
  </p>
  <p>
    <%= f.label :text %><br>
    <%= f.text_area :text %>
  </p>
  <p>
    <%= f.submit %>
  </p>
<% end %>


# app/iews/posts/new.html.erb
<%= form_for :post, url: posts_path do |f| %>


# app/controllers/posts_controller.rb
def create
  render text: params[:post].inspect
end


# Create a Post model
rails g model Post title:string text:text
rake db:migrate


# app/controllers/posts_controller.rb
def create
  @post = Post.new(post_params) 
  @post.save
  redirect_to @post
end

private
  def post_params
    params.require(:post).permit(:title, :text)
  end


# app/controllers/posts_controller.rb
def show
  @post = Post.find(params[:id])
end


# app/views/posts/show.html.erb
<p>
  <strong>Title:</strong>
  <%= @post.title %>
</p>
<p>
  <strong>Text:</strong>
  <%= @post.text %>
</p>


# app/controllers/posts_controller.rb
def create
  @post = Post.new(params[:post].permit(:title, :text))
  @post.save
  redirect_to @post
end


# app/controllers/posts_controller.rb
def index
  @posts = Post.all
end


# app/views/posts/index.html.erb
<h1>Listing posts</h1>
<table>
  <tr><th>Title</th><th>Text</th></tr>
  <% @posts.each do |post| %>
    <tr>
      <td><%= post.title %></td>
      <td><%= post.text %></td>
    </tr>
  <% end %>
</table>


# app/views/welcome/index.html.erb
<%= link_to "My Blog", posts_path %>


# app/models/post.rb
validates :title, presence: true, length: { minimum: 5 }


# app/controllers/posts_controller.rb 
if @post.save
  redirect_to @post
else
  render 'new'
end


# app/views/posts/new.html.erb
<% if @post.errors.any? %>
  <div id="errorExplanation">
    <h2><%= pluralize(@post.errors.count, "error") %> prohibited this post from being saved:</h2>
    <ul>
      <% @post.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
    </ul>
  </div>
<% end %>



# app/controllers/posts_controller.rb
def new
  @post = Post.new
end


# app/controllers/posts_controller.rb
def edit
  @post = Post.find(params[:id])
end


# app/views/posts/edit.html
def edit
  @post = Post.find(params[:id])
end


# app/views/posts/edit.html, code from new.html.erb
<h1>Editing post</h1>
<%= form_for :post, url: post_path(@post.id), method: :patch do |f| %>


# app/controllers/posts_controller.rb
def update
  @post = Post.find(params[:id])
  if @post.update(params[:post].permit(
                      :title, :text))
    redirect_to @post
  else
    render 'edit'
  end
end  


# views/posts/index.html.erb
<td><%= link_to 'Show', post %></td>
<td><%= link_to 'Edit',
                edit_post_path(post) %></td>
<td><%= link_to 'Destroy', post_path(post),
                method: :delete, data:
                {confirm: 'Are you sure?'} %></td>



# views/posts/_form.html.erb
<%= form_for @post do |f| %>
  # the rest is the same as the form in new.html.erb
<% end %>


# app/views/posts/new.html.erb
<h1>New post</h1>
<%= render 'form' %>
<%= link_to 'Back', posts_path %>


# app/views/posts/edit.html.erb
<h1>Edit Post</h1>
<%= render 'form' %>
<%= link_to 'Back', posts_path %>


# app/controllers/posts_controller.rb
def destroy
  @post = Post.find(params[:id])
  @post.destroy 
  redirect_to posts_path
end


rails generate model Comment commenter:string body:text post:references
rake db:migrate


# app/models/post.rb
has_many :comments


# config/routes.rb
resources :posts do
  resources :comments
end


rails generate controller Comments


# app/views/posts/show.html.erb
<h2>Add a comment:</h2>
<%= form_for([@post, @post.comments.build]) do |f| %>
  <p>
    <%= f.label :commenter %><br />
    <%= f.text_field :commenter %>
  </p>
  <p>
    <%= f.label :body %><br />
    <%= f.text_area :body %>
  </p>
  <p>
    <%= f.submit %>
  </p>
<% end %>


# app/controllers/comments_controller.rb
def create
  @post = Post.find(params[:post_id])
  @comment = @post.comments.create( params[:comment].permit(:commenter, :body))
  redirect_to post_path(@post)
end


# app/views/posts/show.html.erb
<h2>Comments</h2>
<% @post.comments.each do |comment| %>
  <p>
    <strong>Commenter:</strong>
    <%= comment.commenter %>
  </p>
  <p>
    <strong>Comment:</strong>
    <%= comment.body %>
  </p>
<% end %>
 

# app/views/comments/_comment.html.erb:
<p>
  <strong>Commenter:</strong>
  <%= comment.commenter %>
</p><p>
  <strong>Comment:</strong>
  <%= comment.body %>
</p>


# app/views/posts/show.html.erb
<%= render @post.comments %>


# views/comments/_form.html.erb
<%= form_for([@post, @post.comments.build]) do
  |f| %>
  <p>
    <%= f.label :commenter %><br />
    <%= f.text_field :commenter %></p>
  <p>
    <%= f.label :body %><br />
    <%= f.text_area :body %></p>
  <p>
    <%= f.submit %></p>
<% end %>


# app/iews/post/show.html.erb
<%= render "comments/form" %>


# app/views/comments/_comment.html.erb
<p><%= link_to 'Destroy Comment', 
        [comment.post, comment], method: :delete,
        data: { confirm: 'Are you sure?' } %></p>


# app/controllers/comments_controller.rb
def destroy
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  @comment.destroy
  redirect_to post_path(@post)
end


# app/models/post.rb
has_many :comments, dependent: :destroy


# app/controllers/posts_controller.rb
http_basic_authenticate_with name: "udacity", password: "secret", except: [:index, :show] 


# app/controllers/comments_controller.rb
http_basic_authenticate_with name: "udacity", password: "secret", only: :destroy







