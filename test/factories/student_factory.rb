FactoryGirl.define do


  factory :student do
  	grade "sample grade"
  	institute "sample institute"
  	dob DateTime.now
  	sex Student::GENDER_FEMALE
  end


end