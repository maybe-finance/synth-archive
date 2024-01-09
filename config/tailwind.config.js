const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        black: '#1a1a1a',
        'vista': {
          '25': '#f9f9f9',
          '50': '#f7f4f2',
          '100': '#efe9e5',
          '200': '#ded2ca',
          '300': '#c9b4a8',
          '400': '#b29285',
          '500': '#a37a6c',
          '600': '#956b61',
          '700': '#7d5751',
          '800': '#664946',
          '900': '#543d3a',
          '950': '#2c1f1e',
        },
        'vermilion': {
          '50': '#fff6ec',
          '100': '#ffead3',
          '200': '#ffd2a6',
          '300': '#ffb26e',
          '400': '#ff8533',
          '500': '#ff630c',
          '600': '#f44702',
          '700': '#ca3304',
          '800': '#a0290c',
          '900': '#81240d',
          '950': '#460e04',
        },
        'woodsmoke': {
          '50': '#f6f6f6',
          '100': '#e7e7e7',
          '200': '#d1d1d1',
          '300': '#b0b0b0',
          '400': '#888888',
          '500': '#6d6d6d',
          '600': '#5d5d5d',
          '700': '#4f4f4f',
          '800': '#454545',
          '900': '#3d3d3d',
          '950': '#1a1a1a',
        },
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
