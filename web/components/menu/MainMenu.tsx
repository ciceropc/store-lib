import { Flex, Link } from '@chakra-ui/core'
import ActionButton from '../../components/ActionButton'
import MenuButton from '../../components/menu/MenuButton'

import LogoSVG from '../../public/LogoSVG'
import Utils from '../../utils/components_utils'

export default function MainMenu(): JSX.Element {
  return (
    <Flex
      alignItems={['center', 'auto']}
      backgroundColor="blue.500"
      direction={['row']}
      paddingX={Utils.defaultPaddingX}
      paddingY={[0]}
      position={['sticky']}
      top={['calc(100% - 154px)', 0]}
      transition="height .5s, line-height .5s"
      zIndex={10}
      width={Utils.defaultResponsiveWidth}
    >
      <Flex flex="1">
        <Link href="/" _hover={{}} height={75}>
          <LogoSVG color="white" size="75" />
        </Link>
      </Flex>
      <Flex flex={['1']}></Flex>
      <Flex
        alignItems={['unset']}
        direction={['row']}
        flex="1"
        verticalAlign="center"
      >
        <Flex flex={['1']}></Flex>
        {/* <MenuButton
          destination="/services"
          fontSize={['xl', 'md']}
          text="Serviços oferecidos"
        /> */}
        {/* <MenuButton
          destination="/about"
          fontSize={['xl', 'md']}
          text="Quem somos nós?"
        /> */}
        <MenuButton
          destination="http://contact.infoassist.com.br"
          fontSize={['xl', 'md']}
          text="Contato"
          target="_blank"
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
