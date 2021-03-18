// eslint-disable-next-line no-use-before-define
import React from 'react'
import { ChakraProvider } from '@chakra-ui/react'

import { ThemeProvider as EmotionThemeProvider } from 'emotion-theming'
import theme from '../../styles/theme'

const ThemeContainer: React.FC = ({ children }) => {
  return (
    <ChakraProvider resetCSS theme={theme}>
      <EmotionThemeProvider theme={theme}>{children}</EmotionThemeProvider>
    </ChakraProvider>
  )
}

export default ThemeContainer
