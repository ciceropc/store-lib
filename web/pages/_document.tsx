import { GA_TRACKING_ID } from '../lib/gtag'

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
            content="suporte, TI, assistência, tecnologia, informática, técnico, conserto, computador, redes, Porto Alegre, Canoas, gestão, gerenciamento, "
          />
          <meta
            name="description"
            content="Suporte Técnico em Informática em Porto Alegre"
          />
          <meta
            name="author"
            content="Cícero Pereira Costa, Fernado Donini Ramos, Francisco Donini Ramos, Vinicius Barros"
          />
          <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,700;1,100;1,300;1,400;1,700&display=swap"
            rel="stylesheet"
          />
          <link rel="icon" href="/favicon.ico" />
          {/* Global Site Tag (gtag.js) - Google Analytics */}
          <script
            async
            src={`https://www.googletagmanager.com/gtag/js?id=${GA_TRACKING_ID}`}
          />
          <script
            dangerouslySetInnerHTML={{
              __html: ` window.dataLayer = window.dataLayer || [];
                        function gtag(){dataLayer.push(arguments);}
                        gtag('js', new Date());
                        gtag('config', '${GA_TRACKING_ID}', {
                          page_path: window.location.pathname,
                        });
                      `
            }}
          />
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
