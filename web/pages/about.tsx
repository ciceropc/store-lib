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

        <p className={styles.description}>
          A INFOASSIST TI é uma empresa de gestão de tecnologia da informação
          focada em entender as necessidades e problemas do negócio do cliente
          para oferecer soluções tecnológicas que, de forma segura e produtiva,
          os auxilie no alcance de seus objetivos.
        </p>
        <p className={styles.description}>
          Desenvolvemos projetos de reestruturação e implantação para tornar sua
          TI inteligente, segura e proativa. Temos a expertise necessária para
          desenvolver soluções que aumentem a competitividade dos nossos
          clientes.
        </p>
        <p className={styles.description}>
          Nossa missão é cuidar da tecnologia para que, com o melhor
          custo-benefício, o cliente foque o próprio negócio.
        </p>

        <div className={styles.grid}>
          <a href="http://remoto.infoassist.com.br/" className={styles.card}>
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
