README
------

A cli tool to list package.json dependencies in <package>@<version> form


Example
-------

  $ package-deps-cli
  yargs@^3.23.0

  $ package-deps-cli --dev
  yargs@^3.23.0
  coffee-script@^1.9.3


Why
---

I deploy my node.js based application using docker. This tool allows me to install
dependencies globally which would not be possible using npm. The result looks 
like this

    RUN npm install -g package-deps
    ADD ./package.json /app/package.json
    RUN cd /app; npm install -g $(package-deps-cli); npm link $(package-deps-cli)
    ADD ./ /app
    RUN cd /app; npm install

The benefit is that when you change your app/ source code (but not package.json)
docker will repeat the steps starting from "ADD ./ /app" but it will be very fast
as it will just link global packages.


Notes
-----

- Something similar can be achieved using 'npm-cache', but it's slower
- npm will never install dependencies globally afaik (see <https://github.com/npm/npm/issues/2949#issuecomment-11408461>)
