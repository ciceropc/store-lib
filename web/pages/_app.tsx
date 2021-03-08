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
        templateRows="100px 200px 1fr 1fr"
        templateAreas="
          'MainMenu'
          'ImageBackground'
          'Content'
          'Footer'
        "
      >
        <MainMenu gridArea="MainMenu" paddingX={paddingX} />
        <Flex
          backgroundImage="url(https://images.ctfassets.net/jt1652yryijm/33tQ5s0PajQeqgsShlGJZu/2bd705f3d06d8998e00b6be7a49f6b8b/image-1.jpg)"
          width="100%"
          height="200px"
          backgroundPosition="center"
          backgroundRepeat="no-repeat"
          backgroundSize="100%"
        ></Flex>
        <Flex gridArea="Content" flex="1" paddingX={paddingX} minH="50vh">
          <Component {...pageProps} />
        </Flex>
        <Footer gridArea="Footer" paddingX={paddingX} />
      </Grid>
    </ThemeContainer>
  )
}
