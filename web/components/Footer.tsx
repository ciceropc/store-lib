import { Flex, Heading, List, ListItem } from '@chakra-ui/core'

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
            <Heading size={headingFontSize}>Redes Sociais</Heading>
          </ListItem>
          <ListItem>Consectetur adipiscing elit</ListItem>
          <ListItem>Integer molestie lorem at massa</ListItem>
          <ListItem>Facilisis in pretium nisl aliquet</ListItem>
        </List>
        <List spacing={listSpacing} paddingTop={paddingTop}>
          <ListItem>
            <Heading size={headingFontSize}>Contato</Heading>
          </ListItem>
          <ListItem>Consectetur adipiscing elit</ListItem>
          <ListItem>Integer molestie lorem at massa</ListItem>
          <ListItem>Facilisis in pretium nisl aliquet</ListItem>
        </List>
        <List spacing={listSpacing} paddingTop={paddingTop}>
          <ListItem>
            <Heading size={headingFontSize}>Atendimento</Heading>
          </ListItem>
          <ListItem>Consectetur adipiscing elit</ListItem>
          <ListItem>Integer molestie lorem at massa</ListItem>
          <ListItem>Facilisis in pretium nisl aliquet</ListItem>
        </List>
      </Flex>

      <Flex flex="1"></Flex>
      <Flex flex="1" direction="column">
        <List spacing={listSpacing}>
          <ListItem>
            <Heading size={headingFontSize}>Redes Sociais</Heading>
          </ListItem>
          <ListItem>Consectetur adipiscing elit</ListItem>
          <ListItem>Integer molestie lorem at massa</ListItem>
          <ListItem>Facilisis in pretium nisl aliquet</ListItem>
        </List>
        <List spacing={listSpacing} paddingTop={paddingTop}>
          <ListItem>
            <Heading size={headingFontSize}>Contato</Heading>
          </ListItem>
          <ListItem>Consectetur adipiscing elit</ListItem>
          <ListItem>Integer molestie lorem at massa</ListItem>
          <ListItem>Facilisis in pretium nisl aliquet</ListItem>
        </List>
      </Flex>

      <Flex flex="1"></Flex>
      <Flex flex="1" direction="column">
        <List spacing={listSpacing}>
          <ListItem>
            <Heading size={headingFontSize}>Redes Sociais</Heading>
          </ListItem>
          <ListItem>Consectetur adipiscing elit</ListItem>
          <ListItem>Integer molestie lorem at massa</ListItem>
          <ListItem>Facilisis in pretium nisl aliquet</ListItem>
        </List>
        <List spacing={listSpacing} paddingTop={paddingTop}>
          <ListItem>
            <Heading size={headingFontSize}>Contato</Heading>
          </ListItem>
          <ListItem>Consectetur adipiscing elit</ListItem>
          <ListItem>Integer molestie lorem at massa</ListItem>
          <ListItem>Facilisis in pretium nisl aliquet</ListItem>
        </List>
      </Flex>

      <Flex flex="1"></Flex>
      <Flex flex="1" direction="column">
        <List spacing={listSpacing}>
          <ListItem>
            <Heading size={headingFontSize}>Atendimento</Heading>
          </ListItem>
          <ListItem>Consectetur adipiscing elit</ListItem>
          <ListItem>Integer molestie lorem at massa</ListItem>
          <ListItem>Facilisis in pretium nisl aliquet</ListItem>
        </List>
      </Flex>
    </Flex>
  )
}
