class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

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

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to @entry, notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_url, notice: 'Entry was successfully destroyed.'
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:pdfUrl, :ref, :author, :recipient, :title, :placeId, :placeName, :date1, :date2, :date3, :document, :description)
  end
end
