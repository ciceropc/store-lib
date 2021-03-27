import { Flex, Heading, Link } from '@chakra-ui/core'

interface ServicesItemParameters {
  backgroundColor?: string
  color?: string
  fontSize?: string | string[]
  icon?: JSX.Element
  hoverBackgroundColor?: string
  hoverColor?: string
  title?: string
  description?: string
}

export default function ServicesItem(
  props: ServicesItemParameters
): JSX.Element {
  const backgroundColor = props.backgroundColor ?? 'white'
  const color = props.color ?? 'blue.500'
  const iconData = props.icon ?? ''
  const fontSize = props.fontSize ?? ''
  const hoverColor = props.hoverColor ?? 'white'
  const hoverBackgroundColor = props.hoverBackgroundColor ?? 'green.500'
  return (
    <Flex paddingY={6}>
      <Heading>{props.title}</Heading>
      <Link
        _hover={{ backgroundColor: hoverBackgroundColor, color: hoverColor }}
        backgroundColor={backgroundColor}
        borderRadius="md"
        color={color}
        fontSize={fontSize}
        fontWeight="bold"
        marginX={4}
        marginY={6}
        overflow="hidden"
        paddingX={4}
        paddingY={4}
        textTransform="uppercase"
        whiteSpace="nowrap"
      >
        {props.description}
        {iconData}
      </Link>
    </Flex>
  )
}
