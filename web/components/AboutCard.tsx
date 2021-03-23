import { Avatar, Flex, Heading, Link, List, ListItem } from '@chakra-ui/core'

interface AboutCardParameters {
  name: string
  avatarImageSrc: string
  headDescription?: string
  listDescription?: string[]
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

export default function AboutCard(props: AboutCardParameters): JSX.Element {
  const alignment = props.alignment ?? 'center'
  const avatarSize = props.avatarSize ?? '2xl'
  const backgroundColorDefault = props.backgroundColorDefault ?? 'gray.800'
  const backgroundColorHover = props.backgroundColorHover ?? 'yellow.500'
  const colorDefault = props.colorDefault ?? 'white'
  const colorHover = props.colorHover ?? 'gray.800'
  const headingFontSize = props.alignment ?? 'md'
  const headingFontWeight = 'thin'
  const listSpacing = props.listSpacing ?? '3'
  const paddingTop = props.paddingTop ?? '6'

  return (
    <Link
      backgroundColor={backgroundColorDefault}
      borderRadius="md"
      color={colorDefault}
      cursor="default"
      _hover={{
        backgroundColor: backgroundColorHover,
        color: colorHover
      }}
      padding="8"
    >
      <Flex textAlign="justify" direction="column" alignItems={alignment}>
        <Avatar
          size={avatarSize}
          name={props.name}
          src={props.avatarImageSrc}
        />
        <List
          spacing={listSpacing}
          alignItems={alignment}
          paddingTop={paddingTop}
        >
          <ListItem>
            <Heading size={headingFontSize} textAlign={alignment}>
              {props.name}
            </Heading>
          </ListItem>
          <ListItem>
            <Heading
              size={headingFontSize}
              textAlign={alignment}
              textTransform="uppercase"
              fontWeight={headingFontWeight}
            >
              {props.headDescription}
            </Heading>
          </ListItem>
          {props.listDescription?.map(lisItem => (
            <ListItem textAlign={alignment}>{lisItem}</ListItem>
          ))}
        </List>
      </Flex>
    </Link>
  )
}
