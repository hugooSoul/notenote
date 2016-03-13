class NotesController < ApplicationController
	#fifht 
	before_action :find_note, only: [:show, :edit, :update, :destroy]

	#sixth
	def index
		#@notes = Note.all.order("created_at DESC")
		@notes = Note.where(user_id: current_user)
	end

	def show
		
	end

	#fist step
	def new
		#@note = Note.new
		@note = current_user.notes.build
	end

	#second step
	def create
		@note = current_user.notes.build(note_params)

		if @note.save
			redirect_to @note
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @note.update(note_params)
			redirect_to @note
		else
			render 'edit'
		end
	end

	def destroy
		@note.destroy
		redirect_to notes_path
	end


	private

	#fouth step - find a note by id, to Show page
	def find_note
		@note = Note.find(params[:id])
	end

	#third step - permit the field that the form it´s gonna need it.
	def note_params
		params.require(:note).permit(:title, :content)
	end

end
