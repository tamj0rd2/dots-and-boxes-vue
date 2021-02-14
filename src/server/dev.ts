import { spawn, ChildProcess } from 'child_process'
import TscWatchClient from 'tsc-watch/client'

const watch = new TscWatchClient()
let child: ChildProcess

watch.on('success', () => {
  if (child) child.kill()
  child = spawn('npm', ['start'], { stdio: 'inherit' })
})

watch.on('compile_errors', () => {
  if (child) child.kill()
})

watch.start('-b', './src/server/tsconfig.json')
