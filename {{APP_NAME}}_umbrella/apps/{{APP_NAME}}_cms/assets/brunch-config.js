exports.config = {
  // See http://brunch.io/#documentation for docs.

  // Disable notifications so brunch will not crash in docker
  watcher: {
    usePolling: true
  },
  notifications: false,

  files: {
    javascripts: {
      joinTo: {
        "js/app.js": /^(vendor\/js)|(js)/
      },

      // To use a separate vendor.js bundle, specify two files path
      // http://brunch.io/docs/config#-files-
      // joinTo: {
      //   "js/app.js": /^js/,
      //   "js/vendor.js": /^(?!js)/
      // }
      //
      // To change the order of concatenation of files, explicitly mention here
      // order: {
      //   before: [
      //     "vendor/js/jquery-2.1.1.js",
      //     "vendor/js/bootstrap.min.js"
      //   ]
      // }
      order: {
        before: [
          "vendor/js/font-awesome/fa-brands.js",
          "vendor/js/font-awesome/fa-regular.js",
          "vendor/js/font-awesome/fa-solid.js",
          "vendor/js/font-awesome/fa-v4-shims.js",
          "vendor/js/font-awesome/fontawesome-all.js",
          "vendor/js/font-awesome/fontawesome.js",
          "vendor/js/jquery-3.3.1.js",
          "vendor/js/bootstrap.min.js"
        ]
      }
    },
    stylesheets: {
      joinTo: {
            "css/app.css": /^(css)/,
            "css/vendor.css": /^(vendor)/
        },
        order: {
            before: [
                "vendor/css/bootstrap.min.css",
                "vendor/css/font-awesome/fa-svg-with-js.css",
                "css/style.css",
            ],
            after: [
                "css/app.css",
            ]
        }
    },

    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/assets/static". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(static)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js", "vendor"],
    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    },
    postcss: {
      processors: [
        require('autoprefixer')(['last 8 versions']),
        require('csswring')()
      ]
    },
    uglify: {
      mangle: false,
      compress: {
        global_defs: {
          DEBUG: false
        }
      }
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    }
  },

  npm: {
    enabled: true
  }
};
