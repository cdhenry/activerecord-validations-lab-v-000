class MyValidator < ActiveModel::Validator
  def validate(record)
    unless !record.title.include?("Won't Believe") || !record.title.include? ("Secret") || !record.title.include? ("Top" + /\d/ ) || !record.title.include? ("Guess")
      record.errors[:title] << false
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates_with MyValidator
end
