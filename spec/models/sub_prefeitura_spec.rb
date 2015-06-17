require 'rails_helper'

RSpec.describe SubPrefeitura, type: :model do
	let(:sub_prefeitura) { 
		build(:sub_prefeitura, :limite_de_usuarios => 1) 
	}

	let(:user) { 
		build(:user) 
	}


	it "deve ter um limite de usuários" do
	 sub_prefeitura.limite_de_usuarios.should == 1
	end

	describe 'limitar' do
	  it "quando não atingir o limite, deve permitir que mais usuários entrem" do
	 	  sub_prefeitura.limite_usuario_atingido.should == false
	  end

	  it "quando atingir o limite, deve avisar que o limite foi atingido" do
		sub_prefeitura.stubs(:users => [user])
	 	sub_prefeitura.limite_usuario_atingido.should == true
	  end
	end

	describe 'numero de usuarios' do
		it "numero de usuario deve ser igual ao count de users" do
			sub_prefeitura.numero_de_usuarios.should == sub_prefeitura.users.count
		end
	end

end
