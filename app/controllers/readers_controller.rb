class ReadersController < ApplicationController
    def new
              @reader = Reader.new
    end
    def create
              @reader = Reader.new(reader_params)
              if @reader.save
                          redirect_to @reader, notice: "Usuário foi criado com sucesso!"
                          #tire o método de comentário quando criar o helper.
                          #Usuário depois de cadastrar-se acessa o sistema automaticamente
  #sign_in(@reader)
              else
  render action: :new
              end
    end
    private
    def reader_params
              params.require(:reader).permit(:name, :email, :password, :password_confirmation)
    end
end