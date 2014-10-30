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

ActiveRecord::Schema.define(version: 20141026100058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achats", force: true do |t|
    t.integer  "fournisseur_id",              default: -1
    t.string   "fournisseur_libre"
    t.datetime "date_achat"
    t.string   "type_ac",           limit: 1, default: "A"
    t.decimal  "somme",                       default: 0.0
    t.decimal  "payee",                       default: 0.0
    t.string   "etat_achat",        limit: 1, default: "n"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "achats", ["fournisseur_id"], name: "index_achats_on_fournisseur_id", using: :btree

  create_table "alignes", force: true do |t|
    t.integer  "achat_id"
    t.integer  "article_id",           default: -1
    t.integer  "cadre_id",             default: -1
    t.decimal  "qte",                  default: 0.0
    t.decimal  "qtelivre",             default: 0.0
    t.decimal  "prix_u",               default: 0.0
    t.decimal  "montant",              default: 0.0
    t.string   "etat",       limit: 1, default: "n"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alignes", ["achat_id"], name: "index_alignes_on_achat_id", using: :btree
  add_index "alignes", ["article_id"], name: "index_alignes_on_article_id", using: :btree
  add_index "alignes", ["cadre_id"], name: "index_alignes_on_cadre_id", using: :btree

  create_table "articles", force: true do |t|
    t.string   "name"
    t.string   "reference"
    t.decimal  "stock",                default: 0.0
    t.string   "etat",       limit: 1, default: "a"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banques", force: true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boutiques", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cadres", force: true do |t|
    t.string   "numerobaguete", limit: 30
    t.text     "info"
    t.decimal  "stock",                    default: 0.0
    t.string   "etat",          limit: 1,  default: "a"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categoriedeps", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "phone"
    t.text     "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coffres", force: true do |t|
    t.decimal  "paiement"
    t.decimal  "font"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "depenses", force: true do |t|
    t.string   "description"
    t.integer  "categoriedep_id"
    t.string   "montant",                   default: "0"
    t.string   "etat_dep",        limit: 1, default: "i"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "depenses", ["categoriedep_id"], name: "index_depenses_on_categoriedep_id", using: :btree

  create_table "employes", force: true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "sexe"
    t.string   "phone"
    t.text     "address"
    t.string   "email"
    t.string   "compte_banc"
    t.decimal  "salaireb",    default: 0.0
    t.string   "type_em"
    t.date     "date_recru"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formatphotos", force: true do |t|
    t.string   "dimention",  limit: 20
    t.text     "info"
    t.string   "etat",       limit: 1,  default: "a"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fournisseurs", force: true do |t|
    t.string   "name_company"
    t.string   "nom"
    t.string   "prenom"
    t.string   "phone"
    t.text     "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paiements", force: true do |t|
    t.integer  "vente_id"
    t.integer  "client_id"
    t.integer  "achat_id"
    t.integer  "fournisseur_id"
    t.datetime "datepaiement"
    t.string   "motif"
    t.decimal  "montant",        default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paiements", ["achat_id"], name: "index_paiements_on_achat_id", using: :btree
  add_index "paiements", ["client_id"], name: "index_paiements_on_client_id", using: :btree
  add_index "paiements", ["fournisseur_id"], name: "index_paiements_on_fournisseur_id", using: :btree
  add_index "paiements", ["vente_id"], name: "index_paiements_on_vente_id", using: :btree

  create_table "prestationlignes", force: true do |t|
    t.integer  "prestation_id"
    t.integer  "cadre_id",                 default: -1
    t.integer  "formatphoto_id",           default: -1
    t.decimal  "qte",                      default: 0.0
    t.decimal  "qtelivre",                 default: 0.0
    t.decimal  "prix_u",                   default: 0.0
    t.decimal  "montant",                  default: 0.0
    t.integer  "numero_prise",             default: 0
    t.string   "type_pl",        limit: 2, default: "sp"
    t.string   "etat",           limit: 1, default: "n"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prestationlignes", ["cadre_id"], name: "index_prestationlignes_on_cadre_id", using: :btree
  add_index "prestationlignes", ["formatphoto_id"], name: "index_prestationlignes_on_formatphoto_id", using: :btree
  add_index "prestationlignes", ["prestation_id"], name: "index_prestationlignes_on_prestation_id", using: :btree

  create_table "prestations", force: true do |t|
    t.integer  "client_id",                 default: -1
    t.string   "client_libre",              default: "No"
    t.integer  "employe_id",                default: -1
    t.datetime "date_prestation"
    t.string   "etat_prestation", limit: 1, default: "n"
    t.decimal  "somme",                     default: 0.0
    t.decimal  "payee",                     default: 0.0
    t.string   "type_pr",         limit: 1, default: "s"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prestations", ["client_id"], name: "index_prestations_on_client_id", using: :btree
  add_index "prestations", ["employe_id"], name: "index_prestations_on_employe_id", using: :btree

  create_table "stocks", force: true do |t|
    t.integer  "cadre_id"
    t.integer  "article_id"
    t.decimal  "stoc",       default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stocks", ["article_id"], name: "index_stocks_on_article_id", using: :btree
  add_index "stocks", ["cadre_id"], name: "index_stocks_on_cadre_id", using: :btree

  create_table "tbanques", force: true do |t|
    t.integer  "banque_id"
    t.string   "type_rv",    limit: 1, default: "v"
    t.decimal  "montant",              default: 0.0
    t.string   "porteur"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tbanques", ["banque_id"], name: "index_tbanques_on_banque_id", using: :btree

  create_table "tcoffres", force: true do |t|
    t.datetime "date_tc"
    t.string   "beneficier"
    t.string   "type_tc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "ventelignes", force: true do |t|
    t.integer  "vente_id"
    t.integer  "article_id",           default: -1
    t.integer  "cadre_id",             default: -1
    t.decimal  "qte",                  default: 0.0
    t.decimal  "qtelivre",             default: 0.0
    t.decimal  "prix_u",               default: 0.0
    t.decimal  "montant",              default: 0.0
    t.string   "etat",       limit: 1, default: "n"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ventelignes", ["article_id"], name: "index_ventelignes_on_article_id", using: :btree
  add_index "ventelignes", ["cadre_id"], name: "index_ventelignes_on_cadre_id", using: :btree
  add_index "ventelignes", ["vente_id"], name: "index_ventelignes_on_vente_id", using: :btree

  create_table "ventes", force: true do |t|
    t.integer  "boutique_id",            default: -1
    t.integer  "client_id",              default: -1
    t.string   "client_libre",           default: "No"
    t.datetime "date_vente"
    t.string   "etat_vente",   limit: 1, default: "n"
    t.decimal  "somme",                  default: 0.0
    t.decimal  "payee",                  default: 0.0
    t.string   "type_ve",      limit: 1, default: "A"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ventes", ["boutique_id"], name: "index_ventes_on_boutique_id", using: :btree
  add_index "ventes", ["client_id"], name: "index_ventes_on_client_id", using: :btree

end
