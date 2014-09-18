class ClientController < ApplicationController

	def index
    @clients = User.all
  end


  def new
    @clients = User.new
  end

  def create
    @clients = User.new(ticket_params)

      respond_to do |format|
      if @clients.save
          format.html { redirect_to @clients, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @clients }
        else
          format.html { render :new }
          format.json { render json: @clients.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
      respond_to do |format|
        if @clients.update(ticket_params)
          format.html { redirect_to @clients, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @clients }
        else
          format.html { render :edit }
          format.json { render json: @clients.errors, status: :unprocessable_entity }
        end
      end
    end

end
