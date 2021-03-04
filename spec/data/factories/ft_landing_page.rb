require 'ostruct'

FactoryBot.define do
  factory :ft_landing_page, class: OpenStruct do
    search_keyword                      { 'Ducks' }
    google_search_next_page_title       { 'Ducks - Google Search' }
    i_am_feeling_lucky_next_page_title  { 'Duck - Wikipedia' }
    dropdown_results_list_size          { 10 }
  end
end

