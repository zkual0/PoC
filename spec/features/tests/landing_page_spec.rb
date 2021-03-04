require './lib/requires'

 describe 'On Landing Page' do
   let(:landing_page)      { LandingPage.new }
   let(:ft_landing_page)   { create(:ft_landing_page) }
   let(:ft_results)        { create(:ft_results) }

   before :each do
     landing_page.load
   end

   describe 'when testing Search box' do
     it 'clicks on Google image' do
       skip 'google image is not clickable'
     end

     it 'shows a list of possible strings to search for' do
       dropdown_list = landing_page
                         .fill_search(ft_landing_page.search_keyword)
                         .dropdown_list_values

       verify_array_elements_include_value(dropdown_list, ft_landing_page.search_keyword.singularize)
     end

     it 'has a specific amount of possible strings to search for' do
       dropdown_list = landing_page
                         .fill_search(ft_landing_page.search_keyword)
                         .dropdown_list_values

       expect(dropdown_list.size).to equal(ft_landing_page.dropdown_results_list_size)
     end

     context 'using dropdown controls' do
       it 'searches for Ducks results when Google Search is clicked' do
         landing_page
           .fill_search(ft_landing_page.search_keyword)
           .click_google_search

         verify_title(ft_results.google_search_title)
       end

        it "searches for Ducks results when I'm Feeling Lucky is clicked" do
          landing_page
            .fill_search(ft_landing_page.search_keyword)
            .click_i_am_feeling_lucky

          verify_title(ft_results.i_am_feeling_lucky_title)
        end
      end

      context "using no dropdown controls" do
        it 'searches for Ducks results when Google Search is clicked' do
          landing_page
            .fill_search(ft_landing_page.search_keyword, send_escape: true)
            .click_google_search

          verify_title(ft_results.google_search_title)
        end

        it "searches for Ducks results when I'm Feeling Lucky is clicked" do
          landing_page
            .fill_search(ft_landing_page.search_keyword, send_escape: true)
            .click_i_am_feeling_lucky

          verify_title(ft_results.i_am_feeling_lucky_title)
        end
      end
    end
  end
