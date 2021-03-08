// eslint-disable-next-line no-use-before-define

import { Text } from '@chakra-ui/core'
export default function Home(): JSX.Element {
  return (
    <Text textAlign="justify" paddingY="8" lineHeight="2">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur
      fermentum lorem vitae lacus congue, id pretium orci pretium. Cras at
      congue justo. Morbi laoreet orci vitae cursus commodo. Suspendisse
      potenti. Vestibulum maximus pulvinar purus at vehicula. Duis quis massa eu
      massa tincidunt luctus vitae sit amet turpis. Duis aliquam dolor lacinia
      ex eleifend ullamcorper. Curabitur sed accumsan neque, in vestibulum odio.
      Integer gravida mi nibh, id congue libero pretium nec. Curabitur dictum
      enim eget felis pretium vulputate. Quisque lectus quam, congue eu lacus
    </Text>
  )
}

// export const getServerSideProps = async () => {
//   // eslint-disable-next-line @typescript-eslint/no-var-requires
//   const client = require('contentful').createClient({
//     space: 'jt1652yryijm',
//     accessToken: '226bwigj7qger_NzrcHqjbgKNtHocGoZpMTkFkPmfco'
//   })
//   const data = await client.getEntries({ content_type: 'post' })
//   return {
//     props: {
//       posts: data.items
//     }
//   }
// }
