class PostsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_user
	

	def index
    @posts = current_user.posts.all
	end

  def show
  	@post = Post.find(params[:id])
  	@comments = @post.comments.includes(:user)
  	@comment = Comment.new
  end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)
			if @post.save
				redirect_to root_path
			else
				render :new
			end
		end

	def edit
		@post = Post.find(params[:id])
  end


	def update
     @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to user_posts_path
      else
        render :new
      end
	end


	def destroy
    @post = Post.find(params[:id])
    @post.destroy
					redirect_to user_posts_path
	end
		

  private

    def post_params
      params.require(:post).permit(:post, :user_id)
    end

    def set_user
    	@user = User.find(params[:user_id])
    end

end
