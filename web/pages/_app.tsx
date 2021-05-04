import ThemeContainer from '../contexts/theme/ThemeContainer'

import { Flex, Grid, Heading } from '@chakra-ui/core'
import MainMenu from '../components/menu/MainMenu'
import Footer from '../components/Footer'
import Utils from '../utils/components_utils'

import * as gtag from '../lib/gtag'
import { useEffect } from 'react'
import { useRouter } from 'next/router'
import '../components/ClientImage.style.css'

// eslint-disable-next-line @typescript-eslint/explicit-module-boundary-types
export default function App({ Component, pageProps, props }): JSX.Element {
  const router = useRouter()
  useEffect(() => {
    const handleRouteChange = url => {
      gtag.pageview(url)
    }
    router.events.on('routeChangeComplete', handleRouteChange)
    return () => {
      router.events.off('routeChangeComplete', handleRouteChange)
    }
  }, [router.events])
  return (
    <ThemeContainer>
      <Grid
        position="relative"
        as="main"
        backgroundColor="white"
        fontFamily="body"
        letterSpacing="normal"
        lineHeight="normal"
        templateColumns="1fr"
        templateRows={['155px 1fr 740px', '105px 1fr 280px']}
        templateAreas="
          'MainMenu'
          'Content'
          'Footer'
        "
      >
        <MainMenu />
        <Flex
          gridArea="Content"
          flex="1"
          width={Utils.defaultResponsiveWidth}
          marginTop={['-155px', 0]}
        >
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
