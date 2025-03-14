class ApplicationController < ActionController::Base
  def home
    @entries = if params[:search]
                 Entry.where('title LIKE ? OR author LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
                      .page(params[:page]).per(10)
               else
                 Entry.all.page(params[:page]).per(10)
               end
  end
end
