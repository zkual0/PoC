require 'ostruct'

FactoryBot.define do
  factory :ft_results, class: OpenStruct do
    google_search_title        { 'Ducks - Google Search' }
    i_am_feeling_lucky_title   { 'Duck - Wikipedia' }
    amount_of_results          { 8 }
    right_side_summary_description { "Duck is the common name for numerous species in the waterfowl family Anatidae which also includes swans and geese. Ducks are divided among several subfamilies in the family Anatidae; they do not represent a monophyletic group but a form taxon, since swans and geese are not considered ducks." }
  end
end

