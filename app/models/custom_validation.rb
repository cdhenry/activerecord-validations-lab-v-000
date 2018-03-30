class MyValidator < ActiveModel::Validator
  def validate(record)
    unless !record.title.include?("Won't Believe") || !record.title.include? ("Secret") || !record.title.include? ("Top" + /\d/ ) || !record.title.include? ("Guess")
      record.errors[:title] << false
    end
  end
end
