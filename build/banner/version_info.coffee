package_info = require '../../package.json'

module.exports = """
console.log(`compiled at: #{new Date()}
version: #{package_info.version}
author: #{package_info.author}
`);
"""
