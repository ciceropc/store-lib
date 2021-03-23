import { Flex } from '@chakra-ui/core'

import Utils from '../utils/components_utils'

interface ContentSectionParameters {
  alignment?
  backgroundColor?: string
  children?
  color?: string
  direction?
}

export default function ContentSection(
  props: ContentSectionParameters
): JSX.Element {
  const alignment = props.alignment ?? 'center'
  const backgroundColor = props.backgroundColor ?? 'blue.500'
  const color = props.color ?? 'white'
  const direction = props.direction ?? 'column'

  return (
    <Flex
      direction={direction}
      backgroundColor={backgroundColor}
      color={color}
      paddingY={Utils.defaultPaddingY}
      paddingX={Utils.defaultPaddingX}
      textAlign={alignment}
      alignItems={alignment}
    >
      {props.children}
    </Flex>
  )
}
