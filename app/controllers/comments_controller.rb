class CommentsController < ApplicationController
  def create 
    @comment = Comment.new(comment_params)
   if @comment.save
    redirect_to prototype_path(params[:prototype_id])
   else
    redirect_to prototype_path(params[:prototype_id])
    
    # render template: "prototypes/show"
   end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
