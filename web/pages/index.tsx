// eslint-disable-next-line no-use-before-define
import React from 'react'
import Head from 'next/head'
import Link from 'next/link'
import styles from '../styles/Home.module.css'

const Home: React.FC = () => {
  return (
    <div className={styles.container}>
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
      </Head>

      <main className={styles.main}>
        <h1 className={styles.title}>
          Bem-vindo a{' '}
          <Link href="/">
            <a>InfoAssist!</a>
          </Link>
        </h1>

        <p className={styles.description}>
          No momento você está acessando
          <code className={styles.code}>site_em_construção.html</code>
          <br />
          Estamos trabalhando para melhor atende-lo
        </p>

        <div className={styles.grid}>
          <a
            href="https://infoassist.com.br/Infoassist%20-%20Suporte%20Remoto.zip"
            className={styles.card}
          >
            <h3>Suporte Remoto </h3>
            <p>Instale nosso programa de acesso remoto</p>
          </a>

          <Link href="/store">
            <a className={styles.card}>
              <h3>Loja</h3>
              <p>
                Acesse a nossa loja e confira as melhores opções para você e sua
                empresa!
              </p>
            </a>
          </Link>

          <Link href="/blog">
            <a className={styles.card}>
              <h3>Blog </h3>
              <p>
                Aprenda mais sobre tecnologia e como ela pode beneficiar seu
                negócio
              </p>
            </a>
          </Link>

          <Link href="/about">
            <a className={styles.card}>
              <h3>Quem somos nós? </h3>
              <p>Leia um pouco sobre a nossa história</p>
            </a>
          </Link>
        </div>
      </main>

      <footer className={styles.footer}>
        <a
          href="https://www.google.com/search?ei=BoowYKPTOZHE5OUP_LqXmAU&q=programmatore+translation&oq=programmatori+transl&gs_lcp=Cgdnd3Mtd2l6EAMYADIGCAAQFhAeMgYIABAWEB46BwgAELADEEM6CQgAELADEAcQHjoECAAQEzoICAAQDRAeEBM6CAgAEBYQHhATOgoIABAWEAoQHhATOggIABANEAUQHjoICAAQCBANEB5Q1zhYvVtg7XZoBXAAeACAAaQBiAHCCZIBAzAuOZgBAKABAaoBB2d3cy13aXrIAQrAAQE&sclient=gws-wiz"
          target="_blank"
          rel="noopener noreferrer"
        >
          &reg; Programmatori 2021
        </a>
      </footer>
    </div>
  )
}

export default Home
