class ProfilesController < ApplicationController
  def update
    @student = User.find(params[:id])
    @course = @student.course_id
    @student.update(user_params)
    redirect_to course_path(@course)
  end

  private

  def user_params
    params.require(:user).permit(:course_id)
  end
end
