module.exports = (grunt) ->
    # Project configuration.
    grunt.initConfig
        pkg: grunt.file.readJSON('package.json')
        sync:
            main:
                files: [
                    cwd: 'src/assets'
                    src: [
                            'img/**',
                            'fonts/**'
                        ]
                    dest: 'build/assets'
                ]
                verbose: true

        less:
            style:
                files:
                    'build/assets/css/app.css': 'src/assets/less/app.less'
        
        coffee:
            compile:
                files:
                    'build/assets/js/app.js': 'src/assets/coffee/app.coffee'

        assemble:
            options:
                flatten: true
                partials: ['src/templates/partials/*.hbs']
                layoutdir: 'src/templates/layouts'
                layout: 'default.hbs'
                assets: 'assets'
                data: ['src/i18n/**/*.yml']

            site:
                files: [
                    {
                        expand: true, 
                        cwd: 'src/templates/pages/', 
                        src: '**/*.hbs', 
                        dest: 'build/', 
                        ext: '.html'
                    }
                ]

        watch:
            hbs:
                files: ['src/**/*.hbs']
                tasks: 'assemble'
            less:
                files: ['src/assets/less/*.less']
                tasks: 'less'
            coffee:
                files: ['src/assets/coffee/*.coffee']
                tasks: 'coffee'
            data:
                files: ['src/i18n/*.*']
                tasks: 'assemble'

        connect:
            server:
              options:
                port: 3000
                base: 'build'
      
    grunt.loadNpmTasks 'assemble'
    grunt.loadNpmTasks 'grunt-sync'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-connect'

    grunt.registerTask 'default', [
        'build'
    ]

    grunt.registerTask 'build', [
        'less'
        'coffee'
        'sync'
        'assemble'
    ]

    grunt.registerTask 'dev', [
        'build'
        'connect'
        'watch'
    ]
