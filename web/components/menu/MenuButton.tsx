import { Flex, Link } from '@chakra-ui/core'

export default function MenuButton({ text, destination }): JSX.Element {
  function teste() {
    console.log('tapped ' + text)
  }
  return (
    <Flex>
      <Link
        color="white"
        fontWeight="bold"
        href={destination}
        _hover={{ color: 'gray.200' }}
        overflow="hidden"
        paddingX="6"
        paddingY="10"
        textTransform="uppercase"
        onClick={teste}
        whiteSpace="nowrap"
      >
        {text}
      </Link>
    </Flex>
  )
}
