import ThemeContainer from '../contexts/theme/ThemeContainer'

import { Flex, Grid, List, ListItem } from '@chakra-ui/core'
import MainMenu from '../components/menu/MainMenu'

export default function App({ Component, pageProps }) {
  return (
    <ThemeContainer>
      <Grid
        as="main"
        backgroundColor="white"
        fontFamily="body"
        templateColumns="1fr"
        templateRows="100px 200px 1fr 250px"
        templateAreas="
            'MainMenu'
            'ImageBackground'
            'Content'
            'Footer'
          "
      >
        <MainMenu gridArea="MainMenu" paddingX="10%" />
        <Flex
          backgroundImage="url(https://images.ctfassets.net/jt1652yryijm/33tQ5s0PajQeqgsShlGJZu/2bd705f3d06d8998e00b6be7a49f6b8b/image-1.jpg)"
          width="100%"
          height="200px"
          backgroundPosition="center"
          backgroundRepeat="no-repeat"
          backgroundSize="100%"
        ></Flex>
        <Flex gridArea="Content" flex="1" paddingX="10%" minH="50vh">
          <Component {...pageProps} />
        </Flex>
        <Flex
          backgroundColor="gray.900"
          flex="1"
          fontSize="sm"
          gridArea="Footer"
          paddingX="10%"
          paddingY="8"
          color="gray.100"
        >
          <List spacing={2}>
            <ListItem>Consectetur adipiscing elit</ListItem>
            <ListItem>Consectetur adipiscing elit</ListItem>
            <ListItem>Integer molestie lorem at massa</ListItem>
            <ListItem>Facilisis in pretium nisl aliquet</ListItem>
          </List>
          <Flex flex="1"></Flex>
        </Flex>
      </Grid>
    </ThemeContainer>
  )
}
