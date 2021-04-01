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
  const fill = props.color ?? 'blue.300'
  const fontSize = props.fontSize ?? ''
  const hoverColor = props.hoverColor ?? 'gray.50'
  const hoverFillColor = props.hoverColor ?? 'white'
  const hoverBackgroundColor = props.hoverBackgroundColor ?? 'green.500'
  const height = size + 'px'
  // const linkColor = props.color ?? 'green.500'
  const width = size + 'px'
  return (
    <Flex>
      <Link
        _hover={{
          backgroundColor: hoverBackgroundColor,
          color: hoverColor,
          fill: hoverFillColor,
          cursor: 'initial'
        }}
        backgroundColor={backgroundColor}
        color={color}
        fill={fill}
        borderRadius="md"
        height={height}
        width={width}
        href={null}
      >
        <Flex paddingX={6} paddingY={6} direction="column">
          <Grid templateRows="1fr 95px 1fr" height={size * 0.65 + 'px'}>
            <Flex flex="1"> </Flex>
            <Flex flex="1" direction="column">
              <Flex>
                <Flex flex="1"></Flex>
                {props.children}
                <Flex flex="1"></Flex>
              </Flex>
              <Flex direction="column">
                <Heading
                  fontSize={fontSize}
                  marginTop={6}
                  fontWeight="bold"
                  textTransform="uppercase"
                  textAlign="center"
                >
                  {props.title}
                </Heading>
              </Flex>
            </Flex>

            <Flex flex="1"></Flex>
            {/* <Text
              marginTop={6}
              textAlign="center"
              fontWeight="regular"
              backgroundColor={hoverFillColor}
            >
              Saiba mais
            </Text> */}
          </Grid>
        </Flex>
      </Link>
    </Flex>
  )
}
