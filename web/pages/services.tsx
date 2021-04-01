import ContentSection from '../components/ContentSection'
import ServiceSection from '../components/ServiceSection'

export default function Services(): JSX.Element {
  return (
    <ContentSection
      alignment="left"
      backgroundColor="white"
      color="black"
      title="O que oferecemos?"
    >
      <ServiceSection
        backgroundImageSrc="https://images.ctfassets.net/jt1652yryijm/7CEMbSWcNEwsufWk8mB4rv/9668f922972a502119edd4f5ff4449ee/pexels-eli-palma-castan__eda-6663191.jpg"
        name="Reparo"
        description="
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur
        fermentum lorem vitae lacus congue, id pretium orci pretium. Cras at
        congue justo. Morbi laoreet orci vitae cursus commodo. Suspendisse
        potenti. Vestibulum maximus pulvinar purus at vehicula. Duis quis massa
        eu massa tincidunt luctus vitae sit amet turpis. Duis aliquam dolor
        lacinia ex eleifend ullamcorper. Curabitur sed accumsan neque, in
        vestibulum odio. Integer gravida mi nibh, id congue libero pretium nec.
        Curabitur dictum enim eget felis pretium vulputate. Quisque lectus quam,
        congue eu lacus"
      ></ServiceSection>

      <ServiceSection
        backgroundImageSrc="https://images.ctfassets.net/jt1652yryijm/3lZgCabUDpprlDpEQcb2ms/6f8e7c9863fbfa978c1b0632763133c7/pexels-luis-gomes-546819.jpg"
        name="Soluções em software"
        description="
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur
        fermentum lorem vitae lacus congue, id pretium orci pretium. Cras at
        congue justo. Morbi laoreet orci vitae cursus commodo. Suspendisse
        potenti. Vestibulum maximus pulvinar purus at vehicula. Duis quis massa
        eu massa tincidunt luctus vitae sit amet turpis. Duis aliquam dolor
        lacinia ex eleifend ullamcorper. Curabitur sed accumsan neque, in
        vestibulum odio. Integer gravida mi nibh, id congue libero pretium nec.
        Curabitur dictum enim eget felis pretium vulputate. Quisque lectus quam,
        congue eu lacus"
      ></ServiceSection>
    </ContentSection>
  )
}
