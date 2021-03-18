import { Flex, Heading, Link, List, ListItem } from '@chakra-ui/core'

export default function Footer({ gridArea, paddingX }): JSX.Element {
  const headingFontSize = 'md'
  const paddingTop = '6'
  const listSpacing = '2'
  return (
    <Flex
      backgroundColor="gray.900"
      flex="1"
      fontSize="sm"
      gridArea={gridArea}
      paddingX={paddingX}
      paddingY="8"
      color="gray.100"
      align="start"
    >
      <Flex flex="1" direction="column">
        <List spacing={listSpacing}>
          <ListItem>
            <Link href="http://remoto.infoassist.com.br/">
              <Heading size={headingFontSize}>Suporte Remoto</Heading>
            </Link>
          </ListItem>
        </List>
        <List spacing={listSpacing} paddingTop={paddingTop}>
          <ListItem>
            <Link href="about">
              <Heading size={headingFontSize}>Quem Somos Nós?</Heading>
            </Link>
          </ListItem>
        </List>
      </Flex>

      <Flex flex="1"></Flex>
      <Flex flex="2" direction="column">
        <List spacing={listSpacing}>
          <ListItem>
            <Link href="services">
              <Heading size={headingFontSize}>Serviços Oferecidos</Heading>
            </Link>
          </ListItem>
          <ListItem>Consultoria de Tecnologia</ListItem>
          <ListItem>Prestação de serviços de TI </ListItem>
          <ListItem>Análise de infraestrutura </ListItem>
          <ListItem>Padronização de hardware e software</ListItem>
          <ListItem>Monitoramento em tempo real</ListItem>
          <ListItem>Serviços de infraestrutura de rede </ListItem>
        </List>
      </Flex>

      <Flex flex="1"></Flex>
      <Flex flex="1" direction="column">
        <List spacing={listSpacing}>
          <ListItem>
            <Link href="contact">
              <Heading size={headingFontSize}>Contato</Heading>
            </Link>
          </ListItem>
          <ListItem>contato@infoassist.com.br</ListItem>
          <ListItem>(51) 98049-7131</ListItem>
        </List>
        <List spacing={listSpacing} paddingTop={paddingTop}>
          <ListItem>
            <Heading size={headingFontSize}>Localização</Heading>
          </ListItem>
          <ListItem>Niterói - Canoas</ListItem>
        </List>
      </Flex>
    </Flex>
  )
}
