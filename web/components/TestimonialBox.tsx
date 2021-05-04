import {
  Avatar,
  Box,
  Flex,
  Heading,
  List,
  ListItem,
  Text
} from '@chakra-ui/core'

interface TestimonialBoxParameters {
  alignment?
  backgroundColor?: string
  children?
  color?: string
  direction?
  headingFontSize?
  imageSrc?: string
  listSpacing?
  paddingTop?
  testimonialAuthor: string
  testimonialCompany: string
  testimonialText: string
}

export default function TestimonialBox(
  props: TestimonialBoxParameters
): JSX.Element {
  const alignment = props.alignment ?? 'left'
  const backgroundColor = props.backgroundColor ?? 'blue.500'
  const color = props.color ?? 'white'
  const flexContent = ['12', '2']
  const flexLeft = alignment === 'left' ? '0' : '1'
  const flexRight = alignment === 'right' ? '0' : '1'
  const headingFontSize = props.headingFontSize ?? 'lg'
  const imageSrc = props.imageSrc ?? 'https://thispersondoesnotexist.com/image'
  const listSpacing = props.listSpacing ?? '1'
  const paddingTop = props.paddingTop ?? '8'
  const textAlignment = 'left'

  let avatarOnLeft
  let avatarOnRight

  if (alignment === 'left') {
    avatarOnLeft = (
      <Avatar name="" src={imageSrc} size="xl" marginTop={8} marginRight={6} />
    )
  } else if (alignment === 'right') {
    avatarOnRight = (
      <Avatar name="" src={imageSrc} size="xl" marginTop={8} marginLeft={6} />
    )
  }

  return (
    <Flex>
      <Flex flex={flexLeft}></Flex>
      <Flex flex={flexContent}>
        {/* {avatarOnLeft} */}
        <Box
          backgroundColor={backgroundColor}
          borderRadius="lg"
          color={color}
          paddingX={paddingTop}
          paddingY={paddingTop}
        >
          <List spacing={listSpacing} alignItems="center">
            <ListItem>
              <Heading
                fontSize={['2xl', headingFontSize]}
                textAlign={textAlignment}
              >
                {props.testimonialAuthor}
              </Heading>
            </ListItem>
            <ListItem>
              <Heading
                fontSize={['2xl', headingFontSize]}
                fontWeight="thin"
                letterSpacing="wide"
                textAlign={textAlignment}
              >
                {props.testimonialCompany}
              </Heading>
            </ListItem>

            <ListItem>
              <Text
                fontSize={['2xl', 'xl']}
                fontWeight="normal"
                textAlign={textAlignment}
              >
                {props.testimonialText}
              </Text>
            </ListItem>
          </List>
        </Box>
        {/* {avatarOnRight} */}
      </Flex>
      <Flex flex={flexRight}></Flex>
    </Flex>
  )
}
