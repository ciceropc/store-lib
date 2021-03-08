import ThemeContainer from '../contexts/theme/ThemeContainer'

function App({ Component, pageProps }) {
  return (
    <ThemeContainer>
      <Component {...pageProps} />
    </ThemeContainer>
  )
}

export default App
