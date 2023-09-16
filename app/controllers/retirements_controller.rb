class RetirementsController < ApplicationController
  def new
  end

  def create
    if current_user.destroy
      reset_session
      redirect_to root_path, notice: "退会完了しました", status: :see_other
    end
  end
end
