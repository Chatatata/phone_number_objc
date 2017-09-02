require "phone_number_objc/version"
require "countries"

module PhoneNumberObjc
  def gen_country_codes
    ISO3166::Country.new "US"
  end
end
