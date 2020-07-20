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

ActiveRecord::Schema.define(version: 20200715075835) do

  create_table "adhesions", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "date"
    t.string "adresse"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "adultes", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aquabikes", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nbpers"
    t.integer "nbseances"
    t.string "periode"
    t.string "duree"
    t.string "participant"
  end

  create_table "aquaboxings", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aquagyms", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.string "participant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aquaparcours", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecoles", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jardins", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nagepetits", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nagesynchros", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "palmes", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "polos", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservationads", force: :cascade do |t|
    t.date "start"
    t.string "phone"
    t.string "name"
    t.string "creneau"
    t.integer "adulte_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.integer "user_id"
    t.integer "nb_resa"
    t.index ["adulte_id"], name: "index_reservationads_on_adulte_id"
    t.index ["user_id"], name: "index_reservationads_on_user_id"
  end

  create_table "reservationboxings", force: :cascade do |t|
    t.integer "price"
    t.date "start"
    t.string "phone"
    t.string "name"
    t.string "creneau"
    t.integer "aquaboxing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aquaboxing_id"], name: "index_reservationboxings_on_aquaboxing_id"
  end

  create_table "reservationcours", force: :cascade do |t|
    t.integer "price"
    t.date "start"
    t.string "phone"
    t.string "name"
    t.string "creneau"
    t.integer "aquaparcour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aquaparcour_id"], name: "index_reservationcours_on_aquaparcour_id"
  end

  create_table "reservationecoles", force: :cascade do |t|
    t.date "start"
    t.integer "price"
    t.string "name"
    t.string "phone"
    t.string "creneau"
    t.integer "ecole_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nb_resa"
    t.integer "user_id"
    t.index ["ecole_id"], name: "index_reservationecoles_on_ecole_id"
    t.index ["user_id"], name: "index_reservationecoles_on_user_id"
  end

  create_table "reservationgyms", force: :cascade do |t|
    t.date "start"
    t.integer "price"
    t.integer "aquagym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.string "creneau"
    t.integer "user_id"
    t.integer "nb_resa"
    t.index ["aquagym_id"], name: "index_reservationgyms_on_aquagym_id"
    t.index ["user_id"], name: "index_reservationgyms_on_user_id"
  end

  create_table "reservationjards", force: :cascade do |t|
    t.date "start"
    t.string "name"
    t.string "creneau"
    t.string "phone"
    t.integer "price"
    t.integer "jardin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "nb_resa"
    t.index ["jardin_id"], name: "index_reservationjards_on_jardin_id"
    t.index ["user_id"], name: "index_reservationjards_on_user_id"
  end

  create_table "reservationpalmes", force: :cascade do |t|
    t.date "start"
    t.string "phone"
    t.integer "price"
    t.string "name"
    t.string "creneau"
    t.integer "palme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "nb_resa"
    t.index ["palme_id"], name: "index_reservationpalmes_on_palme_id"
    t.index ["user_id"], name: "index_reservationpalmes_on_user_id"
  end

  create_table "reservationpetits", force: :cascade do |t|
    t.date "start"
    t.integer "price"
    t.string "creneau"
    t.string "phone"
    t.string "name"
    t.boolean "adhesion"
    t.integer "nagepetit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "nb_resa"
    t.index ["nagepetit_id"], name: "index_reservationpetits_on_nagepetit_id"
    t.index ["user_id"], name: "index_reservationpetits_on_user_id"
  end

  create_table "reservationpolos", force: :cascade do |t|
    t.date "start"
    t.integer "price"
    t.string "name"
    t.string "phone"
    t.string "creneau"
    t.integer "polo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["polo_id"], name: "index_reservationpolos_on_polo_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "price"
    t.date "start"
    t.integer "aquabike_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.string "creneau"
    t.integer "user_id"
    t.integer "nb_resa"
    t.index ["aquabike_id"], name: "index_reservations_on_aquabike_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reservationstatics", force: :cascade do |t|
    t.date "start"
    t.string "phone"
    t.integer "price"
    t.string "name"
    t.string "creneau"
    t.integer "staticswim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staticswim_id"], name: "index_reservationstatics_on_staticswim_id"
  end

  create_table "reservationsynchros", force: :cascade do |t|
    t.date "start"
    t.string "name"
    t.string "creneau"
    t.integer "price"
    t.string "phone"
    t.integer "nagesynchro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nagesynchro_id"], name: "index_reservationsynchros_on_nagesynchro_id"
  end

  create_table "selected_resas", force: :cascade do |t|
    t.datetime "date"
    t.integer "resource_id"
    t.integer "user_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resource_type"
    t.index ["user_id"], name: "index_selected_resas_on_user_id"
  end

  create_table "staticswims", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "nbpers"
    t.integer "nbseance"
    t.string "periode"
    t.string "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
