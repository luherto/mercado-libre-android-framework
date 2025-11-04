require 'appium_lib_core'
require 'test/unit'

CAPABILITIES = {
  platformName: 'Android',
  automationName: 'uiautomator2',
  deviceName: 'Android',
  appPackage: 'com.mercadolibre',
  appActivity: 'com.mercadolibre.activities.settings.country.CountrySelectorActivity',
}

SERVER_URL = 'http://localhost:4723'

class AppiumTest < Test::Unit::TestCase
  def setup
    @core = ::Appium::Core.for capabilities: CAPABILITIES
    @driver = @core.start_driver server_url: SERVER_URL
  end

  def teardown
    @driver&.quit
  end

  def test_version
    @driver.wait { |d| d.find_element :xpath, '//android.widget.TextView[@resource-id="com.mercadolibre:id/country_selector_row_text" and @text="México"]' }.click
  end
end