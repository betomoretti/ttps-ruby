class SignatureYearsController < ApplicationController
  before_action :set_signature_year, only: [:show, :edit, :update, :destroy,
                                            :results]

  # GET /signature_years
  # GET /signature_years.json
  def index
    @signature_years = SignatureYear.all
  end

  # GET /signature_years/1
  # GET /signature_years/1.json
  def show
  end

  # GET /signature_years/new
  def new
    @signature_year = SignatureYear.new
  end

  # GET /signature_years/1/edit
  def edit
  end

  # POST /signature_years
  # POST /signature_years.json
  def create
    @signature_year = SignatureYear.new(signature_year_params)
    respond_to do |format|
      if @signature_year.save
        format.html { redirect_to @signature_year, notice: 'Signature year was successfully created.' }
        format.json { render :show, status: :created, location: @signature_year }
      else
        format.html { render :new }
        format.json { render json: @signature_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signature_years/1
  # PATCH/PUT /signature_years/1.json
  def update
    respond_to do |format|
      if @signature_year.update(signature_year_params)
        format.html { redirect_to @signature_year, notice: 'Signature year was successfully updated.' }
        format.json { render :show, status: :ok, location: @signature_year }
      else
        format.html { render :edit }
        format.json { render json: @signature_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signature_years/1
  # DELETE /signature_years/1.json
  def destroy
    @signature_year.destroy
    respond_to do |format|
      format.html { redirect_to signature_years_url, notice: 'Signature year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def results
    @test_notes = @signature_year.test_notes.order('due_date DESC')
    @total_approved = @test_notes.where('note >= note_to_approve').count
    @total_disapproved = @test_notes.where('note < note_to_approve').count
    @total_ausent = @test_notes.where(note: nil).count
    @approved_average = (Float(@total_approved) / Float(@test_notes.count)) * 100
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signature_year
      @signature_year = SignatureYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signature_year_params
      params.require(:signature_year).permit(:year)
    end
end
