class SubsController < ApplicationController 

def index
	@subs = Sub.all
end

def show
  @sub = Sub.find(params[:id])
	end
	
 def new
    @newSub = Sub.new
  end
 def create
    @sub = Sub.new(params[:sub].permit(:title,:job,:body,:address))
    @sub.save
    redirect_to subs_path
  end
 end