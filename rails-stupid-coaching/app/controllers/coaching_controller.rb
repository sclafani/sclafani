class CoachingController < ApplicationController
  def answer
    @question = params[:question]
  end

  def ask
    # @question = params[:queston]
  end
end
