module.exports = (grunt) ->
    # Project configuration.
    grunt.initConfig
        pkg: grunt.file.readJSON("package.json")
        sync:
            main:
                files: [
                    cwd: "src/static"
                    src: [
                        "img/**"
                    ]
                    dest: "build/static"
                ]
                verbose: true # Display log messages when copying files

        assemble:
            options:
                flatten: true
                partials: ["src/templates/partials/*.hbs"]
                layoutdir: "src/templates/layouts"
                layout: "default.hbs"

            site:
                files:
                    "build/": ["src/templates/pages/*.hbs"]

        coffee:
            default:
                expand: true
                cwd: "src/static/coffee/"
                src: ["**/*.coffee"]
                dest: "build/static/js/"
                ext: ".js"

        less:
            style:
                files:
                    "build/static/css/app.css": "src/static/less/app.less"

        watch:
            hbs:
                files: ["src/**/*.hbs"]
                tasks: "assemble"
            less:
                files: ["src/static/less/*.less"]
                tasks: "less"
            coffee:
                files: ["src/static/coffee/*.coffee"]
                tasks: "coffee"

    grunt.loadNpmTasks "assemble"
    grunt.loadNpmTasks "grunt-sync"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-less"
    grunt.loadNpmTasks "grunt-contrib-watch"

    grunt.registerTask "default", [
        "build"
    ]

    grunt.registerTask "build", [
        "less"
        "coffee"
        "sync"
        "assemble"
    ]

    grunt.registerTask "dev", [
        "build"
        "watch"
    ]
