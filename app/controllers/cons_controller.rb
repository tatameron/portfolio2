class ConsController < ApplicationController 

def index
	@cons = Con.all
end

def show
  @con = Con.find(params[:id])
	end
	

 def new

    @newCon = Con.new
  end
 def create
    @con = Con.new(params[:con].permit(:title,:job,:body,:address))
    @con.save
    redirect_to cons_path
  end
 end