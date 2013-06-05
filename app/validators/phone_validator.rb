class PhoneValidator < ActiveModel::EachValidator
  
  def validate_each(record, attribute_name, value)
  	value = value.delete('()-. ')
    unless value =~ /1{0,1}[0-9]{10}/

      record.errors[attribute_name] << (options[:message] || "is not a valid phone number")
    end
  end
end