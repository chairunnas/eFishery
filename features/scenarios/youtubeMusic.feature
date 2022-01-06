@youtube_music
Feature: Login youtube music

  @login_youtube_music
  Scenario: Verify menu stream
    Given user go to youtube music page
    When user logged in with email
    Then user verify youtube music page

  @play_first_album_home
  Scenario: Verify menu stream
    Given user go to youtube music page
    When user click menu home
    Then user play first album