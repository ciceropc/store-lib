import { Box, Flex, Text } from '@chakra-ui/react'

interface ServiceSectionParameters {
  name: string
  backgroundImageSrc: string
  description?: string

  headDescription?: string
  alignment?
  avatarSize?
  backgroundColorDefault?: string
  backgroundColorHover?: string
  colorDefault?: string
  colorHover?: string
  headingFontSize?: string
  listSpacing?: string
  paddingTop?: string
}

export default function ServiceSection(
  props: ServiceSectionParameters
): JSX.Element {
  const alignment = props.alignment ?? 'center'
  const avatarSize = props.avatarSize ?? '2xl'
  const backgroundColorDefault =
    props.backgroundColorDefault ?? 'blackAlpha.800'
  const backgroundColorHover = props.backgroundColorHover ?? 'yellow.500'
  const colorDefault = props.colorDefault ?? 'white'
  const colorHover = props.colorHover ?? 'gray.800'
  const headingFontSize = props.alignment ?? 'md'
  const listSpacing = props.listSpacing ?? '1'
  const paddingTop = props.paddingTop ?? '6'

  return (
    <Box>
      <Flex direction="column">
        <Flex
          backgroundImage={'url(' + props.backgroundImageSrc + ')'}
          height="200px"
          width="100vw"
          backgroundPosition="center"
          backgroundRepeat="no-repeat"
          backgroundSize="100%"
          overflow="hidden"
        ></Flex>
        <Flex
          color="white"
          backgroundColor={backgroundColorDefault}
          fontSize="4xl"
          height="90px"
          marginTop="-90px"
          paddingLeft="10%"
          paddingTop="18px"
          width="100vw"
        >
          {props.name}
        </Flex>
      </Flex>
      <Text textAlign="justify" paddingY="8" lineHeight="2" paddingX="10%">
        {props.description}
      </Text>
    </Box>
  )
}
