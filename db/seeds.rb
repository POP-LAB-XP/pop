# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

forum = Forum.create({ nome: 'Teste'})

sub_prefeitura = SubPrefeitura.create({ 
	nome: 'SubPrefeitura de Teste', 
	codigo: '12345678', 
	limite_de_usuarios: 3, 
	forum: forum
})
