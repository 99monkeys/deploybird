FactoryGirl.define do

  factory :user do
    username FFaker::Internet.user_name
    github_access_token 'somerandomstring'
  end

  factory :project do
    url 'git@github.com:joelmoss/strano.git'
  end

end
