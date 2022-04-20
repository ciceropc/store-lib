import { Flex, Heading, Link, List, ListItem } from '@chakra-ui/core'
import Utils from '../utils/components_utils'

export default function Footer({ gridArea }): JSX.Element {
  const headingFontSize = ['2xl', 'md']
  const paddingTop = [6, '6']
  const listSpacing = [4, '2']
  return (
    <Flex
      backgroundColor="gray.900"
      direction={['column', 'row']}
      flex="1"
      fontSize={['xl', 'sm']}
      gridArea={gridArea}
      paddingX={Utils.defaultPaddingX}
      paddingY={12}
      color="gray.100"
      align="start"
      width={Utils.defaultResponsiveWidth}
    >
      <Flex flex="1" direction="column">
        <List spacing={listSpacing}>
          <ListItem>
            <Link href="https://remoto.infoassist.com.br/">
              <Heading fontSize={headingFontSize}>Suporte Remoto</Heading>
            </Link>
          </ListItem>
        </List>
        {/* <List spacing={listSpacing} paddingTop={paddingTop}>
          <ListItem>
            <Link href="about">
              <Heading fontSize={headingFontSize}>Quem Somos Nós?</Heading>
            </Link>
          </ListItem>
        </List> */}
      </Flex>

      <Flex flex={['0', '1']}></Flex>
      <Flex flex={['1', '2']} direction="column">
        <List spacing={listSpacing} paddingTop={[6, 0]}>
          <ListItem>
            <Heading fontSize={headingFontSize}>Serviços Oferecidos</Heading>
          </ListItem>
          <ListItem>Consultoria de Tecnologia</ListItem>
          <ListItem>Prestação de serviços de TI </ListItem>
          <ListItem>Análise de infraestrutura </ListItem>
          <ListItem>Padronização de hardware e software</ListItem>
          <ListItem>Monitoramento em tempo real</ListItem>
          <ListItem>Serviços de infraestrutura de rede </ListItem>
        </List>
      </Flex>

      <Flex flex={['0', '1']}></Flex>
      <Flex flex="1" direction="column">
        <List spacing={listSpacing} paddingTop={[6, 0]}>
          <ListItem>
            <Heading fontSize={headingFontSize}>Contato</Heading>
          </ListItem>
          <ListItem>
            <Link href="mailto:contato@infoassist.com.br?subject=Olá!%20Gostaria%20de%20...">
              contato@infoassist.com.br
            </Link>
          </ListItem>
          <ListItem>(51) 99466-2328</ListItem>
          <ListItem>
            <Link href="http://contact.infoassist.com.br" target="_blank">
              Agende uma consultoria
            </Link>
          </ListItem>
        </List>
        <List spacing={listSpacing} paddingTop={paddingTop}>
          <ListItem>
            <Heading fontSize={headingFontSize}>Localização</Heading>
          </ListItem>
          <ListItem>Niterói - Canoas</ListItem>
        </List>
      </Flex>
    </Flex>
  )
}
