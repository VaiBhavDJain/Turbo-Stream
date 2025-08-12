# Pin npm packages by running ./bin/importmap

pin "application", preload: true  # This pins the application.js file
pin "timer-apply", to: "timer.js"      # Pinning the timer.js file