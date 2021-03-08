import { Flex, Link } from '@chakra-ui/core'

export default function MenuButton({ text, destination }): JSX.Element {
  return (
    <Flex>
      <Link
        href={destination}
        _hover={{ color: 'gray.200' }}
        color="white"
        paddingX="6"
        paddingY="10"
        fontWeight="bold"
        textTransform="uppercase"
      >
        {text}
      </Link>
    </Flex>
  )
}
