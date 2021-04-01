// eslint-disable-next-line no-use-before-define
import React from 'react'
import {
  ThemeProvider as ChakraThemeProvider,
  CSSReset,
  ColorModeProvider
} from '@chakra-ui/core'
import { ThemeProvider as EmotionThemeProvider } from 'emotion-theming'
import theme from '../../styles/theme'

const ThemeContainer: React.FC = ({ children }) => {
  return (
    <ChakraThemeProvider theme={theme}>
      <ColorModeProvider value="light">
        <EmotionThemeProvider theme={theme}>
          <CSSReset />
          {children}
        </EmotionThemeProvider>
      </ColorModeProvider>
    </ChakraThemeProvider>
  )
}

export default ThemeContainer
