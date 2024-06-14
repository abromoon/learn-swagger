class Api::RegionSalesController < Api::AuthController
  before_action :set_region_sale, only: %i[ show update destroy ]

  # GET /region_sales
  def index
    @region_sales = RegionSale.all

    render json: @region_sales
  end

  # GET /region_sales/1
  def show
    render json: @region_sale
  end

  # POST /region_sales
  def create
    @region_sale = RegionSale.new(region_sale_params)

    if @region_sale.save
      render json: @region_sale, status: :created, location: [:api, @region_sale]
    else
      render json: @region_sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /region_sales/1
  def update
    if @region_sale.update(region_sale_params)
      render json: @region_sale
    else
      render json: @region_sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /region_sales/1
  def destroy
    @region_sale.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region_sale
      @region_sale = RegionSale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def region_sale_params
      params.require(:region_sale).permit(:region_id, :game_platform_id, :num_sales)
    end
end
