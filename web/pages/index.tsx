// eslint-disable-next-line no-use-before-define

import {
  Avatar,
  Box,
  Flex,
  Heading,
  List,
  ListItem,
  Text
} from '@chakra-ui/react'
import ActionButton from '../components/ActionButton'
export default function Home(): JSX.Element {
  const paddingX = '20%'
  const paddingY = '8%'
  const alignmentStatement = 'center'
  const headingFontSize = 'md'
  const listSpacing = '1'
  const paddingTop = '6'
  return (
    <Flex direction="column" width="100%">
      <Flex
        direction="column"
        backgroundColor="blue.500"
        color="white"
        paddingY={[8, paddingY]}
        paddingX={[2, paddingX]}
        textAlign="center"
        alignItems="center"
      >
        <Heading marginBottom={6}> Gestão de Tecnologia da Informação</Heading>
        <Heading fontSize="xl" fontWeight="normal" marginBottom={6}>
          Somos uma empresa que transforma o ambiente de tecnologia em
          ferramenta de potencialização de resultados dos nossos clientes
        </Heading>
        <ActionButton
          backgroundColor="yellow.500"
          color="gray.800"
          destination="http://www.google.com.br"
          text="Agende uma consultoria"
        />
      </Flex>
      <Flex
        backgroundColor="white.500"
        color="black"
        paddingY={paddingY}
        paddingX={paddingX}
        textAlign="center"
      >
        <Heading paddingLeft={6} marginRight={6} textAlign="right" width="2xl">
          Como fazemos isso?
        </Heading>
        <Text textAlign="left" fontSize="xl" marginTop={2}>
          Reduzindo ao máximo os problemas com análise de infraestrutura,
          padronização de hardware e software, e monitoramento em tempo real dos
          recursos físicos dos equipamentos
        </Text>
      </Flex>
      <Flex
        direction="column"
        backgroundColor="gray.100"
        color="black"
        paddingY={paddingY}
        paddingX={paddingX}
        textAlign="center"
      >
        <Heading marginBottom={6}> O que oferecemos</Heading>
        <Heading fontSize="xl" fontWeight="normal">
          A Infoassist Tecnologia é uma empresa que transforma o ambiente de
          tecnologia em ferramenta de potencialização de resultados dos nossos
          clientes.
        </Heading>
      </Flex>
      <Flex
        direction="column"
        backgroundColor="blue.500"
        color="white"
        paddingY={paddingY}
        paddingX={paddingX}
        textAlign="center"
      >
        <Heading marginBottom={12}>
          O que nossos clientes falam sobre nós?
        </Heading>
        <Flex width="2xl" marginLeft="-10%">
          <Avatar
            name=""
            src="https://thispersondoesnotexist.com/image"
            size="2xl"
          />
          <Box
            backgroundColor="gray.50"
            borderRadius="lg"
            color="black"
            paddingX={paddingTop}
            paddingY={paddingTop}
            marginLeft={6}
          >
            <List spacing={listSpacing} alignItems={alignmentStatement}>
              <ListItem>
                <Heading size={headingFontSize} textAlign="left">
                  Marilene Brusco
                </Heading>
              </ListItem>
              <ListItem>
                <Heading
                  size={headingFontSize}
                  fontWeight="thin"
                  textAlign="left"
                >
                  Azevedo Advogados
                </Heading>
              </ListItem>

              <ListItem>
                <Text fontSize="xl" fontWeight="normal" textAlign="left">
                  Profissionais competentes e Confiáveis, ótimo atendimento aos
                  clientes
                </Text>
              </ListItem>
            </List>
          </Box>{' '}
        </Flex>
        <Flex marginTop={10} width="3xl" marginLeft="25%">
          <Box
            backgroundColor="gray.50"
            borderRadius="lg"
            color="black"
            paddingX={paddingTop}
            paddingY={paddingTop}
            marginRight={6}
          >
            <List spacing={listSpacing} alignItems={alignmentStatement}>
              <ListItem>
                <Heading size={headingFontSize} textAlign="left">
                  Lúcia Rockembach
                </Heading>
              </ListItem>
              <ListItem>
                <Heading
                  size={headingFontSize}
                  fontWeight="thin"
                  textAlign="left"
                >
                  Vidal Falcão Advocacia Empresarial
                </Heading>
              </ListItem>

              <ListItem>
                <Text fontSize="xl" fontWeight="normal" textAlign="left">
                  Sinônimo de confiança, presteza, muita discrição no ambiente
                  de trabalho e o atendimento personalizado
                </Text>
              </ListItem>
            </List>
          </Box>
          <Avatar
            name=""
            src="https://thispersondoesnotexist.com/image"
            size="2xl"
          />
        </Flex>
        <Flex marginTop={10} width="3xl" marginLeft="-10%">
          <Avatar
            name=""
            src="https://thispersondoesnotexist.com/image"
            size="2xl"
          />
          <Box
            backgroundColor="gray.50"
            borderRadius="lg"
            color="black"
            paddingX={paddingTop}
            paddingY={paddingTop}
            marginLeft={6}
          >
            <List spacing={listSpacing} alignItems={alignmentStatement}>
              <ListItem>
                <Heading size={headingFontSize} textAlign="left">
                  Yamara Eichner
                </Heading>
              </ListItem>
              <ListItem>
                <Heading
                  size={headingFontSize}
                  fontWeight="thin"
                  textAlign="left"
                >
                  Naturoils
                </Heading>
              </ListItem>

              <ListItem>
                <Text fontSize="xl" fontWeight="normal" textAlign="left">
                  Atendimento personalizado, suporte rápido e eficiente,
                  discrição e confiabilidade em projetos customizados
                </Text>
              </ListItem>
            </List>
          </Box>{' '}
        </Flex>
      </Flex>
    </Flex>
  )
}
