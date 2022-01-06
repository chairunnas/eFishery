$landing_page = LandingPage.new

Given('user go to youtube music page') do
  $landing_page.verify_landing_page
end

Then('user verify youtube music page') do
  $landing_page.verify_landing_page
  $landing_page.verify_tab_bar_landing_page
end

When('user click menu home') do
  $landing_page.click_menu_home
end

And('user play first album') do
  $landing_page.play_first_album
end
