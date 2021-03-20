ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }
  
  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
    
    #Here is an example of a simple dashboard with columns and panels.
    
    columns do
      column do
        panel "Users" do
          User.all do |user|
            user.username
          end
        end
        panel "Tweets" do
          Tweet.all do |tweet|
            tweet.where(user_id: User.id).count
          end
        end
        panel "Friends" do
          Friend.all do |friend|
            friend.where(friend_id: Friend.friend_id).count
          end
        end
        panel "User" do
          Like.all do |like|
            like.where(user_id: User.id).count
          end
        end
        panel "User" do
          Tweet.all do |tweet|
            tweet.retweets.where(user_id: User.id).count
          end
        end
        columns do
          column do
            panel "Recent tweets" do
              ul do
                Tweet.all.map do |tweet|
                  li link_to(tweet.content, admin_tweet_path(tweet))
                end
              end
              columns do
                panel "Info" do
                  para "Welcome to ActiveAdmin."
                  
                end
              end
              
            end
          end
        end
      end 
    end
  end
end
