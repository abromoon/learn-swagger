class Api::GamePublishersController < Api::AuthController
  before_action :set_game_publisher, only: %i[ show update destroy ]

  # GET /game_publishers
  def index
    @game_publishers = GamePublisher.all

    render json: @game_publishers
  end

  # GET /game_publishers/1
  def show
    render json: @game_publisher
  end

  # POST /game_publishers
  def create
    @game_publisher = GamePublisher.new(game_publisher_params)

    if @game_publisher.save
      render json: @game_publisher, status: :created, location: [:api, @game_publisher]
    else
      render json: @game_publisher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_publishers/1
  def update
    if @game_publisher.update(game_publisher_params)
      render json: @game_publisher
    else
      render json: @game_publisher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_publishers/1
  def destroy
    @game_publisher.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_publisher
      @game_publisher = GamePublisher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_publisher_params
      params.require(:game_publisher).permit(:game_id, :publisher_id)
    end
end
