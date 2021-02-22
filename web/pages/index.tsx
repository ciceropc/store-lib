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
          Estamos trabalhando para melhor atendê-lo
        </p>

        <div className={styles.grid}>
          <a
            href="https://infoassist.com.br/Infoassist%20-%20Suporte%20Remoto.zip"
            className={styles.card}
          >
            <h3>Suporte Remoto </h3>
            <p>Instale nosso programa de acesso remoto</p>
          </a>

          <Link href="/about">
            <a className={styles.card}>
              <h3>Quem somos nós? </h3>
              <p>Leia um pouco sobre a nossa história</p>
            </a>
          </Link>
        </div>
      </main>
    </div>
  )
}

export default Home
