import { Flex, Link } from '@chakra-ui/core'

interface ActionButtonParameters {
  text?: string
  destination?: string
  icon?: JSX.Element
}

export default function ActionButton(
  props: ActionButtonParameters
): JSX.Element {
  function teste() {
    console.log('tapped ' + props.text)
  }
  const iconData = props.icon ?? ''
  return (
    <Flex>
      <Link
        _hover={{ backgroundColor: 'green.500', color: 'white' }}
        backgroundColor="white"
        borderRadius="md"
        color="blue.500"
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
