Vulnerable XSS Web Application
==============================
### Esta es una pequeña aplicación web Node.js que es intencionalmente vulnerable cross-site scripting


Fue creado para demostrar:

* Cómo se pueden omitir el filtrado y bypassed
* Vectores de ataque alternativos 

Prerequisites
-------------
* [Node.js (8.14 or higher)](https://nodejs.org/en/)
* [Yarn](https://yarnpkg.com/lang/en/) (or equivalent package manager)

### Endpoints Vulnerable
| Endpoints  | Description                                                              |
| ---------- | ------------------------------------------------------------------------ |
| `/`        | Reflects the `xss` parameter without modification                        |
| `/replace` | Replaces any `script` tags in  the `xss` parameter with `NAUGHTY_HACKER` |
| `/remove`  | Removes any `script` tags or `onerror` attributes in the `xss` parameter |

### Endpoint Utiles
| Endpoints     | Description                                                                  |
| ------------- | ---------------------------------------------------------------------------- |
| `/keylogger`  | Logs the `data` form field from the request in the server console            |
| `/screenshot` | Decodes the base64 encoded image from the `data` field into `screenshot.png` |

### Recursos Estaticos
| Endpoints  | Description                                                                        |
| ---------- | ---------------------------------------------------------------------------------- |
| /media/*   | Various multimedia files to test vectors using the `img`, `audio` and `video` tags |
| /scripts/* | Scripts used to initialise attacks with larger payloads (e.g. keylogging)          |

### Ejemplos
```
http://localhost:3000/?xss=<audio oncanplay=alert(1) src="/media/hack-the-planet.mp3" />
http://localhost:3000/?xss=<video autoplay=true onended=alert(1) src="/media/hack-the-planet.mp4" />
http://localhost:3000/remove?xss=<img src=x ononerrorerror=alert(1) />
http://localhost:3000/replace?xss=<script <script>>alert(1)</script <script>>
```

### Para el Despliegue pueden usar:

- AWS
- GCP
- AZURE
- Linode
- Digital Ocean
- Heroku (Free)

### Documentación y mejoras
