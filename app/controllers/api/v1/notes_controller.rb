class Api::V1::NotesController < ApplicationController

    def show
        note = Note.find(params[:id])
        render json: note, except: [:updated_at, :created_at]
    end

  def create
      note = Note.create(date: params[:date], description:params[:description], user_id: params[:user_id])
      render json: review
  end

  def update
    note = Note.find_by(id: params[:id])
    note.update(description: params[:description])
    render json: note
  end

  def destroy
      note = Note.find_by(params[:id])
      note.destroy!
      render json: {}
  end
  
end
