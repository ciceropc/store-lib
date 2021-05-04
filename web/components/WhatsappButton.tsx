import { Flex, Link } from '@chakra-ui/core'
import { WhatsappIcon } from '../assets/Icons'

interface WhatsappButtonParameters {
  text?: string
}

export default function WhatsappButton(
  props: WhatsappButtonParameters
): JSX.Element {
  function teste() {
    console.log('Whatsapp Button tapped ' + props.text)
  }
  const backgroundColor = 'green.500'
  const color = 'white'
  const fontSize = ''
  const hoverColor = 'white'
  const hoverBackgroundColor = 'green.300'
  const whatsAppNumber = '555194662328'
  const whatsAppDefaultMessage = 'Olá! Preciso de ajuda!'
  return (
    <Link
      display="block"
      position="fixed"
      bottom={['175px', '30px']}
      right={['20px', '20px']}
      zIndex={2}
      _hover={{ backgroundColor: hoverBackgroundColor, color: hoverColor }}
      backgroundColor={backgroundColor}
      borderRadius="md"
      color={color}
      fontSize={fontSize}
      fontWeight="bold"
      href={
        'https://wa.me/' +
        whatsAppNumber +
        '?text=' +
        encodeURI(whatsAppDefaultMessage)
      }
      onClick={teste}
      overflow="hidden"
      paddingLeft={6}
      paddingRight={4}
      paddingBottom={4}
      paddingTop={6}
      target="_blank"
      textTransform="uppercase"
      whiteSpace="nowrap"
    >
      <WhatsappIcon size="55" />
    </Link>
  )
}
