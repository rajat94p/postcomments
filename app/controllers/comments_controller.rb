class CommentsController < ApplicationController
	before_action :set_user
	before_action :set_post

	def index
		@comments = Comment.all
	end

	def new
		@comment = Comment.new
	end

	def show
	end

	def create
		debugger
		@comment = Comment.create(comment_params)
		if @comment.save 
			redirect_to root_path
		else
			render :new
		end
	end


private

	def comment_params
		params.require(:comment).permit(:user_id, :post_id, :comment)
	end

	def set_user
		@user = User.find(params[:user_id])
	end

	def set_post
		@post = Post.find(params[:post_id])
	end

end
