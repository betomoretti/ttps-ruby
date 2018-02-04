class TestNotesController < ApplicationController
  before_action :set_test_note, only: [:show, :edit, :update, :destroy]

  # GET /test_notes
  # GET /test_notes.json
  def index
    @test_notes = TestNote.all
  end

  # GET /test_notes/1
  # GET /test_notes/1.json
  def show
  end

  # GET /test_notes/new
  def new
    @test_note = TestNote.new
  end

  # GET /test_notes/1/edit
  def edit
  end

  # POST /test_notes
  # POST /test_notes.json
  def create
    @test_note = TestNote.new(test_note_params)

    respond_to do |format|
      if @test_note.save
        format.html { redirect_to @test_note, notice: t('.success') }
        format.json { render :show, status: :created, location: @test_note }
      else
        format.html { render :new }
        format.json { render json: @test_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_notes/1
  # PATCH/PUT /test_notes/1.json
  def update
    respond_to do |format|
      if @test_note.update(test_note_params)
        format.html { redirect_to @test_note, notice: t('.success') }
        format.json { render :show, status: :ok, location: @test_note }
      else
        format.html { render :edit }
        format.json { render json: @test_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_notes/1
  # DELETE /test_notes/1.json
  def destroy
    @test_note.destroy
    respond_to do |format|
      format.html { redirect_to test_notes_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_note
      @test_note = TestNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_note_params
      params.require(:test_note).permit(:note, :test_id, :student_id)
    end
end
