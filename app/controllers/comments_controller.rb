class CommentsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    respond_to do |format|
      if @comment.save
        @comment.update_status(@comment) 

        format.html { redirect_to ticket_path(@comment.ticket_id) }
      else
        format.html { render :new }
      end
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(:comment,:ticket_id, attachment_attributes: [:attachment])
    end

end