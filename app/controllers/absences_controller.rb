class AbsencesController < ApplicationController
  def new
    @absence = Absence.new
  end

  def create
    @absence = Absence.new(absence_params)
    @absence.user = current_user
    raise
    if @absence.save
      redirect_to root_path
    else
      render 'absences/new', status: :unprocessable_entity
    end
  end

  def index
  end

  private

  def absence_params
    params.require(:absence).permit(:user_id, :lesson_id)
  end
end
