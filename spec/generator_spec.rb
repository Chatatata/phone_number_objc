require "spec_helper"
require "phone_number_objc/generator"

describe PhoneNumberObjc do
  it "should create a country code list" do
    expect(PhoneNumberObjc::gen_country_codes).not_to be nil
  end

  it "should create a national number length list" do
    expect(PhoneNumberObjc::gen_national_number_lengths).not_to be nil
  end
end
