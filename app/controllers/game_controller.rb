class GameController < ApplicationController
    def try
        @rand_num = rand(10).to_i
        cookies[:random] = @rand_num unless !cookies[:random].nil?
        cookies[:guess] = 0 if cookies[:guess].to_i == 3

                if params[:rand].to_i == cookies[:random].to_i
                    @result = "Correct! You guessed the number!"
                else
                    @result = "Sorry! Guess again!"
                    cookies[:guess] = cookies[:guess].to_i + 1
                end

        p params[:rand]
        p cookies[:random]
        p params[:rand].to_i == cookies[:random]

        render "tries.html.erb" # Rails magic without this
    end
end
