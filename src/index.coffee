import { createRoot } from 'react-dom/client'
import { E } from '@ppzp/utils.rc'
import './style/global.styl'

createRoot document.getElementById 'react_app_root'
.render E 'haha'
