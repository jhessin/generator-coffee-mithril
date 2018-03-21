# A Mithril project with CoffeeScript, ES6, and Stylus

Compatible with Mithril 1.x

Starter app generated with [generator-coffee-mithril](https://github.com/jhessin/generator-coffee-mithril).

## Setup

I prefer yarn and it's more terse syntax to npm but you could easily run all of these with only npm.

`yarn` = `npm install`

`yarn [scriptName]` = `npm run [scriptName]`

Init:

```bash
yarn
```

Start development server (port 3000):

```bash
yarn start
```

Start (and open) development server:

```bash
yarn start:open
```

Build/Clean/Rebuild:

```bash
yarn clean
yarn build
yarn rebuild
```

And for production simply add :prod

```bash
yarn build:prod
yarn rebuild:prod
```

If the dev server doesn't load there may be a server running already. To kill any active node server you can run (on *nix systems - not sure about windows):

```bash
yarn killall
```
