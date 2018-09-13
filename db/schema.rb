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

ActiveRecord::Schema.define(version: 2018_09_07_000907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "agencia_bancaria", force: :cascade do |t|
    t.integer "numero"
    t.text "endereco"
    t.index ["numero"], name: "index_agencia_bancaria_on_numero", unique: true
  end

  create_table "conta_bancaria", force: :cascade do |t|
    t.integer "numero_agencia", null: false
    t.integer "numero", null: false
    t.integer "limite", null: false
    t.index ["numero"], name: "index_conta_bancaria_on_numero", unique: true
  end

  create_table "movimentacao_bancaria", force: :cascade do |t|
    t.integer "numero_conta", null: false
    t.datetime "data_movimentacao", null: false
    t.decimal "valor", default: "0.0", null: false
    t.string "tipo_movimentacao", null: false
    t.integer "usuario", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "conta_bancaria", "agencia_bancaria", column: "numero_agencia", primary_key: "numero"
  add_foreign_key "movimentacao_bancaria", "conta_bancaria", column: "numero_conta", primary_key: "numero"
  add_foreign_key "movimentacao_bancaria", "usuarios", column: "usuario"
end
