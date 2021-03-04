class LandingPage
  include Capybara::DSL
  attr_reader :url

  def initialize
    @url            = 'https://www.google.com/'
    @search_box     = "input[title='Search']"

    # Dropdown Search list handled by JS
    @dropdown_search_list_div     = "//ul[@role='listbox']/parent::div" # XPath
    @dropdown_search_list_values  = "ul[role='listbox'] div.sbl1"
    @google_search_btn            = "input[value='Google Search']"
    @i_am_feeling_lucky_btn       = %{input[value="I'm Feeling Lucky"]}

    # Default Search
    @default_search_div = "div:not([jscontroller])"
    @google_search_default_btn      = @default_search_div + " " + @google_search_btn
    @i_am_feeling_lucky_default_btn = @default_search_div + " " + @i_am_feeling_lucky_btn

  end

  def load
    visit @url
    click_link 'English'  if has_link? 'English'    # to make landing page work on English by default
    self
  end

  def click_google_search
    # I'm expecting to click on visible buttons only
    # as a common user does
    btn = if is_dropdown_list_open?
            container.find @google_search_btn
          else
            find @google_search_default_btn
          end
    btn.click
    self
  end

  def click_i_am_feeling_lucky
    # I'm expecting to click on visible buttons only
    # as a common user does
    btn = if is_dropdown_list_open?
            container.find @i_am_feeling_lucky_btn
          else
            find @i_am_feeling_lucky_default_btn
          end
    btn.click
    self
  end

  def fill_search(text, opts={})
    search_box = find(@search_box)
    search_box.set(text)
    3.times do # homemade do-while
      sleep(1) # forced sleep to allow load final suggested results in the dropdown list
      break   if is_dropdown_list_open?
    end
    search_box.send_keys(:escape)     if opts.has_key? :send_escape
    self
  end

  def is_dropdown_list_open?
    has_xpath? @dropdown_search_list_div
  end

  def dropdown_list_values
    return nil  if not container

    elems = container.all(@dropdown_search_list_values)
    elems.map{ |elem| elem.text}
  end

  def search_for(value, use_i_am_feeling_lucky=false)
    fill_search(value)
    if use_i_am_feeling_lucky
      click_i_am_feeling_lucky
    else
      click_google_search
    end
    self
  end

  private

  def container
    # wrapper to work with a specific section of code
    return nil    if not is_dropdown_list_open?

    if block_given?
      within xpath: @dropdown_search_list_div do
        yield
      end
    else
      find(:xpath, @dropdown_search_list_div)
    end
  end

end

