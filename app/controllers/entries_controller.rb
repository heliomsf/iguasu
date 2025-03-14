class EntriesController < ApplicationController
  def index
    @entries = if params[:search]
                 Entry.where('title LIKE ? OR author LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
                      .page(params[:page]).per(10)
                else
                  Entry.all.page(params[:page]).per(10)
                end              
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
