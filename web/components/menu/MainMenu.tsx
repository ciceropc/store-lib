import { Flex, Icon, Link } from '@chakra-ui/core'
import { IconDownload } from '../../assets/Icons'
import ActionButton from '../../components/ActionButton'
import MenuButton from '../../components/menu/MenuButton'

import LogoSVG from '../../public/LogoSVG'

export default function MainMenu({ gridArea, paddingX }): JSX.Element {
  return (
    <Flex
      backgroundColor="blue.500"
      gridArea={gridArea}
      paddingX={paddingX}
      position="sticky"
      top={0}
      transition="height .5s, line-height .5s"
      zIndex={10}
    >
      <Link href="/" _hover={{}} paddingY="3">
        <LogoSVG color="white" size="70" />
      </Link>

      <Flex flex="1"></Flex>

      <Flex flex="1">
        <MenuButton destination="/services" text="Serviços oferecidos" />
        <MenuButton destination="/about" text="Quem somos nós?" />
        <MenuButton destination="/contact" text="Contato" />
        <ActionButton
          destination="http://remoto.infoassist.com.br/"
          text="Suporte Remoto"
        />
      </Flex>
    </Flex>
  )
}
