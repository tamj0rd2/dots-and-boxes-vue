import express from 'express'
import { Builder, Nuxt } from 'nuxt'
import config from '../../nuxt.config'

async function start() {
  const app = express()
  const isDev = process.env.NODE_ENV !== 'production'
  const port = process.env.PORT ?? 3000

  const nuxt = new Nuxt(config)
  app.use(nuxt.render)

  // Build only in dev mode with hot-reloading
  if (isDev) await new Builder(nuxt).build()

  // Listen the server
  app.listen(port, () => {
    // eslint-disable-next-line no-console
    console.log(`Server listening on http://localhost:${port}`)
  })
}

start().catch((err) => {
  // eslint-disable-next-line no-console
  console.log('error', err)
  process.exit(1)
})
