class GamelistsController < ApplicationController
  before_action :set_gamelist, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:index]

  # GET /gamelists
  # GET /gamelists.json
  def index
    @gamelists = current_user.gamelists
  end

  # GET /gamelists/1
  # GET /gamelists/1.json
  def show
    @comments = Comment.joins(:gamelist).where("gamelists.id = ?", @gamelist.id).order("created_at DESC")
  end

  # GET /gamelists/new
  def new
    @gamelist = Gamelist.new
  end

  # GET /gamelists/1/edit
  def edit
  end

  # POST /gamelists
  # POST /gamelists.json
  def create
    game = Game.find(params[:game_id])
    @gamelist = Gamelist.create!(status: params[:status], game: game, user: current_user) rescue Gamelist.where(user: current_user, game: game).update(status: params[:status])
  end

  # PATCH/PUT /gamelists/1
  # PATCH/PUT /gamelists/1.json
  def update
    respond_to do |format|
      if @gamelist.update(gamelist_params)
        format.html {redirect_to @gamelist, notice: 'Gamelist was successfully updated.'}
        format.json {render :show, status: :ok, location: @gamelist}
      else
        format.html {render :edit}
        format.json {render json: @gamelist.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /gamelists/1
  # DELETE /gamelists/1.json
  def destroy
    game = Game.find(params[:game_id])
    Gamelist.where(user: current_user, game: game).destroy_all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gamelist
    @gamelist = Gamelist.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gamelist_params
    params.require(:gamelist).permit(:status)
  end
end

