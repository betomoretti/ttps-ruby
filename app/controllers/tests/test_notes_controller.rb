class Tests::TestNotesController < ApplicationController
  before_action :set_objects, only: [:new, :create]

  def new
    @test_notes = TestNoteService.create_test_notes(@signature_year.students, @test)
  end

  def create
    test_notes = signature_year_params.to_hash["test_notes"]
    respond_to do |format|
      if TestNote.update(test_notes.keys, test_notes.values)
        format.html { redirect_to @test, notice: t('.success') }
        format.json { render :show, status: :ok, location: @signature_year }
      else
        format.html { render :new }
        format.json { render json: @signature_year.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objects
      @test = Test.find(params[:test_id])
      @signature_year = @test.signature_year
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signature_year_params
      params.require(:test).permit(test_notes: [:note])
    end
end