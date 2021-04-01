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
  target?: string
}
export default function MenuButton(props: MenuButtonParameters): JSX.Element {
  function teste() {
    console.log('tapped ' + props.text)
  }
  const backgroundColor = props.backgroundColor ?? ''
  const color = props.color ?? 'white'
  const fontSize = props.fontSize ?? ''
  const fontWeight = props.fontWeight ?? 'bold'
  const hoverBackgroundColor = props.hoverBackgroundColor ?? ''
  const hoverColor = props.hoverColor ?? 'white'
  const target = props.target
  return (
    <Flex paddingTop={10} paddingBottom={6}>
      <Link
        _hover={{
          backgroundColor: hoverBackgroundColor,
          borderBottom: '4px solid ' + hoverColor,
          color: hoverColor
        }}
        backgroundColor={backgroundColor}
        color={color}
        fontSize={fontSize}
        fontWeight={fontWeight}
        href={props.destination}
        onClick={teste}
        overflow="hidden"
        paddingTop={6}
        paddingX={4}
        target={target}
        textTransform="uppercase"
        whiteSpace="nowrap"
      >
        {props.text}
      </Link>
    </Flex>
  )
}
