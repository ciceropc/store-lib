import Head from "next/head";
import { version } from "../package.json";
import { AppProps } from 'next/app'

import '../styles/globals.css'

const App = ({ Component, pageProps }) => ( 
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
    <Component { ...pageProps }/> 
  </>
);


export default App;
