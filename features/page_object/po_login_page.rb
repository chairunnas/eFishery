class LoginPage < SitePrism::Page
  element :input_email, :xpath, "//input[@id='identifierId']"
  element :input_password, :xpath, "//*[@type='password']"
  element :button_next, :xpath, "//span[contains(text(),'Next')]"
  element :button_confirm, :xpath, "//span[contains(text(),'Confirm')]"

  def login_user_with_email
    wait_until_input_email_visible
    input_email.set("#{$email_user}")
    button_next.click
    wait_until_input_password_visible
    input_password.set("#{$password_user}")
    button_next.click
    using_wait_time 5 do
      if has_button_confirm?
        button_confirm.click
      end
    end
    $landing_page.wait_until_landing_page_visible
  end

  def close_modal_new_avatar
    using_wait_time 2 do
      if has_modal_profile_new_avatar?
        until has_button_skip? == false do
          button_skip.click
        end
      end
      raise "Modal profile new avatar masih di munculkan" if has_modal_profile_new_avatar?
    end
  end
end