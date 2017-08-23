class SillyController < ApplicationController

  def fun
    render text: params[:message ] 
  end

end

#params contain query string, request body, url params route params
