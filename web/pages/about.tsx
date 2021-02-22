// eslint-disable-next-line no-use-before-define
import React from 'react'
import Head from 'next/head'
import Link from 'next/link'
import styles from '../styles/Home.module.css'

const About: React.FC = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>InfoAssist - Quem somos nós?</title>
      </Head>

      <main className={styles.main}>
        <h1 className={styles.title}>
          Quem somos{' '}
          <Link href="/">
            <a>nós</a>
          </Link>
          ?
        </h1>

        <p className={styles.description}>Somos uma empresa...</p>

        <div className={styles.grid}>
          <a
            href="https://infoassist.com.br/Infoassist%20-%20Suporte%20Remoto.zip"
            className={styles.card}
          >
            <h3>Suporte Remoto </h3>
            <p>Instale nosso programa de acesso remoto</p>
          </a>
          <Link href="/">
            <a className={styles.card}>
              <h3>Home </h3>
              <p>Voltar para nossa home</p>
            </a>
          </Link>
        </div>
      </main>
    </div>
  )
}

export default About
