import { Flex, Text } from '@chakra-ui/core'

export default function Services(): JSX.Element {
  return (
    <Flex direction="column" alignItems="top">
      <Flex direction="column">
        <Flex
          backgroundImage="url(https://images.ctfassets.net/jt1652yryijm/7CEMbSWcNEwsufWk8mB4rv/9668f922972a502119edd4f5ff4449ee/pexels-eli-palma-castan__eda-6663191.jpg)"
          height="200px"
          width="100vw"
          backgroundPosition="center"
          backgroundRepeat="no-repeat"
          backgroundSize="100%"
          overflow="hidden"
        ></Flex>
        <Flex
          color="white"
          backgroundColor="blackAlpha.800"
          fontSize="4xl"
          height="90px"
          marginTop="-90px"
          paddingLeft="10%"
          paddingTop="18px"
          width="100vw"
        >
          Reparo
        </Flex>
      </Flex>
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
      <Flex direction="column">
        <Flex
          backgroundImage="url(https://images.ctfassets.net/jt1652yryijm/3lZgCabUDpprlDpEQcb2ms/6f8e7c9863fbfa978c1b0632763133c7/pexels-luis-gomes-546819.jpg)"
          height="200px"
          width="100vw"
          backgroundPosition="center"
          backgroundRepeat="no-repeat"
          backgroundSize="100%"
        ></Flex>

        <Flex
          color="white"
          backgroundColor="blackAlpha.800"
          fontSize="4xl"
          height="90px"
          marginTop="-90px"
          paddingLeft="10%"
          paddingTop="18px"
          width="100vw"
        >
          Soluções de software
        </Flex>
      </Flex>
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
