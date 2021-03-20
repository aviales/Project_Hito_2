ActiveAdmin.register User do
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :profile_picture
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :profile_picture]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :Friend_following_count do |user|
      columns user.friends.count 
    end
    column :Tweet_count do |user|
      columns user.tweets.count 
    end
    column :Retweet_count do |user|
      columns user.retweet_count
    end
    column :Like_count do |user|
      columns user.likes.count
    end
    actions
  end
  
end
