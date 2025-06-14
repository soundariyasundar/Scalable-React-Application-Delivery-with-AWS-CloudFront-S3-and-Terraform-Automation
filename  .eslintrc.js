module.exports = {
  extends: ['react-app', 'eslint:recommended'],
  env: {
    browser: true,
    node: true,
    es6: true,
    jest: true
  },
  rules: {
    "semi": ["error", "always"],
    "quotes": ["error", "double"]
  }
};

