class CommentsController < ApplicationController

	before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def index 
		@comment = Comment.all
	end

  

  def show
  end


  def new
    @comment = Comment.new
  end

  def edit
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
        format.html { redirect_to client_index_path }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
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