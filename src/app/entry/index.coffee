import React from 'react'
import { createRoot } from 'react-dom/client'

import './index.styl'
import Read from '../page/read/index.coffee'

createRoot(document.getElementById('app')).render(<Read />)