# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "slim-select" # @2.8.2
pin "dropzone" # @6.0.0
pin "just-extend" # @5.1.1
pin "@rails/activestorage", to: "@rails--activestorage.js" # @7.2.102
pin "@editorjs/editorjs", to: "@editorjs--editorjs.js" # @2.30.7
pin "@editorjs/header", to: "@editorjs--header.js" # @2.8.8
pin "@editorjs/image", to: "@editorjs--image.js" # @2.10.1
pin "@editorjs/list", to: "@editorjs--list.js" # @2.0.2
pin "@editorjs/paragraph", to: "@editorjs--paragraph.js" # @2.11.6
pin "editorjs-drag-drop" # @1.1.16
pin "@editorjs/code", to: "@editorjs--code.js" # @2.9.3
pin "@editorjs/inline-code", to: "@editorjs--inline-code.js" # @1.5.1
pin "@calumk/editorjs-codecup", to: "@calumk--editorjs-codecup.js" # @1.2.0
pin "@editorjs/marker", to: "@editorjs--marker.js" # @1.4.0
pin "editorjs-undo" # @2.0.28
pin "editorjs-text-color-plugin" # @2.0.4
