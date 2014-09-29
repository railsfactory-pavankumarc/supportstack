class CommentsController < ApplicationController
before_action :authenticate_user!
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
     @comment = Comment.new(comment_params)
     @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        @id = @comment.ticket_id
        @tc = Ticket.find_by_id(@id)
        if @tc.status.name == "closed"

        else
          @sid = Status.find_by_name("awaiting for users reply")
          @tc.update_attributes(:status_id => @sid.id)
        end
        format.html { redirect_to ticket_path(@id) }
       
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