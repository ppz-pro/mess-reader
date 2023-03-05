import React from 'react'
import { createRoot } from 'react-dom/client'

import './index.styl'
import '../page/home/index.coffee'
import '../page/read/index.coffee'
import { Router } from '../../lib/mess-router/index.coffee'

createRoot(document.getElementById('app')).render(<Router />)