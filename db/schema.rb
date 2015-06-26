# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150619204633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acao_tipos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acaos", force: true do |t|
    t.integer  "user_id"
    t.integer  "acao_tipo_id"
    t.integer  "proposta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acaos", ["acao_tipo_id"], name: "index_acaos_on_acao_tipo_id", using: :btree
  add_index "acaos", ["proposta_id"], name: "index_acaos_on_proposta_id", using: :btree
  add_index "acaos", ["user_id"], name: "index_acaos_on_user_id", using: :btree

  create_table "aluno", id: false, force: true do |t|
    t.decimal "nroaluno",             precision: 9, scale: 0, null: false
    t.string  "nomealuno", limit: 30
    t.string  "formacao",  limit: 25
    t.string  "nivel",     limit: 2
    t.decimal "idade",                precision: 3, scale: 0
  end

  create_table "autor", id: false, force: true do |t|
    t.integer "id",              null: false
    t.string  "nome", limit: 30, null: false
  end

  create_table "avaliacao", id: false, force: true do |t|
    t.datetime "data_horario_lance",            null: false
    t.string   "email_u",            limit: 50, null: false
    t.integer  "idleilao",                      null: false
    t.integer  "escala"
    t.text     "descricao"
  end

  create_table "backers", primary_key: "bid", force: true do |t|
    t.string "name", limit: 254, null: false
  end

  create_table "categoria", id: false, force: true do |t|
    t.integer "id",                    null: false
    t.string  "nome",       limit: 30, null: false
    t.text    "descricao"
    t.integer "supercatid"
  end

  add_index "categoria", ["nome"], name: "categoria_nome_key", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string "name", limit: 127, null: false
  end

  create_table "colecao", id: false, force: true do |t|
    t.integer "id",                   null: false
    t.string  "nome",      limit: 30, null: false
    t.text    "descricao"
    t.integer "numlivros",            null: false
  end

  create_table "colecaocontem", id: false, force: true do |t|
    t.string  "isbn",      limit: 13, null: false
    t.integer "idcolecao",            null: false
  end

  create_table "compra", id: false, force: true do |t|
    t.datetime "data_horario_lance",            null: false
    t.string   "email_u",            limit: 50, null: false
    t.integer  "idleilao",                      null: false
    t.string   "status",             limit: 20, null: false
  end

  create_table "creators", primary_key: "cid", force: true do |t|
    t.string "name", limit: 254, null: false
  end

  create_table "curso", id: false, force: true do |t|
    t.string  "nome",    limit: 40,                         null: false
    t.string  "horario", limit: 20
    t.string  "sala",    limit: 10
    t.decimal "idprof",             precision: 9, scale: 0
  end

  create_table "editora", id: false, force: true do |t|
    t.integer "id",                  null: false
    t.string  "nome",     limit: 30, null: false
    t.string  "endereco", limit: 50
    t.string  "telefone", limit: 15
    t.string  "email",    limit: 50
  end

  create_table "entrega", id: false, force: true do |t|
    t.datetime "data_horario_lance",             null: false
    t.string   "email_u",            limit: 50,  null: false
    t.integer  "idleilao",                       null: false
    t.string   "tipoentrega",        limit: 20,  null: false
    t.string   "transportadora",     limit: 100, null: false
    t.datetime "dataenvio",                      null: false
    t.datetime "datarecebimento",                null: false
    t.string   "status",             limit: 20,  null: false
    t.integer  "numrastreamento",                null: false
  end

  create_table "escreve", id: false, force: true do |t|
    t.string  "isbn",    limit: 13, null: false
    t.integer "idautor",            null: false
  end

  create_table "fazpartede", id: false, force: true do |t|
    t.string "email_u", limit: 50, null: false
    t.string "perfil",  limit: 20, null: false
  end

  create_table "fornecedor", id: false, force: true do |t|
    t.string  "fnum",   limit: 10,             null: false
    t.string  "fnome",  limit: 32,             null: false
    t.integer "status",            default: 0, null: false
    t.string  "cidade", limit: 32,             null: false
  end

  create_table "forums", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lance", id: false, force: true do |t|
    t.datetime "data_horario",                                     null: false
    t.string   "email_u",      limit: 50,                          null: false
    t.integer  "idleilao",                                         null: false
    t.decimal  "valor",                   precision: 10, scale: 2, null: false
  end

  create_table "leilao", id: false, force: true do |t|
    t.integer "id",                                            null: false
    t.string  "email_u",   limit: 50
    t.date    "dataini",                                       null: false
    t.date    "datafim",                                       null: false
    t.decimal "lancemin",             precision: 10, scale: 2, null: false
    t.text    "descricao",                                     null: false
  end

  create_table "leiloa", id: false, force: true do |t|
    t.integer "idproduto",                null: false
    t.integer "idleilao",                 null: false
    t.boolean "ativo",     default: true, null: false
  end

  create_table "livroabstrato", id: false, force: true do |t|
    t.string  "isbn",          limit: 13, null: false
    t.integer "ideditora",                null: false
    t.string  "idioma",        limit: 20
    t.string  "titulo",        limit: 20, null: false
    t.text    "descricao"
    t.integer "edicao",                   null: false
    t.integer "numpags"
    t.string  "anopublicacao", limit: 4
  end

  create_table "livrofisico", id: false, force: true do |t|
    t.integer "id",                   null: false
    t.string  "isbn",      limit: 13, null: false
    t.string  "condicao",  limit: 50, null: false
    t.text    "descricao"
  end

  create_table "matriculado", id: false, force: true do |t|
    t.decimal "nroaluno",             precision: 9, scale: 0, null: false
    t.string  "nomecurso", limit: 40,                         null: false
  end

  create_table "pagamento", id: false, force: true do |t|
    t.datetime "data_horario_lance",                                     null: false
    t.string   "email_u",            limit: 50,                          null: false
    t.integer  "idleilao",                                               null: false
    t.string   "status",             limit: 20,                          null: false
    t.decimal  "valor",                         precision: 10, scale: 2, null: false
  end

  create_table "peca", id: false, force: true do |t|
    t.string  "pnum",   limit: 10, null: false
    t.string  "pnome",  limit: 32, null: false
    t.string  "cor",    limit: 10, null: false
    t.integer "peso",              null: false
    t.string  "cidade", limit: 32, null: false
  end

  create_table "perfil", id: false, force: true do |t|
    t.string "nome",      limit: 20, null: false
    t.text   "descricao",            null: false
  end

  create_table "pertencecategoria", id: false, force: true do |t|
    t.string  "isbn",        limit: 13, null: false
    t.integer "idcategoria",            null: false
  end

  create_table "pledges", id: false, force: true do |t|
    t.integer "bid",                     null: false
    t.integer "pid",                     null: false
    t.integer "rewardlevel",             null: false
    t.integer "amount",      default: 1, null: false
  end

  create_table "poderealizar", id: false, force: true do |t|
    t.string "perfil",  limit: 20, null: false
    t.string "servico", limit: 20, null: false
  end

  create_table "poss", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professor", id: false, force: true do |t|
    t.decimal "idprof",              precision: 9, scale: 0, null: false
    t.string  "nomeprof", limit: 30
    t.decimal "iddepto",             precision: 2, scale: 0
  end

  create_table "projects", primary_key: "pid", force: true do |t|
    t.integer "cid",                                      null: false
    t.integer "category",                                 null: false
    t.date    "startdate",                                null: false
    t.integer "duration",                default: 30
    t.integer "goal",                                     null: false
    t.string  "status",      limit: 15,  default: "live", null: false
    t.string  "title",       limit: 127,                  null: false
    t.text    "description",                              null: false
  end

  create_table "projeto", id: false, force: true do |t|
    t.string "jnum",   limit: 10, null: false
    t.string "jnome",  limit: 32, null: false
    t.string "cidade", limit: 32, null: false
  end

  create_table "proposta", force: true do |t|
    t.string   "descricao"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tema_principal_id"
    t.integer  "tema_opcional_id"
    t.string   "palavra_chave",     limit: 32
    t.integer  "votos_count",                  default: 0
    t.integer  "status"
  end

  add_index "proposta", ["tema_opcional_id"], name: "index_proposta_on_tema_opcional_id", using: :btree
  add_index "proposta", ["tema_principal_id"], name: "index_proposta_on_tema_principal_id", using: :btree
  add_index "proposta", ["user_id"], name: "index_proposta_on_user_id", using: :btree

  create_table "reclamacao", id: false, force: true do |t|
    t.integer "id",                     null: false
    t.string  "email_remet", limit: 50, null: false
    t.string  "email_dest",  limit: 50, null: false
    t.string  "tipo",        limit: 20, null: false
    t.text    "descricao",              null: false
  end

  create_table "reclamacaodoparticipante", id: false, force: true do |t|
    t.integer  "id",                            null: false
    t.datetime "data_horario_lance",            null: false
    t.string   "email_u",            limit: 50, null: false
    t.integer  "idleilao",                      null: false
  end

  create_table "reclamacaonaoparticipante", id: false, force: true do |t|
    t.integer "id",       null: false
    t.integer "idleilao", null: false
  end

  create_table "remessa", id: false, force: true do |t|
    t.string  "fnum", limit: 10, null: false
    t.string  "pnum", limit: 10, null: false
    t.string  "jnum", limit: 10, null: false
    t.integer "qtde",            null: false
  end

  create_table "rewards", id: false, force: true do |t|
    t.integer "pid",                     null: false
    t.integer "rewardlevel",             null: false
    t.integer "minamount",               null: false
    t.integer "quantity",    default: 1, null: false
    t.text    "description",             null: false
  end

  create_table "servico", id: false, force: true do |t|
    t.string "nome",      limit: 20, null: false
    t.text   "descricao",            null: false
  end

  create_table "sub_prefeituras", force: true do |t|
    t.string   "nome"
    t.string   "codigo"
    t.integer  "limite_de_usuarios"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_id"
    t.string   "cidade"
  end

  add_index "sub_prefeituras", ["forum_id"], name: "index_sub_prefeituras_on_forum_id", using: :btree

  create_table "temas", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tiporeclamacao", id: false, force: true do |t|
    t.string "nome",           limit: 20, null: false
    t.string "papelremetente", limit: 20, null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sub_prefeitura_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["sub_prefeitura_id"], name: "index_users_on_sub_prefeitura_id", using: :btree

  create_table "usuario", id: false, force: true do |t|
    t.string "email",    limit: 50, null: false
    t.string "nome",     limit: 30, null: false
    t.string "senha",    limit: 30, null: false
    t.string "endereco", limit: 50, null: false
  end

  create_table "vetos", force: true do |t|
    t.string   "descricao"
    t.integer  "user_id"
    t.integer  "proposta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vetos", ["proposta_id"], name: "index_vetos_on_proposta_id", using: :btree
  add_index "vetos", ["user_id"], name: "index_vetos_on_user_id", using: :btree

  create_table "votos", force: true do |t|
    t.integer  "proposta_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votos", ["proposta_id"], name: "index_votos_on_proposta_id", using: :btree
  add_index "votos", ["user_id"], name: "index_votos_on_user_id", using: :btree

end
