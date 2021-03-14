// eslint-disable-next-line no-use-before-define

import { Flex, Text } from '@chakra-ui/core'
export default function Home(): JSX.Element {
  return (
    <Flex direction="column">
      <Flex
        backgroundImage="url(https://images.ctfassets.net/jt1652yryijm/33tQ5s0PajQeqgsShlGJZu/2bd705f3d06d8998e00b6be7a49f6b8b/image-1.jpg)"
        width="100%"
        height="180px"
        backgroundPosition="center"
        backgroundRepeat="no-repeat"
        backgroundSize="100%"
      ></Flex>
      <Text textAlign="justify" paddingY="8" lineHeight="2" paddingX="10%">
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
    </Flex>
  )
}
