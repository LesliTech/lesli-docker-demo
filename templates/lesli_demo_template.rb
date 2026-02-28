# lesli_demo_template.rb
# Usage:
#   rails new LesliDemo -m lesli_demo_template.rb --skip-bundle

empty_directory "engines/Lesli"
run %(git clone --depth 1 --branch master git@github.com:LesliTech/Lesli.git engines/Lesli)
gem "lesli", path: "engines/Lesli"

empty_directory "engines/LesliDate"
run %(git clone --depth 1 --branch master git@github.com:LesliTech/LesliDate.git engines/LesliDate)
gem "lesli_date", path: "engines/LesliDate"


# --- Gems (RubyGems names) ---
# RubyGems shows Lesli gems are published under these names (lowercase / underscores). :contentReference[oaicite:4]{index=4}
CORE_AND_ENGINES = %w[
    lesli_bell
    lesli_admin
    lesli_babel
    lesli_audit
    lesli_shield
    lesli_support
    lesli_calendar
    lesli_dashboard
].freeze


# Lesli + engines + support gems
(CORE_AND_ENGINES).each do |g|
    gem g
end

# Required to load rails for development (matches your Docker demo intent)
gem_group :development do
    gem "debug"
end

# Optional: a simple welcome root (docs show a Lesli welcome controller example) :contentReference[oaicite:6]{index=6}
# inject_into_file "config/routes.rb", after: "Rails.application.routes.draw do\n" do
#   %(  root to: "lesli/abouts#welcome", as: :welcome\n)
# end

# Clean lockfile (helps when template changes Gemfile)
remove_file "Gemfile.lock" if File.exist?("Gemfile.lock")

say_status :bundle, "Installing gems", :blue
run "bundle install"

# Run Lesli installer (docs)
say_status :lesli, "Running rails generate lesli:install", :blue
run "bundle exec rails generate lesli:install"

# Reset DB + seed demo data (docs)
say_status :lesli, "Running rake lesli:db:reset", :blue
run "bundle exec rake lesli:db:reset"

# Status summary (docs)
say_status :lesli, "Running rake lesli:status", :blue
run "bundle exec rake lesli:status"

say_status :done, "Lesli demo app ready ✅", :green
