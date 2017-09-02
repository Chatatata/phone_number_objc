require "countries"

module PhoneNumberObjc
  def self.gen_country_codes()
    ISO3166::Country::all()
    .delete_if do |element|
      code = element.to_s.gsub(/()[,() -]/, '').encode!(Encoding::ASCII_8BIT, undef: :replace)

      code.empty? or code.match?(/[?]/) or element.national_number_lengths.length < 1
    end
    .map do |element|
      code = element.to_s.gsub(/()[,() -']/, '').encode!(Encoding::ASCII_8BIT, undef: :replace)
      country_code = element.country_code

      "@\"#{code}\": @\"#{country_code}\","
    end
  end

  def self.gen_national_number_lengths()
    ISO3166::Country::all()
    .delete_if do |element|
      code = element.to_s.gsub(/()[,() -]/, '').encode!(Encoding::ASCII_8BIT, undef: :replace)

      code.empty? or code.match?(/[?]/) or element.national_number_lengths.length < 1
    end
    .map do |element|
      code = element.to_s.gsub(/()[,() -']/, '').encode!(Encoding::ASCII_8BIT, undef: :replace)
      number_lengths = element.national_number_lengths.map { |e| "@#{e}" }.join(", ")

      "@\"#{code}\": @[#{number_lengths}],"
    end
  end
end
