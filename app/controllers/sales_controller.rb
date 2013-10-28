class SalesController < ApplicationController


def new
	@sale = Sale.new
end

def index
	@sale = Sale.all
end

def create
	@sale = Sale.new (params[:sale].permit(:starting_price))
	
	if @sale.save
	redirect_to @sale
	else
	render "new"
	end

end

def show
	@sale = Sale.find (params[:id])
end

def edit
	@sale = Sale.find (params[:id])
end

def update
	@sale = Sale.find (params[:id])
	
	if @sale.update (params[:sale].permit(:starting_price))
	redirect_to @sale
	else
	render "edit"
	end
end

def destroy
	@sale = Sale.find (params[:id])
	@sale.destroy
	redirect_to sales_path
end


end
