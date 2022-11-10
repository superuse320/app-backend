-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2022 a las 07:56:53
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aplicacion`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_noticias` ()   SELECT noticias.id,title,description,categorias.name as category ,CONCAT('/app-backend/storage/app/public/imagen/',image) image from noticias inner JOIN categorias on noticias.category_id=categorias.id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_publicacion_noticia` ()   SELECT categorias.name as Categoria, noticias.title as Noticia ,noticias.description as Descripcion ,group_CONCAT(estudiantes.name,': ',publicaciones.comment SEPARATOR ';') as 'comentarios de estudiantes', COUNT(CASE publicaciones.like WHEN 0 THEN NULL ELSE publicaciones.like END) as reacciones FROM `publicaciones` inner join noticias on publicaciones.noticia_id=noticias.id INNER join estudiantes on publicaciones.estudiante_id=estudiantes.id INNER JOIN categorias on noticias.category_id=categorias.id GROUP BY noticias.id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_jobs` int(11) NOT NULL,
  `entry_time` time NOT NULL,
  `exit_time` time NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionestrabajos`
--

CREATE TABLE `asignacionestrabajos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trabajador_id` bigint(20) UNSIGNED NOT NULL,
  `puestostrabajo_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'DEPORTES', NULL, NULL),
(2, 'TRABAJOS', NULL, NULL),
(3, 'OTRAS ACTIVIDADES', NULL, NULL),
(4, 'CLASES', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargados`
--

CREATE TABLE `encargados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `name`, `student_card`, `email`, `created_at`, `updated_at`) VALUES
(1, 'JOSE ENRIQUE', '12312312', 'jose@gmail.com', '2022-11-10 10:10:34', '2022-11-10 10:10:34'),
(2, 'juan jose', '123123', 'juan@gmail.com', '2022-11-10 10:10:34', '2022-11-10 10:10:34'),
(3, 'jhon catacora', '123123123', 'jhon@gmail.com', '2022-11-10 10:11:29', '2022-11-10 10:11:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(48, '2014_10_12_000000_create_users_table', 1),
(49, '2014_10_12_100000_create_password_resets_table', 1),
(50, '2019_08_19_000000_create_failed_jobs_table', 1),
(51, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(52, '2022_09_06_103807_create_blogs_table', 1),
(53, '2022_09_10_172005_create_permission_tables', 1),
(54, '2022_09_10_174735_create_roles', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3),
(1, 'App\\Models\\User', 4),
(1, 'App\\Models\\User', 5),
(1, 'App\\Models\\User', 6),
(1, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `title`, `description`, `category_id`, `image`, `created_at`, `updated_at`) VALUES
(3, 'CLASES POR ZOOM', 'Clases online mediante Zoom. Zoom para Clases Virtuales (3°', 4, '213', '2022-11-10 06:25:48', '2022-11-10 06:25:48'),
(4, 'CLASES POR MEET ', 'Conecta a tu comunidad educativa con una solución de videollamadas para dictar clases, organizar reuniones de padres y profesores, ofrecer cursos de ...', 4, '1123', '2022-11-08 06:25:48', '2022-11-10 06:25:48'),
(5, 'DEPORTES UAB', 'Descubre la tradición en investigación, formación, apoyo a los deportistas y transferencia en deporte de la UAB, con una destacada posición en los rankings ...\r\n', 1, '123', '2022-11-10 06:26:46', '2022-11-10 06:26:46'),
(6, 'juegos uab', 'mmmmmmmmm', 3, '4Fcsv0iSZiz1xnxH44I0FWfLPeOlI2hEzKZxUCR2.jpg', '2022-11-10 10:45:16', '2022-11-10 10:45:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin.home', 'web', '2022-09-16 18:35:41', '2022-09-16 18:35:41'),
(2, 'Usuario.home', 'web', '2022-09-16 18:35:43', '2022-09-16 18:35:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '9146a61515d0d7b5180208f25c0cdcca32ce8ea1544ef31b1f4fc854038276de', '[\"*\"]', NULL, NULL, '2022-09-16 18:41:53', '2022-09-16 18:41:53'),
(2, 'App\\Models\\User', 2, 'auth_token', 'c54b0e9edcf2621e3db7b299a18040f847568db5f54bc145748168cf4f44090c', '[\"*\"]', NULL, NULL, '2022-09-16 20:21:01', '2022-09-16 20:21:01'),
(3, 'App\\Models\\User', 2, 'auth_token', '1b4b55f667f37f9cd279b29ecb001e313169c72ae04e3cb19ba4c5a5659c9750', '[\"*\"]', NULL, NULL, '2022-09-16 20:21:26', '2022-09-16 20:21:26'),
(4, 'App\\Models\\User', 3, 'auth_token', 'b8324cadc7d2f1a49d1e6bb73fe2b9c2f9bd1f24e4c898a2b62f112f50834bae', '[\"*\"]', NULL, NULL, '2022-09-16 21:58:27', '2022-09-16 21:58:27'),
(5, 'App\\Models\\User', 3, 'auth_token', 'ec29eb1166db72a2a94a73a71bf1df8f42157534cd12b76097040e702451b1c2', '[\"*\"]', NULL, NULL, '2022-09-16 21:58:44', '2022-09-16 21:58:44'),
(6, 'App\\Models\\User', 3, 'auth_token', 'd09e52ad3ade1e98d6fcb0987435a8897755bd0c394a30a54c47dfd169257875', '[\"*\"]', NULL, NULL, '2022-10-05 18:14:08', '2022-10-05 18:14:08'),
(7, 'App\\Models\\User', 3, 'auth_token', 'b5602597d0a482445333d1900c8b277ca36999799cff13f0dd532134baf18636', '[\"*\"]', NULL, NULL, '2022-10-20 02:21:19', '2022-10-20 02:21:19'),
(8, 'App\\Models\\User', 3, 'auth_token', 'e6d100921cd799608682d9008db2bc49b7dfa6078e42107c9a9858077fd454c3', '[\"*\"]', NULL, NULL, '2022-10-20 02:22:20', '2022-10-20 02:22:20'),
(9, 'App\\Models\\User', 4, 'auth_token', 'bbbf723d8b56635144f90dd8226fbddf75ac330ca1b723381852d469c9d16db7', '[\"*\"]', NULL, NULL, '2022-10-20 02:47:53', '2022-10-20 02:47:53'),
(10, 'App\\Models\\User', 5, 'auth_token', '69762843e7078086b6b178a3bcc603a1c0247257168d74de5c4c4c5e5c674756', '[\"*\"]', NULL, NULL, '2022-10-27 02:23:25', '2022-10-27 02:23:25'),
(11, 'App\\Models\\User', 5, 'auth_token', '752fd1001a1f8c372f8b95bfc3654bfcee731d2385096225ab1d635f19034166', '[\"*\"]', NULL, NULL, '2022-10-27 02:25:30', '2022-10-27 02:25:30'),
(12, 'App\\Models\\User', 6, 'auth_token', 'd774121b0860478fb72f16ad99971727ef9aebc14e067aac4c1b82953ff68282', '[\"*\"]', NULL, NULL, '2022-10-27 02:48:33', '2022-10-27 02:48:33'),
(13, 'App\\Models\\User', 6, 'auth_token', '0a99ac9d0a414ec94cc73317024ed00532d3560edb75765b6cc1a2de3021bf2f', '[\"*\"]', NULL, NULL, '2022-10-27 02:50:13', '2022-10-27 02:50:13'),
(14, 'App\\Models\\User', 6, 'auth_token', 'ae45a982ba9eb138abb01155ab2929a916bf38c345a4a8234ef772d38282f8c0', '[\"*\"]', NULL, NULL, '2022-10-27 02:56:46', '2022-10-27 02:56:46'),
(15, 'App\\Models\\User', 6, 'auth_token', 'cbddedbdb6f175623eb269a23830a29bc11d7caf6f3e0a540c8e7a19576dd8b2', '[\"*\"]', NULL, NULL, '2022-10-27 02:57:05', '2022-10-27 02:57:05'),
(16, 'App\\Models\\User', 6, 'auth_token', '6204820b7ef3e8a7aa352a6d1c0d68a3bc1c553d7affb6f1e0080d892e69120a', '[\"*\"]', NULL, NULL, '2022-10-27 02:57:08', '2022-10-27 02:57:08'),
(17, 'App\\Models\\User', 6, 'auth_token', '6cd1c5fc781da8620f244f377b2983bbee30b0750a25992061d9a82acfa810dd', '[\"*\"]', NULL, NULL, '2022-10-27 02:57:09', '2022-10-27 02:57:09'),
(18, 'App\\Models\\User', 6, 'auth_token', '876994956b366a1194a2a5771a922e641b0eb7091897939455c700d94025c2a7', '[\"*\"]', NULL, NULL, '2022-10-27 02:57:23', '2022-10-27 02:57:23'),
(19, 'App\\Models\\User', 6, 'auth_token', 'e0c0cbfa5cfc809656900243d8f9d48ef5191ab583da09b63e33774f47f32457', '[\"*\"]', NULL, NULL, '2022-10-27 02:57:36', '2022-10-27 02:57:36'),
(20, 'App\\Models\\User', 7, 'auth_token', 'b4bd728f494f98aad9bb7dda2842ec635746b6b86783cf840ea3a750c33c2545', '[\"*\"]', NULL, NULL, '2022-10-27 03:04:01', '2022-10-27 03:04:01'),
(21, 'App\\Models\\User', 8, 'auth_token', '0a9c206a7f0543f31fceb3f3f012ccbc56fd8f1e190624ece7b1fcc778dfcd91', '[\"*\"]', NULL, NULL, '2022-10-27 03:08:25', '2022-10-27 03:08:25'),
(22, 'App\\Models\\User', 9, 'auth_token', '17b6e3db473cd45386e7fb7d83798cbf372b9f6e86be23caacd126632894fa6b', '[\"*\"]', NULL, NULL, '2022-10-27 03:12:59', '2022-10-27 03:12:59'),
(23, 'App\\Models\\User', 6, 'auth_token', 'da90b21dbadd69301732d9d38099659dd770267e212ef81fb66477e0f29bd9ce', '[\"*\"]', NULL, NULL, '2022-10-27 03:25:05', '2022-10-27 03:25:05'),
(24, 'App\\Models\\User', 10, 'auth_token', '587f0d890783daa9626ec32094dc73c43ce8bf554f23263767b9c303bafd65f3', '[\"*\"]', NULL, NULL, '2022-10-27 03:27:18', '2022-10-27 03:27:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noticia_id` bigint(20) UNSIGNED NOT NULL,
  `estudiante_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `like` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `noticia_id`, `estudiante_id`, `comment`, `like`, `created_at`, `updated_at`) VALUES
(1, 4, 3, 'CREO QUE ES LO MEJOR PASAR VIRTUALES', 1, '2022-11-10 06:27:24', '2022-11-10 06:27:24'),
(2, 4, 1, 'NO ME PARECE QUE ESTE BIEN ', 0, '2022-11-10 06:27:24', '2022-11-10 06:27:24'),
(3, 5, 3, 'GENIAL ME ENCANTA EL DEPORTE', 0, '2022-11-10 06:28:22', '2022-11-10 06:28:22'),
(4, 3, 3, 'nnnnnn', 1, '2022-11-10 10:42:32', '2022-11-10 10:42:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestostrabajos`
--

CREATE TABLE `puestostrabajos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workplace` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trabajo_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2022-09-16 18:35:40', '2022-09-16 18:35:40'),
(2, 'Usuario', 'web', '2022-09-16 18:35:41', '2022-09-16 18:35:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `encargado_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'josue', 'josue@gmail.com', NULL, '$2y$10$qh7zOAEtqgIQFH7t6WHNKOQCHTcRgFCfyglAu1sxCGErrwcpU8/ra', NULL, '2022-09-16 18:41:52', '2022-09-16 18:41:52'),
(2, 'obed', 'obed@gmail.com', NULL, '$2y$10$.T2i0P/YT2jIK24WpcKw0uPLEYUnyT2EXL/PK6LbQCtH.5bseLjGC', NULL, '2022-09-16 20:21:01', '2022-09-16 20:21:01'),
(3, 'kevin', 'kevin@gmail.com', NULL, '$2y$10$a/Ciqk.nyhyFNPnIqog2X.QoJHo.Xe9a2EFLBYiWGr6RNZPSxKwFa', NULL, '2022-09-16 21:58:27', '2022-09-16 21:58:27'),
(4, 'lola', 'lola@gmail.com', NULL, '$2y$10$WNoi2a4XaKSbGTl9e8g/QuvyGmGsDbkZm5JPkvJZc9JPJRTtJ.fU2', NULL, '2022-10-20 02:47:52', '2022-10-20 02:47:52'),
(5, 'don jose', 'jose@gmail.com', NULL, '$2y$10$YdWhIroDSXIOh31Ojan0s.iDL0I21HmOa4va9Efpta7Aa3fB.Tl2i', NULL, '2022-10-27 02:23:25', '2022-10-27 02:23:25'),
(6, 'jhon', 'jhoncastro@gmail.com', NULL, '$2y$10$tEn/9RWMigU7LTXg1I.2I.q84XU9X.ADX3A9G.bzzXVHfw40p9ryO', NULL, '2022-10-27 02:48:33', '2022-10-27 02:48:33'),
(7, 'jhon', 'jhonkartacora@gmail.com', NULL, '$2y$10$BYE/GGlDa.Zg/PvD9f4Rp.fdLrQclB9/KkGQxW9Hp/vF9D7wY854G', NULL, '2022-10-27 03:04:01', '2022-10-27 03:04:01'),
(8, 'jhon', 'jhonkartacoraaa@gmail.com', NULL, '$2y$10$b6cEU2jUyuny2nOfEle48uj34ugweKFEg9Syp2ic9lGu7mjtDmy6a', NULL, '2022-10-27 03:08:25', '2022-10-27 03:08:25'),
(9, 'jhon', 'jhonkartacoraaaaaaa@gmail.com', NULL, '$2y$10$t3txy/88rcrbpqNfy3hg9OXDdV8FC5CD8sJUjKMUoiGSmUCuI7bdq', NULL, '2022-10-27 03:12:59', '2022-10-27 03:12:59'),
(10, 'jhon', 'jhonkartaco@gmail.com', NULL, '$2y$10$dspWyRw0C//uB7rncmv8Du24axth.APcPUpXsP8tsWqTwE3hou4Za', NULL, '2022-10-27 03:27:18', '2022-10-27 03:27:18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `asignacionestrabajos`
--
ALTER TABLE `asignacionestrabajos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignacionestrabajos_trabajador_id_foreign` (`trabajador_id`),
  ADD KEY `asignacionestrabajos_puestostrabajo_id_foreign` (`puestostrabajo_id`);

--
-- Indices de la tabla `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `encargados`
--
ALTER TABLE `encargados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estudiantes_email_unique` (`email`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noticias_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publicaciones_noticia_id_foreign` (`noticia_id`),
  ADD KEY `publicaciones_estudiante_id_foreign` (`estudiante_id`);

--
-- Indices de la tabla `puestostrabajos`
--
ALTER TABLE `puestostrabajos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puestostrabajos_trabajo_id_foreign` (`trabajo_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trabajos_area_id_foreign` (`area_id`),
  ADD KEY `trabajos_encargado_id_foreign` (`encargado_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignacionestrabajos`
--
ALTER TABLE `asignacionestrabajos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `encargados`
--
ALTER TABLE `encargados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `puestostrabajos`
--
ALTER TABLE `puestostrabajos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacionestrabajos`
--
ALTER TABLE `asignacionestrabajos`
  ADD CONSTRAINT `asignacionestrabajos_puestostrabajo_id_foreign` FOREIGN KEY (`puestostrabajo_id`) REFERENCES `puestostrabajos` (`id`),
  ADD CONSTRAINT `asignacionestrabajos_trabajador_id_foreign` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`);

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `noticias_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `publicaciones_estudiante_id_foreign` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`),
  ADD CONSTRAINT `publicaciones_noticia_id_foreign` FOREIGN KEY (`noticia_id`) REFERENCES `noticias` (`id`);

--
-- Filtros para la tabla `puestostrabajos`
--
ALTER TABLE `puestostrabajos`
  ADD CONSTRAINT `puestostrabajos_trabajo_id_foreign` FOREIGN KEY (`trabajo_id`) REFERENCES `trabajos` (`id`);

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD CONSTRAINT `trabajos_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `trabajos_encargado_id_foreign` FOREIGN KEY (`encargado_id`) REFERENCES `encargados` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
