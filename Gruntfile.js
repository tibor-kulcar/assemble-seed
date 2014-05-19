module.exports = function(grunt) {
    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        sync: {
            main: {
                files: [
                    {
                        cwd: 'src',
                        src: [
                            'img/**',
                            'css/**',
                            'js/**',
                            'assets/**',
                            'fonts/**'
                        ],
                        dest: 'build',
                    }
                ],
                verbose: true // Display log messages when copying files
            }
        },


        assemble: {
            options: {
                flatten: true,
                partials: ['src/partials/*.hbs'],
                layoutdir: 'src/layouts',
                layout: 'default.hbs'
            },
            site: {
                files: {'build/': ['src/pages/*.hbs']}
            }
        },

        watch: {
            hbs: {
                files: ['src/**/*.hbs'],
                tasks: 'assemble'                
            },
            css: {
                files: ['src/css/*.css'],
                tasks: 'sync'                
            }
        },

    });
    grunt.loadNpmTasks('assemble');
    grunt.loadNpmTasks('grunt-sync');
    grunt.loadNpmTasks("grunt-contrib-watch")    
    grunt.registerTask('default', ['sync', 'assemble']);
    grunt.registerTask('dev', ['sync', 'assemble', 'watch']);

};
