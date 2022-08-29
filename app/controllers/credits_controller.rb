class CreditsController < ApplicationController
  before_action :set_credit, only: %i[ show edit update destroy ]

  # GET /credits or /credits.json
  def index
    @credit = Credit.new(user: guest_user)
    @credit_table = Credit.find_by_user_id(guest_user.id)
  end

  # GET /credits/1 or /credits/1.json
  def show
  end

  # GET /credits/new
  def new
    @credit = Credit.new
  end

  # GET /credits/1/edit
  def edit
  end

  # POST /credits or /credits.json
  def create
    @credit = Credit.find_by_user_id(guest_user.id)
    if @credit.nil?
      @credit = guest_user.create_credit(credit_params)
      respond_to do |format|
      if @credit.save
        format.turbo_stream { render turbo_stream: turbo_stream.append('credits', partial: 'credit', locals: { credit: @credit }) }
        format.html { redirect_to credits_url, notice: 'Calculo realizado con éxito.' }
        format.json { render :show, status: :created, location: @credit }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@credit, partial: 'credit/form', locals: { credit: @credit}) }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
    else
      update
    end
  end

  # PATCH/PUT /credits/1 or /credits/1.json
  def update
    respond_to do |format|
      if @credit.update(credit_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace('credits', partial: 'credit', locals: { credit: @credit }) }
        format.html { redirect_to credits_url, notice: 'Calculo realizado con éxito.' }
        format.json { render :show, status: :ok, location: @credit }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@credit, partial: 'credit/form', locals: { credit: @credit}) }
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1 or /credits/1.json
  def destroy
    @credit.destroy

    respond_to do |format|
      format.html { redirect_to credits_url, notice: "Credit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = Credit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def credit_params
      params.require(:credit).permit(:payment_type, :credit_value, :installment_number, :interest_type, :interest_rate)
    end
end
