class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :ideas
         has_many :likes
         has_many :liked_ideas, :through => :likes, :source => :idea


        def like_for(idea)
          likes.where(idea: idea).first
        end
end
