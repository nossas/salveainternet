if Rails.env.production?
  DEPUTIES_EMAILS = [
    "Vicentinho <dep.vicentinho@camara.leg.br>",
    "Eduardo Cunha <dep.eduardocunha@camara.leg.br>",
    "Eduardo da Fonte <dep.eduardodafonte@camara.leg.br>",
    "Antonio Imbassahy <dep.antonioimbassahy@camara.leg.br>",
    "Moreira Mendes <dep.moreiramendes@camara.leg.br>",
    "Anthony Garotinho <dep.anthonygarotinho@camara.leg.br>",
    "Mendonça Filho <dep.mendoncafilho@camara.leg.br>",
    "Beto Albuquerque <dep.betoalbuquerque@camara.leg.br>",
    "Fernando Francischini <dep.fernandofrancischini@camara.leg.br>",
    "Vieira da Cunha <dep.vieiradacunha@camara.leg.br>",
    "Jovair Arantes <dep.jovairarantes@camara.leg.br>",
    "Jandira Feghali <dep.jandirafeghali@camara.leg.br>",
    "André Moura <dep.andremoura@camara.leg.br>",
    "George Hilton <dep.georgehilton@camara.leg.br>",
    "Sarney Filho <dep.sarneyfilho@camara.leg.br>",
    "Rubens Bueno <dep.rubensbueno@camara.leg.br>",
    "Ivan Valente <dep.ivanvalente@camara.leg.br>",
    "Francisco Tenório <dep.franciscotenorio@camara.leg.br>",
    "Arlindo Chinaglia <dep.arlindochinaglia@camara.leg.br>",
    "Domingos Sávio <dep.domingossavio@camara.leg.br>",
    "Givaldo Carimbão <dep.givaldocarimbao@camara.leg.br>",
    "Luis Tibé <dep.luistibe@camara.leg.br>",
    "Chico das Verduras <dep.chicodasverduras@camara.leg.br>"
  ]
else
  raise "TEST_EMAIL is missing" if ENV["TEST_EMAIL"].nil?
  DEPUTIES_EMAILS = ENV["TEST_EMAIL"]
end
