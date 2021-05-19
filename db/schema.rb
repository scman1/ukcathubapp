# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_19_124355) do

  create_table "addresses", force: :cascade do |t|
    t.string "add_01"
    t.string "add_02"
    t.string "add_03"
    t.string "add_04"
    t.string "country"
    t.integer "affiliation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "affiliation_links", force: :cascade do |t|
    t.integer "affiliation_id"
    t.string "doi"
    t.integer "author_id"
    t.string "sequence"
    t.integer "address_id"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "affiliations", force: :cascade do |t|
    t.string "institution"
    t.string "department"
    t.string "faculty"
    t.string "work_group"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "article_authors", force: :cascade do |t|
    t.string "doi"
    t.integer "author_id"
    t.string "author_count"
    t.integer "author_order"
    t.string "status"
    t.string "author_seq"
    t.integer "article_id"
    t.string "orcid"
    t.string "last_name"
    t.string "given_name"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
  end

  create_table "article_datasets", force: :cascade do |t|
    t.string "doi"
    t.integer "article_id"
    t.integer "dataset_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "article_themes", force: :cascade do |t|
    t.string "doi"
    t.integer "phase"
    t.string "collaboration"
    t.integer "theme_id"
    t.integer "article_id"
    t.integer "project_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "doi"
    t.string "title"
    t.integer "pub_year"
    t.string "pub_type"
    t.string "publisher"
    t.string "container_title"
    t.string "volume"
    t.string "issue"
    t.string "page"
    t.integer "pub_print_year"
    t.integer "pub_print_month"
    t.integer "pub_print_day"
    t.integer "pub_ol_year"
    t.integer "pub_ol_month"
    t.integer "pub_ol_day"
    t.string "license"
    t.integer "referenced_by_count"
    t.string "link"
    t.string "url"
    t.string "abstract"
    t.string "status"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "references_count"
    t.string "journal_issue"
  end

  create_table "author_affiliations", force: :cascade do |t|
    t.integer "article_author_id"
    t.string "name"
    t.string "short_name"
    t.string "add_01"
    t.string "add_02"
    t.string "add_03"
    t.string "add_04"
    t.string "add_05"
    t.string "country"
    t.integer "affiliation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "full_name"
    t.string "last_name"
    t.string "given_name"
    t.string "orcid"
    t.integer "articles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "isap"
  end

  create_table "cr_affiliations", force: :cascade do |t|
    t.string "name"
    t.integer "article_author_id"
    t.integer "author_affiliation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "datasets", force: :cascade do |t|
    t.string "dataset_complete"
    t.string "dataset_description"
    t.string "dataset_doi"
    t.datetime "dataset_enddate"
    t.string "dataset_location"
    t.string "dataset_name"
    t.datetime "dataset_startdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ds_type"
    t.string "repository"
  end

  create_table "themes", force: :cascade do |t|
    t.string "short"
    t.string "name"
    t.string "lead"
    t.integer "phase"
    t.string "used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end


  create_view "list_themes", sql_definition: <<-SQL
      SELECT themes.id, themes.phase, themes.name, themes.short, themes.lead, count() AS article_count
    FROM article_themes
    INNER JOIN themes on article_themes.theme_id = themes.id
    INNER JOIN articles on article_themes.article_id = articles.id
    WHERE articles.status == 'Added'
    GROUP BY themes.phase, themes.name
    ORDER BY themes.id
  SQL
  create_view "authors_by_pub", sql_definition: <<-SQL
    		SELECT group_concat(art_authors, ", ") AS author_list, article_id as article_id
		FROM (SELECT article_authors.last_name || ", " || article_authors.given_name as art_authors, article_authors.article_id
				FROM article_authors ORDER BY article_authors.article_id, article_authors.author_order) GROUP BY article_id
  SQL
  create_view "article_base", sql_definition: <<-SQL
      SELECT CASE WHEN Articles.pub_ol_year = "" THEN Articles.pub_print_year ELSE Articles.pub_ol_year END as Published, Articles.title, Articles.container_title as Journal, Articles.volume, Articles.issue, Articles.page, Articles.DOI, articles.id FROM Articles WHERE Articles.status <> "Remove"
  SQL
  create_view "bib_list", sql_definition: <<-SQL
      SELECT authors_by_pub.author_list, article_base.* FROM authors_by_pub inner join article_base on authors_by_pub.article_id = article_base.id
  SQL
  create_view "pub_theme_groups", sql_definition: <<-SQL
    		CREATE VIEW pub_theme_groups as 
		SELECT article_id, max (phase_1) as phase_1, max (phase_2) as phase_2, sum(t01) as design,
			  sum(t02) as environment,
			  sum(t03) as transformations,
			  sum(t04) as energy,
			  sum(t05) as biocatalysis,
			  sum(t06) as collaboration,
			  sum(t07) as new_catalysts,
			  sum(t08) as water_energy,
			  sum(t09) as economy_manufacturing,
			  sum(t10) as core,
			  sum(t11) as XAFS_BAG,
			  sum(t14) as Featured,
			  sum(t15) as PhD_Thesis
		 from ( 
			SELECT article_id, 
			  case when themes.phase = 1 then TRUE end as phase_1,
			  case when themes.phase = 2 then TRUE end as phase_2,
			  case when themes.id = 1 then 1 end as t01,
			  case when themes.id = 2 then 1 end as t02,
			  case when themes.id = 3 then 1 end as t03,
			  case when themes.id = 4 then 1 end as t04,
			  case when themes.id = 5 then 1 end as t05,
			  case when themes.id = 6 then 1 end as t06,
			  case when themes.id = 7 then 1 end as t07,
			  case when themes.id = 8 then 1 end as t08,
			  case when themes.id = 9 then 1 end as t09,
			  case when themes.id = 10 then 1 end as t10,
			  case when themes.id = 11 then 1 end as t11,
			  case when themes.id = 14 then 1 end as t14,
			  case when themes.id = 15 then 1 end as t15
			  FROM article_themes
			  INNER JOIN themes on article_themes.theme_id = themes.id
			  INNER JOIN articles on article_themes.article_id = articles.id
			  WHERE articles.status == 'Added'
			  ORDER BY article_id)
			  GROUP BY article_id
  SQL
  create_view "inst_ctry_stats", sql_definition: <<-SQL
      SELECT country, COUNT() AS insts, SUM(collaborations) AS collab from(
  SELECT affiliations.institution, affiliations.country , COUNT(*) AS collaborations
    FROM "authors" 
    INNER JOIN "affiliation_links" ON "affiliation_links"."author_id" = "authors"."id" 
    INNER JOIN "affiliations" ON "affiliations"."id" = "affiliation_links"."affiliation_id" 
    GROUP BY "country", affiliations.institution
  )
  GROUP BY country
  SQL
end
