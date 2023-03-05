import React from 'react'
import { createRoot } from 'react-dom/client'

import './index.styl'
import '../page/home/index.coffee'
import '../page/read/index.coffee'
import { Router } from '../../lib/mess-router/index.coffee'
import packageInfo from '../../../package.json'

console.log('version', packageInfo.version)
createRoot(document.getElementById('app')).render(<Router />)