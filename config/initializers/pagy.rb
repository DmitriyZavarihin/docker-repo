# Optionally override some pagy default with your own in the pagy initializer
require 'pagy/extras/bulma'
Pagy::DEFAULT[:items] = 1        # items per page
Pagy::DEFAULT[:size]  = [1,4,4,1] # nav bar links