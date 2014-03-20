class Submission < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  def vote_count
    self.votes.where(direction: true).count
  end

  def submitter_email
    self.user.email
  end

end
