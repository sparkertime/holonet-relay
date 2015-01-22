# HolonetRelay

A simple little app to create a read-only make-believe USENET-like mail reader in the world of Star Wars circa 3 ABY. Intended for use by over-obsessive Star Wars RPG GMs like myself.

## Running

To start:

1. Install dependencies with `mix deps.get`
2. Start Phoenix router with `mix phoenix.start`

Now you can visit `localhost:4000` from your browser.

## Deploying to Heroku

```
> heroku app:create YOURNAMEHERE
> heroku stack:set cedar #phoenix is not yet Cedar-14 compatible
> heroku config:add MIX_ENV=prod BUILDPACK_URL=https://github.com/HashNuke/heroku-buildpack-elixir.git#cedar-14-unzip-fix
> git push heroku master
```

## Adding new messages

The mail reader divides messages as follows:
* The mail reader has two top-level folders: the Inbox (located at `PROJECT_ROOT/inbox`) and the Archive (located at `PROJECT_ROOT/archive`)
* Within a folder, messages are divided into **groups** which are subdirectories within the folder. So for instance, if you wanted the Relay to receive a message in the `rec.arts.twilek-dancing` group in the Inbox, you'd create a folder `inbox/rec.arts.twilek-dancing/`
* Individual messages are just Markdown folders within a group folder. There will eventually be a somewhat special syntax for them, but for now the only requirement is that the message has `subject: SOME TEXT HERE` somewhere within it. So to create a message called "Mon Calamari Dancing is WHERE IT IS AT" in the aforementioned group, make a markdown file at `inbox/rec.arts.twilek-dancing/mon-calamari-dancing.md` that contains somewhere within the file the line `subject: Mon Calamari Dancing is WHERE IT IS AT`

## Dates

All dates are in accordance with the [Great Resychronization](http://starwars.wikia.com/wiki/Great_ReSynchronization).

## License

All work within this repo is released under a [Creative Commons Attribution-NonCommercial 3.0 United States](https://creativecommons.org/licenses/by-nc/3.0/us/) license. Essentially you are welcome to do what you like with this as long as you provide attribution and don't charge for it.

Star Wars, Edge of the Empire, and all associated works remain the copyright of their respective copyright holders.
