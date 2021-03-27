// eslint-disable-next-line no-use-before-define

import { Box, Flex, Heading, List, ListItem, Text } from '@chakra-ui/core'

import ActionButton from '../components/ActionButton'
import ContentSection from '../components/ContentSection'
import ServiceItem from '../components/ServiceItem'
import TestimonialBox from '../components/TestimonialBox'

export default function Home(): JSX.Element {
  return (
    <Flex direction="column" width="100%">
      <ContentSection>
        <Heading marginBottom={6} fontSize={['6xl', '4xl']}>
          Outsourcing em Tecnologia da Informação
        </Heading>
        <Heading fontSize={['2xl', 'xl']} fontWeight="normal" marginBottom={6}>
          Somos uma empresa que transforma o ambiente de tecnologia em
          ferramenta de potencialização de resultados dos nossos clientes
        </Heading>
        <ActionButton
          backgroundColor="yellow.500"
          color="gray.800"
          destination="http://www.google.com.br"
          fontSize={['xl', 'md']}
          text="Agende uma consultoria"
        />
      </ContentSection>
      <ContentSection
        alignment="center"
        backgroundColor="white.500"
        color="black"
        direction={['column', 'row']}
      >
        <Heading
          paddingLeft={[0, 6]}
          marginRight={6}
          marginBottom={[6, 0]}
          fontSize={['6xl', '4xl']}
          textAlign={['center', 'right']}
          width={['100%', '2xl']}
        >
          Como fazemos isso?
        </Heading>
        <Text
          textAlign={['center', 'left']}
          fontSize={['2xl', 'xl']}
          marginTop={2}
        >
          Reduzindo ao máximo os problemas com análise de infraestrutura,
          padronização de hardware e software, e monitoramento em tempo real dos
          recursos físicos dos equipamentos
        </Text>
      </ContentSection>
      <ContentSection
        alignment="center"
        backgroundColor="gray.100"
        color="black"
        direction="column"
      >
        <Heading marginBottom={6} fontSize={['6xl', '4xl']}>
          O que oferecemos
        </Heading>
        <Heading fontSize={['2xl', 'xl']} fontWeight="normal">
          Somos uma empresa que transforma o ambiente de tecnologia em uma
          ferramenta de potencialização de resultados dos nossos clientes
        </Heading>
        <Flex>
          <ServiceItem title="Monitoramento " />
          <ServiceItem title="Manutenção Preventiva " />
          <ServiceItem title="Manutenção Corretiva " />
          <ServiceItem title="Serviços Gerenciados " />
          <ServiceItem title="Consultoria em TI " />
          <ServiceItem title="VPN " />
        </Flex>
      </ContentSection>
      <ContentSection
        alignment="center"
        backgroundColor="yellow.500"
        color="gray.800"
        direction="column"
      >
        <Heading marginBottom={[8, 12]} fontSize={['6xl', '4xl']}>
          O que nossos clientes falam sobre nós?
        </Heading>
        <Box borderRadius="lg" textAlign="center" alignItems="center">
          <TestimonialBox
            testimonialAuthor="Marilene Brusco"
            testimonialCompany="Azevedo Advogados"
            testimonialText="Profissionais competentes e Confiáveis, ótimo atendimento aos clientes"
          />
          <Box height={8} />
          <TestimonialBox
            testimonialAuthor="Lúcia Rockembach"
            testimonialCompany="Vidal Falcão Advocacia Empresarial"
            testimonialText="Sinônimo de confiança, presteza, muita discrição no ambiente de trabalho e o atendimento personalizado"
            alignment="right"
          />
          <Box height={8} />
          <TestimonialBox
            testimonialAuthor="Yamara Eichner"
            testimonialCompany="Naturoils"
            testimonialText="Atendimento personalizado, suporte rápido e eficiente, discrição e confiabilidade em projetos customizados"
          />
        </Box>
      </ContentSection>
    </Flex>
  )
}
