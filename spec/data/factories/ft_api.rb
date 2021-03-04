require 'ostruct'

FactoryBot.define do
  factory :ft_api, class: OpenStruct do

    full_json { "Duck is the common name for numerous species in the waterfowl family Anatidae which also includes swans and geese. Ducks are divided among several subfamilies in the family Anatidae; they do not represent a monophyletic group but a form taxon, since swans and geese are not considered ducks." }
  end
end
