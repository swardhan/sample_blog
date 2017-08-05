class Article < ActiveRecord::Base
  belongs_to :user
  acts_as_votable

  after_create :send_create_mail

  def send_create_mail
    Resque.enqueue(SendCreateWorker,id)
  end
end
