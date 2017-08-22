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

ActiveRecord::Schema.define(version: 20170815203221) do

  create_table "organizations", force: :cascade do |t|
    t.string "login"
    t.string "url"
    t.string "repos_url"
    t.string "description"
    t.integer "public_repos"
    t.string "html_url"
    t.datetime "github_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pull_requests", force: :cascade do |t|
    t.string "github_id"
    t.integer "repo_id"
    t.integer "user_id"
    t.string "html_url"
    t.string "url"
    t.integer "number"
    t.string "state"
    t.string "title"
    t.datetime "github_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repos", force: :cascade do |t|
    t.string "github_id"
    t.integer "organization_id"
    t.string "name"
    t.string "html_url"
    t.string "description"
    t.string "url"
    t.string "commits_url"
    t.string "pulls_url"
    t.integer "open_issues_count"
    t.datetime "github_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "github_id"
    t.string "login"
    t.string "url"
    t.string "html_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
