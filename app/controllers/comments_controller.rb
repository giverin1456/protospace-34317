class CommentsController < ApplicationController
  def create
    # binding.pry
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to "/prototypes/#{@comment.prototype.id}"
      return
      # redirect_to prototype_path(@comment.prototype.id)
      # @comment.prototypeこれはなに？
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
      return

    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
