// eslint-disable-next-line no-use-before-define

import { Flex, Grid, Input } from '@chakra-ui/core'
export default function Contact(): JSX.Element {
  return (
    <Flex height="80vh">
      <Grid paddingY="8" templateRows="repeat(3, 1fr)" height="210px">
        <Input placeholder="Nome" />
        <Input placeholder="Telefona para contato" />
        <Input placeholder="Em que podemos ajudar?" />
      </Grid>
    </Flex>
  )
}
