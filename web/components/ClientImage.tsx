import { Box, Flex, Grid, Image, Link, Text } from '@chakra-ui/core'
interface ClientImageParameters {
  backgroundColor?: string
  color?: string
  fontSize?: string | string[]
  className?: string
  hoverColor?: string
  title?: string
  description?: string
  src?: string
}

export default function ClientImage(props: ClientImageParameters): JSX.Element {
  const maxHeight = '2xs'
  const maxWidth = '2xs'
  const className = props.className ?? ''
  return (
    <Flex direction="column">
      <Flex flex="1"></Flex>
      <Image
        src={props.src}
        maxHeight={maxHeight}
        maxWidth={maxWidth}
        objectFit="contain"
        paddingX={8}
        paddingY={6}
        className={className}
      />
      <Flex flex="1"></Flex>
    </Flex>
  )
}
