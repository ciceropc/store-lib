import { Flex, Link } from '@chakra-ui/core'
import MenuButton from '../../components/menu/MenuButton'
import LogoSVG from '../../public/LogoSVG'

export default function MainMenu({ gridArea, paddingX }): JSX.Element {
  return (
    <Flex backgroundColor="blue.500" gridArea={gridArea} paddingX={paddingX}>
      <Link href="/" _hover={{}} paddingY="3">
        <LogoSVG color="white" size="70" />
      </Link>

      <Flex flex="1"></Flex>
      <Flex>
        <MenuButton destination="/contact" text="Serviços oferecidos" />
        <MenuButton destination="/contact" text="Área do cliente" />
        <MenuButton destination="/contact" text="Quem somos nós?" />
        <MenuButton destination="/contact" text="Contato" />
      </Flex>
    </Flex>
  )
}
