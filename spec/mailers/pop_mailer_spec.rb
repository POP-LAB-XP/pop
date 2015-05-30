require "rails_helper"

RSpec.describe PopMailer, type: :mailer do
  describe 'cadastrar' do
    let(:user) { build(:user, email: 'teste@email.com') }
    let(:mail) { PopMailer.termos_email(user) }
 
    it 'é esperado que haja um assunto' do
      expect(mail.subject).to eql('Seja bem vindo ao POP!!')
    end
 
    it 'é esperado que o email tenha um destinatário' do
      expect(mail.to).to eql([user.email])
    end
 
    it "é esperado que o campo 'from' seja preenchido" do
      expect(mail.from).to eql(['pop@ime.com'])
    end
 
    it 'é esperado que o login do usuário apareça no email' do
      expect(mail.body.encoded).to match(user.email)
    end

    #TODO
   
    #it 'é esperado que o email contenha os termos de uso' do
    #  expect(mail.body.encoded).to match("http://aplication_url/#{user.id}/confirmation")
    #end
 	
    #it 'é esperado que o email contenha uma @confirmation_url' do
    #  expect(mail.body.encoded).to match("http://pop-lab-xp.herokuapp.com/#{user.id}/confirmation")
    #end

  end

end
