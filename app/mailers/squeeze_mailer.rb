class SqueezeMailer < ActionMailer::Base
  default from: "Rodrigo - Meu Rio <contato@meurio.org.br>"

  def dont_let_them_limit_our_access_to_the_internet squeeze
    headers "X-SMTPAPI" => "{ \"category\": [\"salveainternet\", \"dont_let_them_limit_our_access_to_the_internet\"] }"
    @squeeze = squeeze
    mail(to: @squeeze.email, subject: "Pressão nos senadores: use a internet para salvar a internet!")
  end

  def you_cant_negotiate_the_neutrality_of_the_internet squeeze
    headers "X-SMTPAPI" => "{ \"category\": [\"salveainternet\", \"you_cant_negotiate_the_neutrality_of_the_internet\"] }"
    mail(to: DEPUTIES_EMAILS, subject: "Senador, aprove o Marco Civil votado pela Câmara", from: "#{squeeze.first_name} #{squeeze.last_name} <#{squeeze.email}>")
  end
end
