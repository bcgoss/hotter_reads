class Api::V1::ReadsController < ApiController
  def create
    @read = Read.new(read_params)
    if @read.save
      render json: @read, status: 201
    else
      render json:@read.errors.full_messages, status: 500
    end
  end

  def index
    @reads = Read.hot.pluck(:url)
    render json: @reads
  end

  private
    def read_params
      params.require(:read).permit(:url)
    end
end
