# spec/helpers/driver_setup.rb
require 'appium_lib_core'

def create_driver
  caps = {
    platformName: 'Android',
    automationName: 'uiautomator2',
    deviceName: 'Android',
    appPackage: 'com.mercadolibre',
    appActivity: 'com.mercadolibre.navigation.activities.BottomBarActivity',
    noReset: false,
    fullReset: false,
    autoGrantPermissions: true,
    autoAcceptAlerts: true
  }

  server_url = 'http://localhost:4723'
  core = ::Appium::Core.for capabilities: caps
  driver = core.start_driver server_url: server_url

  driver
end
