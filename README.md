# assemble-seed

Scaffold project to generate static sites using [assemble.io](http://assemble.io/), [less](http://lesscss.org/), [coffescript](http://coffeescript.org/) and [twitter bootstrap](http://getbootstrap.com/)

## Dependencies
* [git](http://git-scm.com/)
* node.js and it's npm [how to install it](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager)
* [grunt](http://gruntjs.com/)

## Setup
just run 

```
npm install
```

and watch the magic :)


## Development
For development purposes i've created grunt task called 'dev'. It builds application, compile less and coffee files, watch for changes in source files and run http server on localhost using port 3000

So type in
```
grunt dev
```

Now you can view your site generated by asseble on your [localhost:3000](http://localhost:3000) and should look exactly like [demo site](http://tibor-kulcar.github.io/assemble-seed/)


Site you've created can be found in 'build/' directory.

## Deployment
There are two grunt tasks to deploy your site to production server. Most likely you have ftp access to your hosting. In that case use
```
grunt ftp_deploy
```
If you have shell access you can use rsync which is more secure and comfortable:
```
grunt rsync_deploy
```
