class Client < ActiveRecord::Base

  belongs_to :channel

  validates :first_name, presence: true
  validates :last_name, presence: true
end
