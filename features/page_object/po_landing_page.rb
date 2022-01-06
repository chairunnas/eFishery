class LandingPage < SitePrism::Page
  element :landing_page, :css, "ytmusic-section-list-renderer #contents"
  element :logo_landing_page, :xpath, "(//ytmusic-nav-bar//img[@class='logo style-scope ytmusic-nav-bar'])[1]"
  element :button_sign_in, :xpath, "//a[contains(text(),'Sign in')]"
  element :button_home, :xpath, "//yt-formatted-string[contains(text(),'Home')]"
  element :button_library, :xpath, "//yt-formatted-string[contains(text(),'Library')]"
  element :button_explore, :xpath, "//yt-formatted-string[contains(text(),'Explore')]"
  element :button_upgrade, :xpath, "//yt-formatted-string[contains(text(),'Upgrade')]"
  element :search_landing_page ,:xpath, "//span[contains(text(),'Search')]"
  element :button_play, :xpath, "(//ytmusic-play-button-renderer)[1]"
  element :page_player, :xpath, "//div[@class='content style-scope ytmusic-player-page']"
  element :bar_player, :xpath, "//ytmusic-player-bar[@class='style-scope ytmusic-app']"
  element :section_progress_bar, :xpath, "//div[@class='bar-container style-scope tp-yt-paper-slider']//div[@id='progressContainer'] "
  def verify_landing_page
    using_wait_time 10 do
      raise "Landing page youtube music tidak ditemukan" unless has_landing_page?
      raise "Logo youtube music tidak ada di landing page" unless has_logo_landing_page?
    end
  end

  def click_sign_in
    wait_until_button_sign_in_visible
    button_sign_in.click
  end

  def verify_tab_bar_landing_page
    using_wait_time 10 do
      raise "Menu home tidak ada di landing page" unless has_button_home?
      raise "Menu library tidak ada di landing page" unless has_button_library?
      raise "Menu explore tidak ada di landing page" unless has_button_explore?
      raise "Menu upgrade tidak ada di landing page" unless has_button_upgrade?
      raise "Section search tidak ada di landing page" unless has_search_landing_page?
    end
  end

  def click_menu_home
    wait_until_button_home_visible
    button_home.click
  end

  def play_first_album
    wait_until_button_play_visible
    button_play.click
    using_wait_time 10 do
      raise "Page player tidak ditemukan" unless has_page_player?
      raise "Section bar player tidak ditemukan" unless has_bar_player?
      raise "Section progress bar tidak ditemukan" unless has_section_progress_bar?
    end
  end
end