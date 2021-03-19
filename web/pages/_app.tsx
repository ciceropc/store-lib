import ThemeContainer from '../contexts/theme/ThemeContainer'

import { Flex, Grid, Heading } from '@chakra-ui/core'
import MainMenu from '../components/menu/MainMenu'
import Footer from '../components/Footer'
import Utils from '../utils/components_utils'
// eslint-disable-next-line @typescript-eslint/explicit-module-boundary-types
export default function App({ Component, pageProps, props }): JSX.Element {
  const paddingX = '10%'
  return (
    <ThemeContainer>
      <Grid
        as="main"
        backgroundColor="white"
        fontFamily="body"
        templateColumns="1fr"
        templateRows={['650px 1fr 740px', '105px 1fr 280px']}
        templateAreas="
          'MainMenu'
          'Content'
          'Footer'
        "
      >
        <MainMenu gridArea="MainMenu" />
        <Flex gridArea="Content" flex="1" width={Utils.defaultResponsiveWidth}>
          <Heading>{props?.posts} </Heading>
          <Component {...pageProps} />
        </Flex>
        <Footer gridArea="Footer" />
      </Grid>
    </ThemeContainer>
  )
}

// eslint-disable-next-line @typescript-eslint/explicit-module-boundary-types
export const getServerSideProps = async () => {
  // eslint-disable-next-line @typescript-eslint/no-var-requires
  const client = require('contentful').createClient({
    space: process.env.CONTENTFUL_SPACE,
    accessToken: process.env.CONTENTFUL_ACCESS_TOKEN
  })
  const data = await client.getEntries({ content_type: 'post' })
  return {
    props: {
      posts: data.items
    }
  }
}
