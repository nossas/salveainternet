if Rails.env.production?
  DEPUTIES_EMAILS = [
    # "Eduardo Cunha <dep.eduardocunha@camara.leg.br>",
    # "Eduardo da Fonte <dep.eduardodafonte@camara.leg.br>",
    # "Antonio Imbassahy <dep.antonioimbassahy@camara.leg.br>",
    # "Moreira Mendes <dep.moreiramendes@camara.leg.br>",
    # "Mendonça Filho <dep.mendoncafilho@camara.leg.br>",
    # "Bernardo Santana <dep.bernardosantanadevasconcellos@camara.leg.br>",
    # "Beto Albuquerque <dep.betoalbuquerque@camara.leg.br>",
    # "Fernando Francischini <dep.fernandofrancischini@camara.leg.br>",
    # "Vieira da Cunha <dep.vieiradacunha@camara.leg.br>",
    # "Jovair Arantes <dep.jovairarantes@camara.leg.br>",
    # "Jandira Feghali <dep.jandirafeghali@camara.leg.br>",
    # "André Moura <dep.andremoura@camara.leg.br>",
    # "George Hilton <dep.georgehilton@camara.leg.br>",
    # "Sarney Filho <dep.sarneyfilho@camara.leg.br>",
    # "Rubens Bueno <dep.rubensbueno@camara.leg.br>",
    # "Ivan Valente <dep.ivanvalente@camara.leg.br>",
    # "Francisco Tenório <dep.franciscotenorio@camara.leg.br>",
    # "Arlindo Chinaglia <dep.arlindochinaglia@camara.leg.br>",
    # "Domingos Sávio <dep.domingossavio@camara.leg.br>",
    # "Givaldo Carimbão <dep.givaldocarimbao@camara.leg.br>",
    # "Luis Tibé <dep.luistibe@camara.leg.br>",
    # "Chico das Verduras <dep.chicodasverduras@camara.leg.br>"
    "Wellington Dias <wellington.dias@senador.leg.br>",
    "Humberto Costa <humberto.costa@senador.leg.br>",
    "Acir Gurgazc <acir@senador.leg.br>",
    "Rodrigo Rollemberg <rollemberg@senador.leg.br>",
    "Vanessa Grazziotin <vanessa.grazziotin@senadora.leg.br>",
    "Randolfe Rodrigues <randolfe.rodrigues@senador.leg.br>",
    "Eunicio Oliviera <eunicio.oliveira@senador.leg.br>",
    "Francisco Dornelles <francisco.dornelles@senador.leg.br>",
    "Sergio Petecão <sergiopetecao@senador.leg.br>",
    "Paulo Davim <paulodavim@senador.leg.br>",
    "Wilder Morais <wilder.morais@senador.leg.br>",
    "Aloysio Nunes Ferreira <aloysionunes.ferreira@senador.leg.br>",
    "José Agripino <jose.agripino@senador.leg.br>",
    "Gim Argello <gim.argello@senador.leg.br>",
    "Alfredo Nascimento <alfredo.nascimento@senador.leg.br>",
    "Eduardo Amorim <eduardo.amorim@senador.leg.br>",
    "Marcelo Crivella <crivella@senador.leg.br>",
    "Vicentinho Alves <vicentinho.alves@senador.leg.br>",
    "Ataídes Oliveira <ataides.oliveira@senador.leg.br>",
    "Eduardo Braga <eduardo.braga@senador.leg.br>"
  ]
else
  raise "TEST_EMAIL is missing" if ENV["TEST_EMAIL"].nil?
  DEPUTIES_EMAILS = ENV["TEST_EMAIL"]
end
