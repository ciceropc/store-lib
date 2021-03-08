import { Flex, Grid, Heading, Link } from '@chakra-ui/core'
export default function MainMenu({ gridArea, paddingX }): JSX.Element {
  return (
    <Flex backgroundColor="blue.500" gridArea={gridArea} paddingX={paddingX}>
      <Link href="/" _hover={{}}>
        <Heading
          color="white"
          verticalAlign="center"
          alignContent="center"
          alignItems="center"
          alignSelf="center"
          textAlign="center"
          height="100%"
          lineHeight="2"
          fontWeight="thin"
        >
          InfoAssist
        </Heading>
      </Link>
      <Flex flex="1"></Flex>
      <Flex>
        <Link
          href="/contact"
          _hover={{ color: 'gray.200' }}
          color="white"
          paddingX="6"
          paddingY="6"
          fontWeight="bold"
          textTransform="uppercase"
        >
          Serviços Oferecidos
        </Link>
        <Link
          href="/contact"
          _hover={{ color: 'gray.200' }}
          color="white"
          paddingX="6"
          paddingY="6"
          fontWeight="bold"
          textTransform="uppercase"
        >
          Quem somos nós?
        </Link>
        <Link
          href="/contact"
          _hover={{ color: 'gray.200' }}
          color="white"
          paddingX="6"
          paddingY="6"
          fontWeight="bold"
          textTransform="uppercase"
        >
          Contato
        </Link>

        <Link
          href="/contact"
          _hover={{ color: 'gray.200' }}
          color="white"
          paddingX="6"
          paddingY="6"
          fontWeight="bold"
          textTransform="uppercase"
        >
          Área do cliente
        </Link>
      </Flex>
    </Flex>
  )
}
