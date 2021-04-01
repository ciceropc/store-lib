import { Box, Flex, Text } from '@chakra-ui/core'

interface ServiceSectionParameters {
  name: string
  backgroundImageSrc: string
  description?: string
  headDescription?: string
  alignment?
  backgroundAlignment?: string
  backgroundColorDefault?: string
  backgroundHeight?: string
  backgroundWidth?: string
  borderRadius?: string
}

export default function ServiceSection(
  props: ServiceSectionParameters
): JSX.Element {
  const alignment = props.alignment ?? 'justify'
  const backgroundColorDefault =
    props.backgroundColorDefault ?? 'blackAlpha.800'
  const backgroundAlignment = props.backgroundAlignment ?? 'center'
  const backgroundHeight = props.backgroundHeight ?? '250px'
  const borderRadius = props.borderRadius ?? 'md'

  return (
    <Flex flexDirection="row" paddingBottom={8}>
      <Box height={backgroundHeight} width={backgroundHeight} marginRight={8}>
        <Flex
          backgroundImage={'url(' + props.backgroundImageSrc + ')'}
          height={backgroundHeight}
          width={backgroundHeight}
          backgroundPosition={backgroundAlignment}
          backgroundRepeat="no-repeat"
          backgroundSize="200%"
          overflow="hidden"
          borderRadius={borderRadius}
        ></Flex>
        <Flex
          color="white"
          backgroundColor={backgroundColorDefault}
          fontSize="4xl"
          height="90px"
          marginTop="-90px"
          paddingLeft="10%"
          paddingTop="18px"
          width={backgroundHeight}
          borderBottomLeftRadius={borderRadius}
          borderBottomRightRadius={borderRadius}
        >
          {props.name}
        </Flex>
      </Box>
      <Text textAlign={alignment} lineHeight="2">
        {props.description}
      </Text>
    </Flex>
  )
}
