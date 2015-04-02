class Trainer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #@pokmeon = Pokemon.create(name:string, level:integer, trainer_id:@trainer.id)

  has_many :pokemon
end
