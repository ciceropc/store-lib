import ThemeContainer from '../contexts/theme/ThemeContainer'

import { Flex, Grid } from '@chakra-ui/core'
import MainMenu from '../components/menu/MainMenu'
import Footer from '../components/Footer'

export default function App({ Component, pageProps }) {
  const paddingX = '10%'
  return (
    <ThemeContainer>
      <Grid
        as="main"
        backgroundColor="white"
        fontFamily="body"
        templateColumns="1fr"
        templateRows="100px 1fr 650px"
        templateAreas="
          'MainMenu'
          'Content'
          'Footer'
        "
      >
        <MainMenu gridArea="MainMenu" paddingX={paddingX} />
        <Flex gridArea="Content">
          <Component {...pageProps} />
        </Flex>
        <Footer gridArea="Footer" paddingX={paddingX} />
      </Grid>
    </ThemeContainer>
  )
}
