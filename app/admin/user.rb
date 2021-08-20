ActiveAdmin.register User do
    permit_params :name, :email
    actions :all  
  
  
    filter :name
  
    index do 
      column :name
      column :email
      column :trainings do |user|
        user.trainings.count
      end
  
      column :trainings do |user|
        user.trainings.all
      end
  
      actions 
    end
    
    
    
    
  end
  