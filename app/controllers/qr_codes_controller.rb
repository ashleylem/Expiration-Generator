class QrCodesController < ApplicationController
  before_action :set_qr_code, only: %i[ show edit update destroy ]
  require 'chunky_png'

  # GET /qr_codes or /qr_codes.json
  def index
    @qr_codes = QrCode.all
  end

  # GET /qr_codes/1 or /qr_codes/1.json
  def show
    @qr_code = QrCode.find(params[:id])
    @remove_navbar=true
  end

  # GET /qr_codes/new
  def new
    @user = User.find(session[:user_id])
    @qr_code = QrCode.new
  end

  # GET /qr_codes/1/edit
  def edit
  end
  
  # POST /qr_codes or /qr_codes.json
  def create
    @qr_code = QrCode.new(qr_code_params)
    @qr_code.user_id = session[:user_id]

    if @qr_code.save
      qr = RQRCode::QRCode.new(qr_code_url(@qr_code.id))
      png = qr.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: "black",
        file: nil,
        fill: "white",
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 200
      )
      @qr_code.image.attach(
        io: StringIO.new(png.to_s),
        filename: "#{@qr_code.id}.png",
        content_type: "image/png"
      )      
      redirect_to profile_path, notice: "QR code was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /qr_codes/1 or /qr_codes/1.json
  def update
    respond_to do |format|
      if @qr_code.update(qr_code_params)
        format.html { redirect_to qr_code_url(@qr_code), notice: "Qr code was successfully updated." }
        format.json { render :show, status: :ok, location: @qr_code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @qr_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qr_codes/1 or /qr_codes/1.json
  def destroy
    @qr_code.destroy

    respond_to do |format|
      format.html { redirect_to qr_codes_url, notice: "Qr code was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qr_code
      @qr_code = QrCode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def qr_code_params
      params.require(:qr_code).permit(:product_name, :expiration_code, :image)
    end
end
