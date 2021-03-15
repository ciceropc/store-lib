import { theme, DefaultTheme } from '@chakra-ui/core'
const infoAssistTheme: DefaultTheme = {
  ...theme,
  colors: {
    ...theme.colors,
    black: '#080708',
    blackAlpha: {
      ...theme.colors.blue,
      300: '#08070855',
      500: '#08070899',
      800: '#080708bb'
    },
    blue: {
      ...theme.colors.blue,
      300: '#1285e2',
      500: '#0b5694',
      800: '#062c4c'
    },
    gray: {
      50: '#f6f5f4',
      100: '#ecebe9',
      200: '#e3e1de',
      300: '#d3d0cb',
      400: '#c7c3bd',
      500: '#bdb9b2',
      600: '#8d877b',
      700: '#58534b',
      800: '#423f38',
      900: '#2C2a26'
    },
    green: {
      ...theme.colors.green,
      300: '#58C69D',
      500: '#32936f',
      800: '#32936f'
    },
    red: {
      ...theme.colors.red,
      300: '#E44E58',
      500: '#df2935',
      800: '#246A51'
    },
    yellow: {
      ...theme.colors.yellow,
      300: '#FEDE86',
      500: '#fdca40',
      800: '#DEA402'
    },
    white: '#fbfbfb'
  },
  fonts: {
    body: 'Roboto, system-ui, sans-serif',
    heading: 'Roboto, system-ui, sans-serif',
    mono: 'Roboto, system-ui, sans-serif'
  },
  fontSizes: {
    xs: '12px',
    sm: '14px',
    md: '16px',
    lg: '18px',
    xl: '20px',
    '2xl': '24px',
    '3xl': '28px',
    '4xl': '36px',
    '5xl': '48px',
    '6xl': '64px'
  },
  fontWeights: {
    ...theme.fontWeights,
    thin: 100,
    normal: 300,
    medium: 400,
    bold: 700
  },
  radii: {
    ...theme.radii,
    sm: '5px',
    md: '8px'
  }
}

export default infoAssistTheme
