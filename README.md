# 🏨 Sistema de Gestión Hotelera - Decameron

Proyecto desarrollado como prueba técnica Full Stack utilizando:

- Laravel 12 (API REST)
- PostgreSQL
- React.js
- TailwindCSS

El sistema permite la administración de hoteles, habitaciones y acomodaciones, aplicando reglas de negocio específicas para la gestión de capacidad hotelera.

---

# 🚀 Tecnologías Utilizadas

## Backend
- PHP 8.2+
- Laravel 12
- PostgreSQL
- Laravel Sanctum

## Frontend
- React.js
- Vite
- TailwindCSS
- Axios

## Herramientas
- Git & GitHub
- pgAdmin
- Postman

---

# 📋 Requisitos del Sistema

Antes de ejecutar el proyecto asegúrese de tener instalado:

- PHP >= 8.2
- Composer
- Node.js >= 20
- npm
- PostgreSQL
- Git

---

# 📁 Estructura del Proyecto

```bash
project/
│
├── backend/     # API Laravel
│
└── frontend/    # Aplicación React
```

---

# ⚙️ Instalación del Backend (Laravel)

## 1. Clonar el repositorio

```bash
git clone <URL_DEL_REPOSITORIO>
cd backend
```

---

## 2. Instalar dependencias

```bash
composer install
```

---

## 3. Configurar variables de entorno

Crear archivo `.env`

```bash
cp .env.example .env
```

---

## 4. Configurar conexión PostgreSQL

Editar el archivo `.env`

```env
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=decameron_db
DB_USERNAME=postgres
DB_PASSWORD=123456789
```

---

## 5. Generar clave de aplicación

```bash
php artisan key:generate
```

---

## 6. Ejecutar migraciones y seeders

```bash
php artisan migrate --seed
```

---

## 7. Ejecutar servidor backend

```bash
php artisan serve
```

La API estará disponible en:

```bash
http://127.0.0.1:8000
```

---

# ⚛️ Instalación del Frontend (React)

## 1. Entrar a la carpeta frontend

```bash
cd frontend
```

---

## 2. Instalar dependencias

```bash
npm install
```

---

## 3. Ejecutar proyecto React

```bash
npm run dev
```

Frontend disponible en:

```bash
http://localhost:5173
```

---

# 🏗️ Arquitectura de Base de Datos

El sistema implementa un modelo relacional normalizado utilizando PostgreSQL.

## Tablas principales

- hoteles
- departamentos
- ciudades
- tipos_habitacion
- acomodaciones
- tipo_habitacion_acomodacion
- hotel_habitaciones

### 📂 Documentación y Base de Datos
En la carpeta `/doc` del proyecto encontrará los recursos adicionales:
- **Diagrama UML:** [Visualizar Diagrama](doc/database_diagram.png).
- **Backup SQL:** Archivo `database_backup.sql` para restauración inmediata.

---

# 📌 Reglas de Negocio Implementadas

## ✅ Validación de capacidad

La suma total de habitaciones configuradas no puede superar el número máximo de habitaciones del hotel.

---

## ✅ Combinaciones únicas

No se permite repetir la misma combinación:

Tipo Habitación + Acomodación

para el mismo hotel.

---

## ✅ Validación de acomodaciones permitidas

El sistema restringe las acomodaciones según el tipo de habitación:

| Tipo Habitación | Acomodaciones Permitidas |
|---|---|
| ESTANDAR | SENCILLA, DOBLE |
| JUNIOR | TRIPLE, CUADRUPLE |
| SUITE | SENCILLA, DOBLE, TRIPLE |

---

## ✅ NIT único

No se permite registrar hoteles con NIT duplicado.

---

# 🔗 Endpoints Principales

## Autenticación

| Método | Endpoint |
|---|---|
| POST | /api/login |

---

## Hoteles

| Método | Endpoint |
|---|---|
| GET | /api/hoteles |
| POST | /api/hoteles |
| PUT | /api/hoteles/{id} |
| DELETE | /api/hoteles/{id} |

---

## Habitaciones por Hotel

| Método | Endpoint |
|---|---|
| GET | /api/hoteles/{id}/habitaciones |
| POST | /api/hoteles/{id}/habitaciones |

---

## Catálogos

| Método | Endpoint |
|---|---|
| GET | /api/departamentos |
| GET | /api/ciudades |
| GET | /api/tipos-habitacion |
| GET | /api/acomodaciones |

---

# 🔐 Credenciales de Prueba

Usuario: admin@decameron.com
Contraseña: Admin123

---

# 🧪 Pruebas

Para ejecutar pruebas unitarias:

```bash
php artisan test
```

---

# 📱 Diseño Responsive

El sistema fue diseñado bajo enfoque responsive para garantizar compatibilidad en:

- Desktop
- Laptop
- Tablet

---

# 🔄 Integración Continua

El proyecto implementa integración continua mediante GitHub Actions para:

- instalación de dependencias
- ejecución de pruebas
- validación automática

---

# 📸 Diseño del Sistema

## Login

Sistema de autenticación moderno y responsive.

## Panel Administrativo

- Dashboard
- Gestión de Hoteles
- Configuración de Habitaciones
- Catálogos maestros

---

# 🛠️ Solución de Problemas

## Error PostgreSQL Driver

Habilitar en `php.ini`

```ini
extension=pgsql
extension=pdo_pgsql
```

---

## Limpiar caché Laravel

```bash
php artisan optimize:clear
```

---

# 👨‍💻 Autor

Desarrollado por:
Dilar Jose Pardo Burgos

Prueba Técnica Full Stack - Decameron
