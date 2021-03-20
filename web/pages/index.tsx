// eslint-disable-next-line no-use-before-define

import {
  Avatar,
  Box,
  Flex,
  Heading,
  List,
  ListItem,
  Text
} from '@chakra-ui/core'
import ActionButton from '../components/ActionButton'
import Utils from '../utils/components_utils'

export default function Home(): JSX.Element {
  const paddingX = [4, '20%']
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
        paddingY={Utils.defaultPaddingX}
        paddingX={paddingX}
        textAlign="center"
        alignItems="center"
      >
        <Heading marginBottom={6} fontSize={['6xl', '4xl']}>
          {' '}
          Gestão de Tecnologia da Informação
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
      </Flex>
      <Flex
        backgroundColor="white.500"
        color="black"
        direction={['column', 'row']}
        paddingY={paddingY}
        paddingX={paddingX}
        textAlign="center"
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
      </Flex>
      <Flex
        direction="column"
        backgroundColor="gray.100"
        color="black"
        paddingY={paddingY}
        paddingX={paddingX}
        textAlign="center"
      >
        <Heading marginBottom={6} fontSize={['6xl', '4xl']}>
          O que oferecemos
        </Heading>
        <Heading fontSize={['2xl', 'xl']} fontWeight="normal">
          A Infoassist Tecnologia é uma empresa que transforma o ambiente de
          tecnologia em ferramenta de potencialização de resultados dos nossos
          clientes.
        </Heading>
      </Flex>
      <Flex
        direction="column"
        backgroundColor="yellow.500"
        color="gray.800"
        paddingY={[2, '10%']}
        paddingX={[2, '10%']}
        textAlign="center"
        alignItems="center"
      >
        <Heading marginBottom={[8, 12]} fontSize={['6xl', '4xl']}>
          O que nossos clientes falam sobre nós?
        </Heading>
        <Box
          paddingY={6}
          paddingX={6}
          borderRadius="lg"
          textAlign="center"
          alignItems="center"
        >
          <Flex>
            <Flex flex={['12', '2']}>
              <Avatar
                name=""
                src="https://thispersondoesnotexist.com/image"
                size="xl"
                marginTop={8}
              />
              <Box
                backgroundColor="blue.500"
                borderRadius="lg"
                color="white"
                paddingX={paddingTop}
                paddingY={paddingTop}
                marginLeft={6}
              >
                <List spacing={listSpacing} alignItems={alignmentStatement}>
                  <ListItem>
                    <Heading
                      fontSize={['2xl', headingFontSize]}
                      textAlign="left"
                    >
                      Marilene Brusco
                    </Heading>
                  </ListItem>
                  <ListItem>
                    <Heading
                      fontSize={['2xl', headingFontSize]}
                      fontWeight="thin"
                      textAlign="left"
                    >
                      Azevedo Advogados
                    </Heading>
                  </ListItem>

                  <ListItem>
                    <Text
                      fontSize={['2xl', 'xl']}
                      fontWeight="normal"
                      textAlign="left"
                    >
                      Profissionais competentes e Confiáveis, ótimo atendimento
                      aos clientes
                    </Text>
                  </ListItem>
                </List>
              </Box>
            </Flex>
            <Flex flex="1"></Flex>
          </Flex>
          <Flex>
            <Flex flex="1"></Flex>
            <Flex marginTop={10} flex={['12', '2']}>
              <Box
                backgroundColor="blue.500"
                borderRadius="lg"
                color="white"
                paddingX={paddingTop}
                paddingY={paddingTop}
                marginRight={6}
              >
                <List spacing={listSpacing} alignItems={alignmentStatement}>
                  <ListItem>
                    <Heading
                      fontSize={['2xl', headingFontSize]}
                      textAlign="left"
                    >
                      Lúcia Rockembach
                    </Heading>
                  </ListItem>
                  <ListItem>
                    <Heading
                      fontSize={['2xl', headingFontSize]}
                      fontWeight="thin"
                      textAlign="left"
                    >
                      Vidal Falcão Advocacia Empresarial
                    </Heading>
                  </ListItem>

                  <ListItem>
                    <Text
                      fontSize={['2xl', 'xl']}
                      fontWeight="normal"
                      textAlign="left"
                    >
                      Sinônimo de confiança, presteza, muita discrição no
                      ambiente de trabalho e o atendimento personalizado
                    </Text>
                  </ListItem>
                </List>
              </Box>
              <Avatar
                name=""
                src="https://thispersondoesnotexist.com/image"
                size="xl"
                marginTop={8}
              />
            </Flex>
          </Flex>

          <Flex>
            <Flex marginTop={10} flex={['12', '2']}>
              <Avatar
                name=""
                src="https://thispersondoesnotexist.com/image"
                size="xl"
                marginTop={8}
              />
              <Box
                backgroundColor="blue.500"
                borderRadius="lg"
                color="white"
                paddingX={paddingTop}
                paddingY={paddingTop}
                marginLeft={6}
              >
                <List spacing={listSpacing} alignItems={alignmentStatement}>
                  <ListItem>
                    <Heading
                      fontSize={['2xl', headingFontSize]}
                      textAlign="left"
                    >
                      Yamara Eichner
                    </Heading>
                  </ListItem>
                  <ListItem>
                    <Heading
                      fontSize={['2xl', headingFontSize]}
                      fontWeight="thin"
                      textAlign="left"
                    >
                      Naturoils
                    </Heading>
                  </ListItem>

                  <ListItem>
                    <Text
                      fontSize={['2xl', 'xl']}
                      fontWeight="normal"
                      textAlign="left"
                    >
                      Atendimento personalizado, suporte rápido e eficiente,
                      discrição e confiabilidade em projetos customizados
                    </Text>
                  </ListItem>
                </List>
              </Box>
            </Flex>

            <Flex flex="1"></Flex>
          </Flex>
        </Box>
      </Flex>
    </Flex>
  )
}
