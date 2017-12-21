class EmailValidator < ActiveModel::Validator
  def validate(record)
    unless record.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[:email] << "not valid"
    end
  end
end