// eslint-disable-next-line no-use-before-define

import {
  Avatar,
  Flex,
  Grid,
  Heading,
  Link,
  List,
  ListItem,
  Text
} from '@chakra-ui/core'
export default function About(): JSX.Element {
  const alignment = 'center'
  const avatarSize = '2xl'
  const backgroundColorDefault = 'gray.800'
  const backgroundColorHover = 'yellow.500'
  const colorDefault = 'white'
  const colorHover = 'gray.800'
  const headingFontSize = 'md'
  const listSpacing = '1'
  const paddingTop = '6'
  return (
    <Flex flex="1" direction="column" paddingX="10%" paddingBottom="8">
      <Text textAlign="justify" paddingY="8" lineHeight="2">
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
        templateColumns="1fr 1fr"
        templateRows="1fr 1fr"
      >
        <Link
          backgroundColor={backgroundColorDefault}
          borderRadius="sm"
          color={colorDefault}
          cursor="default"
          _hover={{
            backgroundColor: backgroundColorHover,
            color: colorHover
          }}
          padding="8"
        >
          <Flex textAlign={alignment} direction="column" alignItems={alignment}>
            <Avatar
              size={avatarSize}
              name="Cícero Costa"
              src="https://instagram.fpoa13-1.fna.fbcdn.net/v/t51.2885-19/s320x320/14590922_424165894581267_4143027923051347968_a.jpg?tp=1&_nc_ht=instagram.fpoa13-1.fna.fbcdn.net&_nc_ohc=4Swu1aVIZNkAX-gfxt9&oh=43150c5c359de9a095ddae7d21323dc0&oe=6070986A"
            />
            <List
              spacing={listSpacing}
              alignItems={alignment}
              paddingTop={paddingTop}
            >
              <ListItem>
                <Heading size={headingFontSize} textAlign={alignment}>
                  Cícero Costa
                </Heading>
              </ListItem>
              <ListItem textAlign={alignment}>
                Consectetur adipiscing elit
              </ListItem>
              <ListItem textAlign={alignment}>
                Integer molestie lorem at massa
              </ListItem>
              <ListItem textAlign={alignment}>
                Facilisis in pretium nisl aliquet
              </ListItem>
            </List>
          </Flex>
        </Link>
        <Link
          backgroundColor={backgroundColorDefault}
          borderRadius="sm"
          color={colorDefault}
          cursor="default"
          _hover={{
            backgroundColor: backgroundColorHover,
            color: colorHover
          }}
          padding="8"
        >
          <Flex textAlign="justify" direction="column" alignItems={alignment}>
            <Avatar
              size={avatarSize}
              name="Vinícius Barros"
              src="https://instagram.fpoa13-1.fna.fbcdn.net/v/t51.2885-19/s320x320/65307483_905240896505081_408637559502012416_n.jpg?tp=1&_nc_ht=instagram.fpoa13-1.fna.fbcdn.net&_nc_ohc=xRatyBPXy0QAX8lpNoj&oh=8a5c600d3c2698f1f67d8ae33d93489f&oe=60714BCD"
            />
            <List
              spacing={listSpacing}
              alignItems={alignment}
              paddingTop={paddingTop}
            >
              <ListItem>
                <Heading size={headingFontSize} textAlign={alignment}>
                  Vinícius Barros
                </Heading>
              </ListItem>
              <ListItem textAlign={alignment}>
                Consectetur adipiscing elit
              </ListItem>
              <ListItem textAlign={alignment}>
                Integer molestie lorem at massa
              </ListItem>
              <ListItem textAlign={alignment}>
                Facilisis in pretium nisl aliquet
              </ListItem>
            </List>
          </Flex>
        </Link>
        <Link
          backgroundColor={backgroundColorDefault}
          borderRadius="sm"
          color={colorDefault}
          cursor="default"
          _hover={{
            backgroundColor: backgroundColorHover,
            color: colorHover
          }}
          padding="8"
        >
          <Flex textAlign="justify" direction="column" alignItems={alignment}>
            <Avatar
              size={avatarSize}
              name="Fernando Donini"
              src="https://instagram.fpoa13-1.fna.fbcdn.net/v/t51.2885-19/s320x320/158880158_452485882857878_8906126037026577171_n.jpg?tp=1&_nc_ht=instagram.fpoa13-1.fna.fbcdn.net&_nc_ohc=ajJ7jf9DXE8AX_HudQX&oh=a13db33f213fc635211b487ad0826136&oe=6070FEAB"
            />
            <List
              spacing={listSpacing}
              alignItems={alignment}
              paddingTop={paddingTop}
            >
              <ListItem>
                <Heading size={headingFontSize} textAlign={alignment}>
                  Fernando Donini
                </Heading>
              </ListItem>
              <ListItem textAlign={alignment}>
                Consectetur adipiscing elit
              </ListItem>
              <ListItem textAlign={alignment}>
                Integer molestie lorem at massa
              </ListItem>
              <ListItem textAlign={alignment}>
                Facilisis in pretium nisl aliquet
              </ListItem>
            </List>
          </Flex>
        </Link>
        <Link
          backgroundColor={backgroundColorDefault}
          borderRadius="sm"
          color={colorDefault}
          cursor="default"
          _hover={{
            backgroundColor: backgroundColorHover,
            color: colorHover
          }}
          padding="8"
        >
          <Flex textAlign="justify" direction="column" alignItems={alignment}>
            <Avatar
              size={avatarSize}
              name="Francisco Donini"
              src="https://instagram.fpoa13-1.fna.fbcdn.net/v/t51.2885-19/s320x320/131936168_665506880786988_1251286919158526979_n.jpg?tp=1&_nc_ht=instagram.fpoa13-1.fna.fbcdn.net&_nc_ohc=_JaGXsMKX18AX8h6lJM&oh=cb0fd7da7e3c0e50d3627c05d6911639&oe=60715563"
            />
            <List
              spacing={listSpacing}
              alignItems={alignment}
              paddingTop={paddingTop}
            >
              <ListItem>
                <Heading size={headingFontSize} textAlign={alignment}>
                  Francisco Donini
                </Heading>
              </ListItem>
              <ListItem textAlign={alignment}>
                Consectetur adipiscing elit
              </ListItem>
              <ListItem textAlign={alignment}>
                Integer molestie lorem at massa
              </ListItem>
              <ListItem textAlign={alignment}>
                Facilisis in pretium nisl aliquet
              </ListItem>
            </List>
          </Flex>
        </Link>
      </Grid>
    </Flex>
  )
}
