# assemble-seed

Scaffold project to generate static sites using [assemble.io](http://assemble.io/), [less](http://lesscss.org/), [coffescript](http://coffeescript.org/) and [twitter bootstrap](http://getbootstrap.com/)

## Dependencies
* [git](http://git-scm.com/)
* node.js and it's npm [how to install it](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager)
* [grunt](http://gruntjs.com/)

## Setup
just run and watch the magic :)

```
npm install
```

## Development
For development purposes i've created grunt task called 'dev'. It builds application, compile less and coffee files, watch for changes in source files and run http server on localhost using port 8000

```
grunt dev
```
Now you can view your site generated by asseble on your [localhost:8000](http://localhost:8000)

Site you've created can be found in 'build/' directory.
