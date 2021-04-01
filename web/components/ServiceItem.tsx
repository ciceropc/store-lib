import { Box, Flex, Grid, Heading, Link, Text } from '@chakra-ui/core'
interface ServicesItemParameters {
  backgroundColor?: string
  color?: string
  fontSize?: string | string[]
  hoverBackgroundColor?: string
  hoverColor?: string
  title?: string
  description?: string
  children?
}

export default function ServicesItem(
  props: ServicesItemParameters
): JSX.Element {
  const size = 200
  const backgroundColor = props.backgroundColor ?? 'gray.100'
  const color = props.color ?? 'gray.800'
  const fill = props.color ?? 'blue.500'
  const fontSize = props.fontSize ?? ''
  const hoverColor = props.hoverColor ?? 'gray.800'
  const hoverFillColor = props.hoverColor ?? 'green.500'
  const hoverBackgroundColor = props.hoverBackgroundColor ?? 'white'
  const height = size + 'px'
  const linkColor = props.color ?? 'orange.500'
  const width = size + 'px'
  return (
    <Flex>
      <Link
        _hover={{
          backgroundColor: hoverBackgroundColor,
          color: hoverColor,
          fill: hoverFillColor
        }}
        backgroundColor={backgroundColor}
        color={color}
        fill={fill}
        borderRadius="md"
        height={height}
        width={width}
        href="/services"
      >
        <Flex paddingX={6} paddingY={6} direction="column">
          <Grid templateRows="55px 15px 1fr 20px" height={size * 0.65 + 'px'}>
            <Flex flex="1">
              <Flex flex="1"></Flex>
              {props.children}
              <Flex flex="1"></Flex>
            </Flex>
            <Heading
              fontSize={fontSize}
              marginTop={6}
              fontWeight="bold"
              textTransform="uppercase"
              textAlign="center"
            >
              {props.title}
            </Heading>
            <Flex> </Flex>
            <Text
              marginTop={6}
              textAlign="center"
              fontWeight="regular"
              color={linkColor}
              backgroundColor={hoverFillColor}
            >
              Saiba mais
            </Text>
          </Grid>
        </Flex>
      </Link>
    </Flex>
  )
}
