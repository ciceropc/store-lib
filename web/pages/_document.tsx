import Document, {
  DocumentProps,
  Html,
  Head,
  Main,
  NextScript
} from 'next/document'

class MyDocument extends Document<DocumentProps> {
  render(): JSX.Element {
    return (
      <Html>
        <Head>
          <title>InfoAssist</title>
          <meta
            name="keywords"
            content="suporte, TI, assistência, tecnologia, informática, técnico, conserto, computador, redes, Porto Alegre"
          />
          <meta
            name="description"
            content="Suporte Técnico em Informática em Porto Alegre"
          />
          <meta
            name="author"
            content="Cícero Pereira Costa, Fernado Donini Ramos"
          />
          <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,700;1,100;1,300;1,400;1,700&display=swap"
            rel="stylesheet"
          />
          <link rel="icon" href="/favicon.ico" />
        </Head>
        <body>
          <Main />
          <NextScript />
        </body>
      </Html>
    )
  }
}

export default MyDocument
