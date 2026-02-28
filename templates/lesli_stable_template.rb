CORE_AND_ENGINES = %w[
    lesli
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
