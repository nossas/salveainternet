class SqueezeMailer < ActionMailer::Base
  default from: "Rodrigo - Meu Rio <contato@meurio.org.br>"

  def dont_let_them_limit_our_access_to_the_internet squeeze
    @squeeze = squeeze
    headers "X-SMTPAPI" => "{ \"category\": [\"salveainternet\", \"dont_let_them_limit_our_access_to_the_internet\"] }"
    mail(to: @squeeze.email, subject: "Não deixe o deputado Eduardo Cunha limitar nosso acesso à internet")
  end

  def you_cant_negotiate_the_neutrality_of_the_internet squeeze
    headers "X-SMTPAPI" => "{ \"category\": [\"salveainternet\", \"you_cant_negotiate_the_neutrality_of_the_internet\"] }"
    mail(to: DEPUTIES_EMAILS, subject: "Deputado, a neutralidade da rede é inegociável", from: "#{squeeze.first_name} #{squeeze.last_name} <#{squeeze.email}>")
  end
end
