class Question < ApplicationRecord
    belongs_to :user
    has_many :answers, dependent: :destroy
    
    validates :title, presence: true
    validates :content, presence: true, length: { minimum: 5 }
    validates :user_id, presence: true
end
