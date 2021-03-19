class Tweet < ApplicationRecord
    has_many :retweets, class_name: 'Tweet', foreign_key: 'retweet_id'
    belongs_to :retweet, class_name: 'Tweet', optional: true
    
    
    belongs_to :user
    has_many :likes

    validates :content, presence: true

    scope :tweets_for_me, -> (user_friends) { Tweet.where( user_id: user_friends ) }

end
