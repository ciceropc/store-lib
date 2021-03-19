import { Flex, Icon, Link } from '@chakra-ui/core'
import { IconDownload } from '../../assets/Icons'
import ActionButton from '../../components/ActionButton'
import MenuButton from '../../components/menu/MenuButton'

import LogoSVG from '../../public/LogoSVG'
import Utils from '../../utils/components_utils'

export default function MainMenu({ gridArea }): JSX.Element {
  return (
    <Flex
      alignItems={['center', 'auto']}
      backgroundColor="blue.500"
      direction={['column', 'row']}
      gridArea={gridArea}
      paddingX={Utils.defaultPaddingX}
      position={['unset', 'sticky']}
      top={0}
      transition="height .5s, line-height .5s"
      zIndex={10}
      width={Utils.defaultResponsiveWidth}
    >
      <Flex flex="1">
        <Link href="/" _hover={{}} height={75}>
          <LogoSVG color="white" size="75" />
        </Link>
      </Flex>
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
