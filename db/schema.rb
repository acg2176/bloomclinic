ActiveRecord::Schema.define(version: 2020_07_23_002204) do
    create_table "users", force: :cascade do |t|
        t.string "username"
        t.string "email"
        t.string "password_digest"

    end




end