# spec/helpers/base_page.rb
class BasePage
  def initialize(driver)
    @driver = driver
  end

  def click(locator)
    @driver.find_element(locator).click
  end

  def text_of(locator)
    @driver.find_element(locator).text
  end

  def wait_for(locator, timeout: 10)
    @driver.wait(timeout: timeout) { @driver.find_element(locator) }
  end

  def scroll_to_text(text)
  @driver.find_element(
    :uiautomator,
    'new UiScrollable(new UiSelector().className("androidx.recyclerview.widget.RecyclerView")).scrollIntoView(new UiSelector().textContains("' + text + '"));'
  )
  end

end
