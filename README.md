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
* [Heroku](https://id.heroku.com/)

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

### Configurando Heroku

Crear cuenta, logearse y descargar heroku cli  https://id.heroku.com/

Luego en la terminal logearse

```
 heroku login
```
Login en heroku container
```
heroku container:login
```
Crear target de la aplicacion
```
heroku create <YOUR_APP_NAME>
```
Conectar git local en remote heroku 
```
heroku git:remote -a <YOUR_APP_NAME>
```
Build la imagen y push el container en Registry Heroku
```
heroku container:push web
```
Ejecute la image en la aplicacion
```
heroku container:release web
```
Verificar aplicacion node en el navegador
```
heroku open
```
Verificar Logs
```
heroku logs --tail
```

### Habilitar Api Key en Heroku para integrar con Github Actions

```
Desde la plataforma Heroku ir a -> Account setting y buscar ApliKey
```

