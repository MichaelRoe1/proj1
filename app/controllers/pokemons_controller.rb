class PokemonsController < ApplicationController #should pluralize? 

  def index
    @pokemon = Pokemon.all #should pluralize? 
  end

  def update
  	capture
  end

  def capture
  	captured = Pokemon.find(params[:id])
  	captured.trainer_id = current_trainer.id
  	captured.save
  	redirect_to root_url
  end

  def damage
  	@pokemon = Pokemon.find(params[:id])
  	if @pokemon.health - 10 <= 0
  		@pokemon.destroy
  		redirect_to trainer_path(@pokemon.trainer)
  	else	
  		@pokemon.health -= 10 
  		@pokemon.save
  		redirect_to trainer_path(@pokemon.trainer)
  	end
  end

  def destroy
  	#need to remove the pokemon instance from the database
  end

  def show

  end

  def new

  end

  def create
  	name = params["pokemon"]["name"]
  	@p = Pokemon.new name: name, level: 1, trainer_id: current_trainer.id, health: 100
  	if @p.save
  		redirect_to trainer_path(@p.trainer)
  	else
  		#redirect to form and flash the appropriate error.
  		flash[:error]  = @p.errors.full_messages.to_sentence
      	redirect_to trainer_path(@p.trainer)
  	end
  end
end