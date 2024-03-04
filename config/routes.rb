Rails.application.routes.draw do
    mount Lesli::Engine => "/lesli"
    mount LesliDriver::Engine => "/driver" if defined?(LesliDriver)
    mount LesliAdmin::Engine => "/admin" if defined?(LesliAdmin)
    mount LesliAudit::Engine => "/audit" if defined?(LesliAudit)
    mount LesliGuard::Engine => "/guard" if defined?(LesliGuard)
    mount LesliBabel::Engine => "/babel" if defined?(LesliBabel)
    mount LesliBell::Engine => "/bell" if defined?(LesliBell)
    mount LesliDashboard::Engine => "/dashboard" if defined?(LesliDashboard)
end