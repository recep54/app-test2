require 'watir'
# require 'json'


def connection
  @browser = Watir::Browser.new(:firefox)
  @browser.goto "https://www.instagram.com/accounts/login"

  # facebook = @browser.text_field(id: '_0mzm- sqdOP yWX7d        ')
  # @browser.link(facebook).click
  # @browser.link(class: "KPnG0").click
  @browser.button(:xpath => "/html/body/span/section/main/div/article/div/div[1]/div/form/div[5]/button").click


  mail = @browser.text_field(id: "email") # select barre de recherche
  mail.set("selmankara@outlook.fr") # search

  mdp = @browser.text_field(id: "pass") # select barre de recherche
  mdp.set("mustafa5403") # search

  mdp.send_keys(:enter)
  sleep(10)
  # puts "hey on est connecter mais attend"
  # sleep(3)
  # puts "hey on peut cliquer"

  # @browser.button(class: ["aOOlW", "HoLwm"]).click
  # @browser.button(class: ["_0mzm-", "dCJp8"]).click


end

def scrap
  sleep(5)
  @browser.goto "https://www.instagram.com/openclassrooms/"
  sleep(3)
  @browser.a(class: "-nal3 ").click

  # user = @browser.a(class: ["FPmhX", "notranslate", "_0imsa"])
  # user.each do |i|
  #   puts i.text
  # end
  sleep(5)
  # ab = @browser.a(class: ["FPmhX", "notranslate", "_0imsa"])
  # ab.click

  # abc = @browser.elements(class: ["FPmhX", "notranslate", "_0imsa"])
  # puts abc.size
  # puts abc
  @liste = []
  @browser.elements(class: ["FPmhX", "notranslate", "_0imsa"]).each do |td|
    # puts td.a.href
    puts td.text
    puts td.href
    @liste << td.href
  end
end

def like
  #@browser.goto "https://www.instagram.com/im_princeguevro/"
  sleep(3)
  a = []
  @browser.elements(class: ["v1Nh3", "kIKUG",  "_bz0w"]).each do |td|
    # puts td.a.href
    # puts td.text
    puts td.a.href
    a << td.a.href
  end

  a.each do |i|
    @browser.goto i
    sleep(10)
  #   @browser.goto "https://www.instagram.com/p/BqM3zCEFfCs/"
  # sleep(2)
    @browser.button(class: ["coreSpriteHeartOpen", "_0mzm-", "dCJp8"]).click

    comment = @browser.textarea(class: "Ypffh")
    comment.set("Viens voir notre projet http://thehackingproject.org/ si tu veux apprendre à coder lien dans ma bio")
    comment.send_keys(:enter)
  end

  # coreSpriteHeartOpen _0mzm- dCJp8
# v1Nh3 kIKUG  _bz0w

  # http://thehackingproject.org/
end

def perform
  connection
  scrap
  @liste.each do |i|
    @browser.goto i
    like
  end
  # sleep(10)
  # @browser.close
end


perform


