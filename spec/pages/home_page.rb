# spec/pages/home_page.rb
require_relative '../helpers/base_page'
class HomePage < BasePage
  SEARCH_FIELD = { xpath: '//android.widget.TextView[@resource-id="com.mercadolibre:id/ui_components_toolbar_title_toolbar"]' }
  SEARCH_FIELD_TEXT={xpath:'//android.widget.EditText[@resource-id="com.mercadolibre:id/autosuggest_input_search"]'}

  GUEST_SELECTOR= {xpath:'//android.widget.TextView[@resource-id="com.mercadolibre:id/andes_button_text" and @text="Continuar como visitante"]'}
  FILTER_LIST={xpath: '//android.widget.TextView[contains(@text, "Filtros")]'}
  TEXT={xpath:'//android.widget.TextView[@text="Ordenar por"]'}
  HIGHEST_PRICE_BUTTON={xpath: '//android.widget.ToggleButton[@resource-id="sort-price_desc"]'}
  SEE_BUTTON= {xpath:'//android.widget.Button[@resource-id=":r3:"]'}

  CONDITION={xpath:'//android.view.View[@content-desc="Condición"]'}
  NEW_BUTTON= {xpath: '//android.widget.ToggleButton[@resource-id="ITEM_CONDITION-2230284"]'}
  LOCAL_BUTTON= {xpath:'//android.widget.ToggleButton[@resource-id="SHIPPING_ORIGIN-10215068"]'}

  PRODUCT_NAME_XPATH = "//android.widget.TextView[starts-with(@text, 'Playstation Ps5')]"
  PRODUCT_PRICE_XPATH = "//android.widget.TextView[@resource-id='current amount']"

  def search_for(term)
    wait_for(SEARCH_FIELD)
    @driver.find_element(SEARCH_FIELD).click
    wait_for(SEARCH_FIELD_TEXT)
    @driver.find_element(SEARCH_FIELD_TEXT).send_keys(term)
    @driver.press_keycode(66) # enter
  end

  def country_selection
    scroll_to_text("México").click
  end

  def select_guest_option()
    wait_for(GUEST_SELECTOR)
    @driver.find_element(GUEST_SELECTOR).click
  end
  
  def filter_click()
    wait_for(FILTER_LIST)
    @driver.find_element(FILTER_LIST).click
  end

  def scroll_and_click(text)
    retries = 0
    begin
      scroll_to_text(text).click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      retries += 1
      small_scroll_down
      retry if retries < 3
      raise "No se pudo encontrar '#{text}' después de reintentar"
    end
  end

  def open_sort_menu
      scroll_and_click("Condición")
      wait_for(NEW_BUTTON)
      @driver.find_element(NEW_BUTTON).click

      sleep 1.5
      scroll_and_click("Envíos")
      wait_for(LOCAL_BUTTON)
      @driver.find_element(LOCAL_BUTTON).click

      %w[Marca Incluye\ controles Eficiencia\ energética Ordenar\ por].each { |section| scroll_and_click(section) }

      wait_for(HIGHEST_PRICE_BUTTON)
      @driver.find_element(HIGHEST_PRICE_BUTTON).click
      @driver.find_element(SEE_BUTTON).click
      sleep 1
  end 
  
  
end
