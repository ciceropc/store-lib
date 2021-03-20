import Head from 'next/head'

import * as gtag from '../lib/gtag'
import { useEffect } from 'react'
import { useRouter } from 'next/router'

import '../styles/globals.css'
import styles from '../styles/Home.module.css'

const App = ({ Component, pageProps }) => {
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
    <>
      <Head>
        <title>InfoAssist</title>
        <link rel="icon" href="/favicon.ico" />
        <meta
          name="author"
          content="Cícero Pereira Costa, Fernado Donini Ramos"
        />
        <meta
          name="description"
          content="Suporte Técnico em Informática em Porto Alegre"
        />
        <meta
          name="keywords"
          content="suporte, TI, assistência, tecnologia, informática, técnico, conserto, computador, redes, Porto Alegre"
        />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charSet="utf-8" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <Component {...pageProps} />

      <footer className={styles.footer}>
        <a>&reg; InfoTech 2021</a>
      </footer>
    </>
  )
}

export default App
