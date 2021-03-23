// eslint-disable-next-line no-use-before-define

import { Grid, Text } from '@chakra-ui/core'

import AboutCard from '../components/AboutCard'
import ContentSection from '../components/ContentSection'

export default function About(): JSX.Element {
  return (
    <ContentSection
      alignment="left"
      backgroundColor="white"
      color="black"
      title="Quem somos nós?"
    >
      <Text textAlign="justify" marginBottom="8" lineHeight="2" fontSize="lg">
        A INFOASSIST TI é uma empresa de gestão de tecnologia da informação
        focada em entender as necessidades e problemas do negócio do cliente
        para oferecer soluções tecnológicas que, de forma segura e produtiva, os
        auxilie no alcance de seus objetivos. Desenvolvemos projetos de
        reestruturação e implantação para tornar sua TI inteligente, segura e
        proativa. Temos a expertise necessária para desenvolver soluções que
        aumentem a competitividade dos nossos clientes. Nossa missão é cuidar da
        tecnologia para que, com o melhor custo-benefício, o cliente foque o
        próprio negócio.
      </Text>
      <Grid
        columnGap="8"
        rowGap="8"
        templateColumns="1fr 1fr 1fr 1fr "
        templateRows="1fr"
      >
        <AboutCard
          name="Cícero Costa"
          avatarImageSrc="https://instagram.fpoa13-1.fna.fbcdn.net/v/t51.2885-19/s320x320/14590922_424165894581267_4143027923051347968_a.jpg?tp=1&_nc_ht=instagram.fpoa13-1.fna.fbcdn.net&_nc_ohc=4Swu1aVIZNkAX-gfxt9&oh=43150c5c359de9a095ddae7d21323dc0&oe=6070986A"
          headDescription="Gerente de Operações"
        />

        <AboutCard
          name="Vinicius Barros"
          avatarImageSrc="https://instagram.fpoa13-1.fna.fbcdn.net/v/t51.2885-19/s320x320/65307483_905240896505081_408637559502012416_n.jpg?tp=1&_nc_ht=instagram.fpoa13-1.fna.fbcdn.net&_nc_ohc=xRatyBPXy0QAX8lpNoj&oh=8a5c600d3c2698f1f67d8ae33d93489f&oe=60714BCD"
          headDescription="Consultor em Tecnologia da Informação"
        />
        <AboutCard
          name="Franscisco Donini"
          avatarImageSrc="https://instagram.fpoa13-1.fna.fbcdn.net/v/t51.2885-19/s320x320/131936168_665506880786988_1251286919158526979_n.jpg?tp=1&_nc_ht=instagram.fpoa13-1.fna.fbcdn.net&_nc_ohc=_JaGXsMKX18AX8h6lJM&oh=cb0fd7da7e3c0e50d3627c05d6911639&oe=60715563"
          headDescription="Técnico de Apoio ao Usuário"
        />
        <AboutCard
          name="Fernando Donini"
          avatarImageSrc="https://instagram.fpoa13-1.fna.fbcdn.net/v/t51.2885-19/s320x320/158880158_452485882857878_8906126037026577171_n.jpg?tp=1&_nc_ht=instagram.fpoa13-1.fna.fbcdn.net&_nc_ohc=ajJ7jf9DXE8AX_HudQX&oh=a13db33f213fc635211b487ad0826136&oe=6070FEAB"
          headDescription="Consultor em desenvolvimento"
        />
      </Grid>
    </ContentSection>
  )
}
