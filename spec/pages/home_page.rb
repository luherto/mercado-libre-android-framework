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

  CONDICION={xpath:'//android.view.View[@content-desc="Condición"]'}
  NEW_BUTTON= {xpath: '//android.widget.ToggleButton[@resource-id="ITEM_CONDITION-2230284"]'}
  ENVIOS={xpath:'//android.widget.TextView[contains(@text, "Envíos")]'}
  C_CONTROLES={xpath:'//android.widget.TextView[contains(@text, "Cantidad de controles")]'}
  WI_FI={xpath:'//android.view.View[@content-desc="Con Wi-Fi"]'}
  ORDENAR_POR={xpath:'//android.widget.TextView[@text="Ordenar por"]'}
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

  def country_selection()
    scroll_to_text("México").click
  end

  def guest_option()
    wait_for(GUEST_SELECTOR)
    @driver.find_element(GUEST_SELECTOR).click
  end
  
  def filter_click()
    wait_for(FILTER_LIST)
    @driver.find_element(FILTER_LIST).click
  end

  def open_sort_menu
    scroll_to_text("Condición").click
    wait_for(NEW_BUTTON)
    @driver.find_element(NEW_BUTTON).click

    # Esperar a que el contenedor se recargue
    sleep 1.5

    # Rehacer el scroll para asegurarse que 'Envíos' esté visible
    retries = 0
    begin
      scroll_to_text("Envíos").click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      retries += 1
      small_scroll_down
      retry if retries < 3
      raise "No se pudo encontrar 'Envíos' después de reintentar"
    end
    
    wait_for(LOCAL_BUTTON)
    @driver.find_element(LOCAL_BUTTON).click
    
    retries=0
    begin
      scroll_to_text("Marca").click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      retries += 1
      small_scroll_down
      retry if retries < 3
      raise "No se pudo encontrar 'Marca' después de reintentar"
    end

    retries=0
    begin
        scroll_to_text("Incluye controles").click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      retries += 1
      small_scroll_down
      retry if retries < 3
      raise "No se pudo encontrar 'Incluye controles' después de reintentar"
    end

    retries=0
    begin
        scroll_to_text("Eficiencia energética").click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      retries += 1
      small_scroll_down
      retry if retries < 3
      raise "No se pudo encontrar 'Eficiencia energética' después de reintentar"
    end

    retries=0
    begin
        scroll_to_text("Ordenar por").click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      retries += 1
      small_scroll_down
      retry if retries < 3
      raise "No se pudo encontrar 'Ordenar por' después de reintentar"
    end


    wait_for(HIGHEST_PRICE_BUTTON)
    @driver.find_element(HIGHEST_PRICE_BUTTON).click
    @driver.find_element(SEE_BUTTON).click
    sleep 1
  end 
  
  
end
