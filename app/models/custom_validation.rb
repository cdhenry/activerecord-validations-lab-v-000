class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.starts_with? 'X'
      record.errors[:title] << false
    end
  end
end