# angular-tv4

Found it frustrating how badly documented actual usage of json schema is across the web. Felt that an interactive
tool that would give instant results if your validation passes could be of use; so here we are!

Also a good template to use for heroku multiple buildpacks. Using bower to manage client dependencies, so require
a node runtime. By using the multipack configuration with both the ruby and node runtime, coupled with a prepublish
hook inside `package.json` that invokes bower, you can compile bower deps into the heroku slug.
