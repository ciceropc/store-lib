import { Flex, Icon, Link } from '@chakra-ui/react'
import { IconDownload } from '../../assets/Icons'
import ActionButton from '../../components/ActionButton'
import MenuButton from '../../components/menu/MenuButton'

import LogoSVG from '../../public/LogoSVG'

export default function MainMenu({ gridArea, paddingX }): JSX.Element {
  return (
    <Flex
      backgroundColor={[
        'red.500',
        'orange.500',
        'yellow.500',
        'green.500',
        'blue.500'
      ]}
      direction={['column', 'row']}
      gridArea={gridArea}
      paddingX={paddingX}
      position={['unset', 'sticky']}
      top={0}
      transition="height .5s, line-height .5s"
      zIndex={10}
      alignItems={['center', 'auto']}
    >
      <Link href="/" _hover={{}} paddingY="3">
        <LogoSVG color="white" size="70" />
      </Link>

      <Flex flex={['0', '1']}></Flex>

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
