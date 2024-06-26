const {sources} = require('coc.nvim')
const fs = require('fs')
const {promisify} = require('util')

let items

exports.activate = async context => {
  const filpeath = context.asAbsolutePath('nerdfonts.txt')

  let source = {
    name: 'nerdfonts',
    triggerOnly: true,
    doComplete: async function (opt) {
      if (!items) {
        let content = await promisify(fs.readFile)(filpeath, 'utf8')
        let lines = content.split(/\n/).slice(0, -1)
        items = lines.map(str => {
          let parts = str.split(':')
          return {description: parts[0], character: parts[1]}
        })
      }

      return {
        startcol: opt.col - 3,
        items: items.map(o => {
          return {
            word: o.character,
            abbr: `${o.character} ${o.description}`,
            menu: this.menu,
            filterText: o.description,
          }
        })
      }
    }
  }
  context.subscriptions.push(sources.createSource(source))
}
