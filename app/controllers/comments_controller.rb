class CommentsController < ApplicationController
	def index
		@comments = Comment.all
		@comment = Comment.new
	end
	
	def new
		@post = Post.find(params[:id])
  		@comment = @post.comments.new(comment_params)
	end

	def show 
		@comment = Comment.find(params[:id])

	end


	def create
		@user = User.find(params[:user_id])
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params.merge!(user_id: current_user.id))
		if @comment.save 
			redirect_to user_post_path(@post, @user), method: :post
		else
			render :new
		end
	end


private

	def comment_params
		params.require(:comment).permit(:user_id, :post_id, :comment)
	end

end
