class Project < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy
    has_many :users, through: :tasks

    validates :title, presence: true
end
