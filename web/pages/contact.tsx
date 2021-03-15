// eslint-disable-next-line no-use-before-define

import { Button, Flex, Grid, Input, Text, Textarea } from '@chakra-ui/core'

export default function Contact(): JSX.Element {
  return (
    <Flex flex="1" paddingX="10%" paddingY="8">
      <Text textAlign="justify" paddingY="8" lineHeight="2">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur
        fermentum lorem vitae lacus congue, id pretium orci pretium. Cras at
        congue justo. Morbi laoreet orci vitae cursus commodo. Suspendisse
        potenti. Vestibulum maximus pulvinar purus at vehicula. Duis quis massa
        eu massa tincidunt luctus vitae sit amet turpis. Duis aliquam dolor
        lacinia ex eleifend ullamcorper. Curabitur sed accumsan neque, in
        vestibulum odio. Integer gravida mi nibh, id congue libero pretium nec.
        Curabitur dictum enim eget felis pretium vulputate. Quisque lectus quam,
        congue eu lacus
      </Text>
      <Flex marginLeft="16">
        <Flex flex="1"></Flex>
        <Grid paddingY="8" height="300px" width="420px">
          <Input placeholder="Nome" />
          <Input placeholder="Telefona para contato" />
          <Textarea placeholder="Em que podemos ajudar?" resize="none" />
          <Button
            backgroundColor="green.500"
            color="white"
            _hover={{ backgroundColor: 'green.400' }}
            marginTop="2"
          >
            Enviar
          </Button>
        </Grid>
        <Flex flex="1"></Flex>
      </Flex>
    </Flex>
  )
}
