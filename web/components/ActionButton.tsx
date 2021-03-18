import { Flex, Link } from '@chakra-ui/core'

interface ActionButtonParameters {
  backgroundColor?: string
  color?: string
  destination?: string
  icon?: JSX.Element
  hoverBackgroundColor?: string
  hoverColor?: string
  text?: string
}

export default function ActionButton(
  props: ActionButtonParameters
): JSX.Element {
  function teste() {
    console.log('tapped ' + props.text)
  }
  const backgroundColor = props.backgroundColor ?? 'white'
  const color = props.color ?? 'blue.500'
  const iconData = props.icon ?? ''
  const hoverColor = props.hoverColor ?? 'white'
  const hoverBackgroundColor = props.hoverBackgroundColor ?? 'green.500'
  return (
    <Flex>
      <Link
        _hover={{ backgroundColor: hoverBackgroundColor, color: hoverColor }}
        backgroundColor={backgroundColor}
        borderRadius="md"
        color={color}
        fontWeight="bold"
        href={props.destination}
        marginX="4"
        marginY="6"
        onClick={teste}
        overflow="hidden"
        paddingX="4"
        paddingY="4"
        textTransform="uppercase"
        whiteSpace="nowrap"
      >
        {props.text}
        {iconData}
      </Link>
    </Flex>
  )
}
