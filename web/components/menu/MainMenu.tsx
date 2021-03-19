import { Flex, Icon, Link } from '@chakra-ui/core'
import { IconDownload } from '../../assets/Icons'
import ActionButton from '../../components/ActionButton'
import MenuButton from '../../components/menu/MenuButton'

import LogoSVG from '../../public/LogoSVG'

export default function MainMenu({ gridArea, paddingX }): JSX.Element {
  return (
    <Flex
      backgroundColor="blue.500"
      direction={['column', 'row']}
      gridArea={gridArea}
      paddingX={paddingX}
      position={['unset', 'sticky']}
      top={0}
      transition="height .5s, line-height .5s"
      zIndex={10}
      alignItems={['center', 'auto']}
    >
      <Link href="/" _hover={{}} paddingY={['1', '3']} paddingTop={[10, 20]}>
        <LogoSVG color="white" size="70" />
      </Link>

      <Flex flex={['0', '1']}></Flex>

      <Flex
        flex="1"
        direction={['column', 'row']}
        alignItems={['center', 'unset']}
      >
        <MenuButton
          destination="/services"
          fontSize={['xl', 'md']}
          text="Serviços oferecidos"
        />
        <MenuButton
          destination="/about"
          fontSize={['xl', 'md']}
          text="Quem somos nós?"
        />
        <MenuButton
          destination="/contact"
          fontSize={['xl', 'md']}
          text="Contato"
        />
        <ActionButton
          destination="http://remoto.infoassist.com.br/"
          fontSize={['xl', 'md']}
          text="Suporte Remoto"
        />
      </Flex>
    </Flex>
  )
}
