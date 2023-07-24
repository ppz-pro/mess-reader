module.exports = """
new EventSource('/esbuild').addEventListener('change', () => location.reload());
"""

# css 的 reload 有问题，暂时不加 https://esbuild.github.io/api/#hot-reloading-css
