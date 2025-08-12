# Pin npm packages by running ./bin/importmap

pin "application", preload: true  # This pins the application.js file
pin "timer-apply", to: "timer.js"      # Pinning the timer.js file
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
