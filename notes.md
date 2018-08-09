# Notes for az webapp up

- finding the `az add extension` for webapp up was difficult
  -  list of possible extensions i could install and how

https://blogs.msdn.microsoft.com/appserviceteam/2018/03/22/renaming-our-new-command-to-up/

- Can we show a clearer message for errors? (e.g. conflict of names)
- Can we show suggestions?

- Can we remove the `-n` for the name, and look in package.json?
  - for node.js and .net this works, but for some others it is a challenge? so are we ok with the experience being different?
  - we have a `-n` for now til we can find a way to make it more configurable (still will not be help with 1st experience)
  - can we use a "giphy name" genreator when we have conflicts?

- It took about 2 minutes to deploy with `az webapp up`, can we help get this down to less than 30s ?
   - progress of some kind (let the user know its trying)
   - emojis
   - colors
   - ascii art

- Success output
  - can we report "success"?
  - Show the link at the end (not in json)
  - Success! Click here to see your app  ...
    - show the link/url (with whitespace and very prominently)
    - show a link to see how to do verbose or portal

- Ahmed will share with the core team to get their feedback
  - concerns over having multiple versions of az webapp up
  - can they experiment in core az cli? or stay in extensions?
  - 
