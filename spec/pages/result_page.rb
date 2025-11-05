# spec/pages/results_page.rb
require_relative '../helpers/base_page'

class ResultsPage < BasePage
  PRODUCT_NAME_XPATH = "//android.widget.TextView[starts-with(@text, 'Playstation Ps5')]"
  PRODUCT_PRICE_XPATH = "//android.widget.TextView[@resource-id='current amount']"

def list_top_results(n)
  wait_for_results

  results = []
  scrollable = "new UiScrollable(new UiSelector().scrollable(true))"

  loop do
    # Obtener los elementos visibles
    names = @driver.find_elements(:xpath, '//android.widget.TextView[contains(@text, "Playstation Ps5")]')
    prices = @driver.find_elements(:xpath, "//android.widget.TextView[@resource-id='current amount']")

    names.each_with_index do |name, i|
      price_text = prices[i]&.attribute('text') || 'N/A'
      results << { name: name.text, price: price_text }
      break if results.size >= n
    end

    break if results.size >= n

    # Hacer scroll hacia abajo
    @driver.execute_script('mobile: scrollGesture', {
      left: 200, top: 800, width: 800, height: 800,
      direction: 'down', percent: 0.8
    })
  end

  puts "🔍 Se encontraron los siguientes resultados:"
  results.each_with_index do |r, index|
    puts "#{index + 1}. #{r[:name]} — #{r[:price]}"
  end
end

  private

  def wait_for_results
    @driver.wait_true(timeout: 15) do
      @driver.find_elements(:xpath, PRODUCT_NAME_XPATH).any?
    end
    puts "✅ Resultados visibles en pantalla."
  end
end
