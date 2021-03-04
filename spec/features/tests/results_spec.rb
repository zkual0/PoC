require './lib/requires'

  describe 'On Results page' do
    let(:ft_landing_page)     { create(:ft_landing_page) }
    let(:ft_results)          { create(:ft_results) }
    let(:results)       { Results.new }
    let(:landing_page)  { LandingPage.new }

    before :each do
      landing_page.load
      landing_page.search_for(ft_landing_page.search_keyword)
    end

    it 'consults for definition on Wikipedia' do
      results
        .click_on_entry('Duck - Wikipedia')
      verify_title("Duck - Wikipedia")
    end

    it 'shows 8 results' do
      expect(results.amount_of_results).to equal(ft_results.amount_of_results)
    end

    it 'shows a brief description on right side' do
      expect(results.right_side_summary).to include(ft_results.right_side_summary_description)
    end

    it 'shows a box mentioning what other "People also ask"' do
      verify_is_truthy(results.includes_people_also_ask_area?)
    end
end