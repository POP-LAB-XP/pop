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

ActiveRecord::Schema.define(version: 20150424184504) do


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

  create_table "forums", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposta", force: true do |t|
    t.string   "descricao"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tema_1_id"
    t.integer  "tema_2_id"
    t.string   "palavra_chave", limit: 32
  end

  add_index "proposta", ["user_id"], name: "index_proposta_on_user_id", using: :btree

  create_table "sub_prefeituras", force: true do |t|
    t.string   "nome"
    t.string   "codigo"
    t.integer  "limite_de_usuarios"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_id"
  end

  add_index "sub_prefeituras", ["forum_id"], name: "index_sub_prefeituras_on_forum_id", using: :btree

  create_table "temas", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "votos", force: true do |t|
    t.integer  "proposta_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votos", ["proposta_id"], name: "index_votos_on_proposta_id", using: :btree
  add_index "votos", ["user_id"], name: "index_votos_on_user_id", using: :btree

end
