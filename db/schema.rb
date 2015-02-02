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

ActiveRecord::Schema.define(version: 20150129223557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achats", force: true do |t|
    t.integer  "fournisseur_id",               default: -1
    t.string   "fournisseur_libre",            default: "No"
    t.datetime "date_achat"
    t.string   "type_ac",           limit: 1,  default: "A"
    t.decimal  "somme",                        default: 0.0
    t.decimal  "payee",                        default: 0.0
    t.decimal  "tva",                          default: 0.0
    t.string   "etat_achat",        limit: 1,  default: "n"
    t.string   "num_ac",            limit: 30
    t.string   "valide",            limit: 1,  default: "n"
    t.integer  "monetaire_id",                 default: -1
    t.integer  "retoure",                      default: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "achats", ["fournisseur_id"], name: "index_achats_on_fournisseur_id", using: :btree
  add_index "achats", ["monetaire_id"], name: "index_achats_on_monetaire_id", using: :btree
  add_index "achats", ["user_id"], name: "index_achats_on_user_id", using: :btree

  create_table "alignes", force: true do |t|
    t.integer  "achat_id"
    t.integer  "article_id",           default: -1
    t.integer  "cadre_id",             default: -1
    t.decimal  "qte",                  default: 0.0
    t.decimal  "qtelivre",             default: 0.0
    t.decimal  "prix_u",               default: 0.0
    t.decimal  "prix_u1",              default: 0.0
    t.decimal  "montant",              default: 0.0
    t.decimal  "montant1",             default: 0.0
    t.decimal  "remise",               default: 0.0
    t.string   "etat",       limit: 1, default: "n"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alignes", ["achat_id"], name: "index_alignes_on_achat_id", using: :btree
  add_index "alignes", ["article_id"], name: "index_alignes_on_article_id", using: :btree
  add_index "alignes", ["cadre_id"], name: "index_alignes_on_cadre_id", using: :btree
  add_index "alignes", ["user_id"], name: "index_alignes_on_user_id", using: :btree

  create_table "articles", force: true do |t|
    t.integer  "fournisseur_id"
    t.string   "name",                                   null: false
    t.string   "reference"
    t.decimal  "stock",                    default: 0.0
    t.decimal  "vstock",                   default: 0.0
    t.decimal  "dstock",                   default: 0.0
    t.decimal  "EnCommande",               default: 0.0
    t.decimal  "pachat",                   default: 0.0
    t.decimal  "pdetail",                  default: 0.0
    t.decimal  "pgros",                    default: 0.0
    t.string   "etat",           limit: 1, default: "a"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["fournisseur_id"], name: "index_articles_on_fournisseur_id", using: :btree
  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "balances", force: true do |t|
    t.integer  "exercice"
    t.integer  "mois"
    t.decimal  "achats",      default: 0.0
    t.decimal  "atva",        default: 0.0
    t.decimal  "depenses",    default: 0.0
    t.decimal  "dtva",        default: 0.0
    t.decimal  "ventes",      default: 0.0
    t.decimal  "vtva",        default: 0.0
    t.decimal  "prestations", default: 0.0
    t.decimal  "tva_net",     default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banques", force: true do |t|
    t.string   "nom"
    t.string   "compte"
    t.decimal  "solde",      default: 0.0
    t.decimal  "font",       default: 0.0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banques", ["user_id"], name: "index_banques_on_user_id", using: :btree

  create_table "boutiques", force: true do |t|
    t.string   "name",                                null: false
    t.string   "phone"
    t.text     "address"
    t.integer  "user_id"
    t.string   "etat",       limit: 10, default: "a"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boutiques", ["user_id"], name: "index_boutiques_on_user_id", using: :btree

  create_table "cadres", force: true do |t|
    t.integer  "fournisseur_id"
    t.string   "numerobaguete",  limit: 30,               null: false
    t.text     "info"
    t.decimal  "stock",                     default: 0.0
    t.decimal  "vstock",                    default: 0.0
    t.decimal  "dstock",                    default: 0.0
    t.decimal  "EnCommande",                default: 0.0
    t.decimal  "pachat",                    default: 0.0
    t.decimal  "pdetail",                   default: 0.0
    t.decimal  "pgros",                     default: 0.0
    t.string   "etat",           limit: 1,  default: "a"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cadres", ["fournisseur_id"], name: "index_cadres_on_fournisseur_id", using: :btree
  add_index "cadres", ["user_id"], name: "index_cadres_on_user_id", using: :btree

  create_table "categoriedeps", force: true do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categoriedeps", ["user_id"], name: "index_categoriedeps_on_user_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "nom",                                 null: false
    t.string   "prenom"
    t.string   "phone"
    t.text     "address"
    t.string   "email"
    t.string   "type_cl",    limit: 1,  default: "o"
    t.string   "etat",       limit: 10, default: "a"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "coffres", force: true do |t|
    t.decimal  "paiement"
    t.decimal  "font"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "depenses", force: true do |t|
    t.integer  "categoriedep_id", default: -1
    t.integer  "employe_id",      default: -1
    t.string   "beneficiere",     default: "No"
    t.datetime "date_dep"
    t.string   "description"
    t.decimal  "montant"
    t.decimal  "tva",             default: 0.0
    t.string   "etat_dep",        default: "n"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "depenses", ["categoriedep_id"], name: "index_depenses_on_categoriedep_id", using: :btree
  add_index "depenses", ["employe_id"], name: "index_depenses_on_employe_id", using: :btree
  add_index "depenses", ["user_id"], name: "index_depenses_on_user_id", using: :btree

  create_table "employes", force: true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "sexe"
    t.string   "phone"
    t.text     "address"
    t.string   "email"
    t.string   "compte_banc"
    t.decimal  "salaireb",               default: 0.0
    t.string   "type_em"
    t.date     "date_recru"
    t.string   "etat",        limit: 10, default: "a"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employes", ["user_id"], name: "index_employes_on_user_id", using: :btree

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
    t.string   "etat",         limit: 10, default: "a"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fournisseurs", ["user_id"], name: "index_fournisseurs_on_user_id", using: :btree

  create_table "livraisonlogs", force: true do |t|
    t.datetime "date_liv"
    t.integer  "achat_id"
    t.integer  "article_id"
    t.integer  "cadre_id"
    t.decimal  "qte"
    t.integer  "vente_id"
    t.string   "type_liv",   limit: 10, null: false
    t.string   "etat"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "livraisonlogs", ["achat_id"], name: "index_livraisonlogs_on_achat_id", using: :btree
  add_index "livraisonlogs", ["article_id"], name: "index_livraisonlogs_on_article_id", using: :btree
  add_index "livraisonlogs", ["cadre_id"], name: "index_livraisonlogs_on_cadre_id", using: :btree
  add_index "livraisonlogs", ["user_id"], name: "index_livraisonlogs_on_user_id", using: :btree
  add_index "livraisonlogs", ["vente_id"], name: "index_livraisonlogs_on_vente_id", using: :btree

  create_table "monetaires", force: true do |t|
    t.string   "money"
    t.string   "code_money"
    t.decimal  "valeur"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "monetaires", ["user_id"], name: "index_monetaires_on_user_id", using: :btree

  create_table "optionretoures", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "etat",        limit: 10, default: "a"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "optionretoures", ["user_id"], name: "index_optionretoures_on_user_id", using: :btree

  create_table "paiements", force: true do |t|
    t.integer  "banque_id",                 default: -1
    t.string   "type_paiement",  limit: 10,               null: false
    t.integer  "boutique_id",               default: -1
    t.integer  "client_id",                 default: -1
    t.integer  "vente_id",                  default: -1
    t.integer  "prestation_id",             default: -1
    t.integer  "achat_id",                  default: -1
    t.integer  "fournisseur_id",            default: -1
    t.integer  "employe_id"
    t.datetime "datepaiement"
    t.string   "motif"
    t.decimal  "montant",                   default: 0.0
    t.string   "etat"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paiements", ["achat_id"], name: "index_paiements_on_achat_id", using: :btree
  add_index "paiements", ["banque_id"], name: "index_paiements_on_banque_id", using: :btree
  add_index "paiements", ["boutique_id"], name: "index_paiements_on_boutique_id", using: :btree
  add_index "paiements", ["client_id"], name: "index_paiements_on_client_id", using: :btree
  add_index "paiements", ["employe_id"], name: "index_paiements_on_employe_id", using: :btree
  add_index "paiements", ["fournisseur_id"], name: "index_paiements_on_fournisseur_id", using: :btree
  add_index "paiements", ["prestation_id"], name: "index_paiements_on_prestation_id", using: :btree
  add_index "paiements", ["user_id"], name: "index_paiements_on_user_id", using: :btree
  add_index "paiements", ["vente_id"], name: "index_paiements_on_vente_id", using: :btree

  create_table "prestation_attachments", force: true do |t|
    t.integer  "prestation_id"
    t.string   "photo"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prestation_attachments", ["prestation_id"], name: "index_prestation_attachments_on_prestation_id", using: :btree
  add_index "prestation_attachments", ["user_id"], name: "index_prestation_attachments_on_user_id", using: :btree

  create_table "prestationlignes", force: true do |t|
    t.integer  "prestation_id"
    t.integer  "cadre_id",                 default: -1
    t.integer  "formatphoto_id",           default: -1
    t.decimal  "qte",                      default: 0.0
    t.decimal  "qtelivre",                 default: 0.0
    t.decimal  "prix_u",                   default: 0.0
    t.decimal  "montant",                  default: 0.0
    t.integer  "numero_prise",             default: 0
    t.string   "type_pl",        limit: 2
    t.string   "color",          limit: 2
    t.decimal  "remise",                   default: 0.0
    t.string   "etat",           limit: 1, default: "n"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prestationlignes", ["cadre_id"], name: "index_prestationlignes_on_cadre_id", using: :btree
  add_index "prestationlignes", ["formatphoto_id"], name: "index_prestationlignes_on_formatphoto_id", using: :btree
  add_index "prestationlignes", ["prestation_id"], name: "index_prestationlignes_on_prestation_id", using: :btree
  add_index "prestationlignes", ["user_id"], name: "index_prestationlignes_on_user_id", using: :btree

  create_table "prestations", force: true do |t|
    t.integer  "client_id",                  default: -1
    t.string   "client_libre",               default: "No"
    t.integer  "employe_id",                 default: -1
    t.datetime "date_prestation"
    t.string   "etat_prestation", limit: 1,  default: "n"
    t.decimal  "somme",                      default: 0.0
    t.decimal  "payee",                      default: 0.0
    t.decimal  "tva",                        default: 0.0
    t.string   "type_pr",         limit: 1,  default: "s"
    t.string   "num_pr",          limit: 30
    t.string   "valide",          limit: 1,  default: "n"
    t.integer  "retoure",                    default: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prestations", ["client_id"], name: "index_prestations_on_client_id", using: :btree
  add_index "prestations", ["employe_id"], name: "index_prestations_on_employe_id", using: :btree
  add_index "prestations", ["user_id"], name: "index_prestations_on_user_id", using: :btree

  create_table "retourelogs", force: true do |t|
    t.string   "type_re",          limit: 10, null: false
    t.datetime "date_re"
    t.integer  "article_id"
    t.integer  "cadre_id"
    t.decimal  "qte"
    t.integer  "optionretoure_id"
    t.integer  "achat_id"
    t.integer  "vente_id"
    t.string   "motif"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "retourelogs", ["achat_id"], name: "index_retourelogs_on_achat_id", using: :btree
  add_index "retourelogs", ["article_id"], name: "index_retourelogs_on_article_id", using: :btree
  add_index "retourelogs", ["cadre_id"], name: "index_retourelogs_on_cadre_id", using: :btree
  add_index "retourelogs", ["optionretoure_id"], name: "index_retourelogs_on_optionretoure_id", using: :btree
  add_index "retourelogs", ["user_id"], name: "index_retourelogs_on_user_id", using: :btree
  add_index "retourelogs", ["vente_id"], name: "index_retourelogs_on_vente_id", using: :btree

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
    t.string   "nom",                                                   null: false
    t.string   "prenom",                                                null: false
    t.string   "email",                             default: "",        null: false
    t.string   "encrypted_password",                default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "role",                              default: "Inviter"
    t.string   "etat",                   limit: 10, default: "a"
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
    t.decimal  "remise",               default: 0.0
    t.string   "etat",       limit: 1, default: "n"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ventelignes", ["article_id"], name: "index_ventelignes_on_article_id", using: :btree
  add_index "ventelignes", ["cadre_id"], name: "index_ventelignes_on_cadre_id", using: :btree
  add_index "ventelignes", ["user_id"], name: "index_ventelignes_on_user_id", using: :btree
  add_index "ventelignes", ["vente_id"], name: "index_ventelignes_on_vente_id", using: :btree

  create_table "ventes", force: true do |t|
    t.integer  "boutique_id",             default: -1
    t.integer  "client_id",               default: -1
    t.string   "client_libre",            default: "No"
    t.datetime "date_vente"
    t.string   "etat_vente",   limit: 1,  default: "n"
    t.decimal  "somme",                   default: 0.0
    t.decimal  "payee",                   default: 0.0
    t.decimal  "tva",                     default: 0.0
    t.string   "type_ve",      limit: 1,  default: "A"
    t.string   "num_ve",       limit: 30
    t.string   "valide",       limit: 1,  default: "n"
    t.integer  "retoure",                 default: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ventes", ["boutique_id"], name: "index_ventes_on_boutique_id", using: :btree
  add_index "ventes", ["client_id"], name: "index_ventes_on_client_id", using: :btree
  add_index "ventes", ["user_id"], name: "index_ventes_on_user_id", using: :btree

end
