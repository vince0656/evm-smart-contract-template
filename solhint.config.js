module.exports = {
  extends: "solhint:recommended",
  rules: {
    "compiler-version": ["error", "^0.8.0"],
    "func-visibility": ["error", { ignoreConstructors: true }],
    "not-rely-on-time": "off",
    "no-empty-blocks": "off",
    "const-name-snakecase": "off",
    "contract-name-camelcase": "off"
  }
}; 