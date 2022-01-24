class CommentsController < ApplicationController

    def index
    end
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :body))

        # flash[:notice] = "Comment was created!"
        redirect_to post_path(@post)
    end

    def show
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy

        redirect_to post_path(@post)
    end

end
