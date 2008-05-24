class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :context, :polymorphic => true
    
  validates_presence_of :role, :user, :context
  
  
end