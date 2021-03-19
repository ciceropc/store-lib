import { Flex, Link } from '@chakra-ui/core'

interface MenuButtonParameters {
  backgroundColor?: string
  color?: string
  destination?: string
  fontSize?: string | string[]
  fontWeight?: string
  icon?: JSX.Element
  hoverBackgroundColor?: string
  hoverColor?: string
  text?: string
}
export default function MenuButton(props: MenuButtonParameters): JSX.Element {
  function teste() {
    console.log('tapped ' + props.text)
  }
  const backgroundColor = props.backgroundColor ?? ''
  const color = props.color ?? 'white'
  const fontSize = props.fontSize ?? ''
  const fontWeight = props.fontWeight ?? 'bold'
  const hoverColor = props.hoverColor ?? 'gray.300'
  const hoverBackgroundColor = props.hoverBackgroundColor ?? 'blue.500'
  return (
    <Flex>
      <Link
        backgroundColor={backgroundColor}
        color={color}
        fontSize={fontSize}
        fontWeight={fontWeight}
        href={props.destination}
        _hover={{ backgroundColor: hoverBackgroundColor, color: hoverColor }}
        overflow="hidden"
        paddingX="6"
        paddingY="10"
        textTransform="uppercase"
        onClick={teste}
        whiteSpace="nowrap"
      >
        {props.text}
      </Link>
    </Flex>
  )
}
