class Results
  include Capybara::DSL

  def initialize
    @entries              = "#search .g h3"
    @right_side_summary   = '#wp-tabs-container'
    @people_also_ask_area = 'div[class="g kno-kp mnr-c g-blk"]'
  end

  def get_entries
    all(@entries)
  end

  def entry_text(idx)
    return get_entries[idx].text
  end

  def amount_of_results
    get_entries.size
  end

  def click_on_entry(title='Duck - Wikipedia')
    """Returns self if element is found & clicked. Returns nothing otherwise"""
    get_entries.each do |entry|
      if (entry.text == title)
        entry.click
        return self
      end
    end
  end

  def right_side_summary
    find(@right_side_summary).text
  end

  def includes_people_also_ask_area?
    has_css? @people_also_ask_area
  end

end

