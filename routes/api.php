<?php

use App\Http\Controllers\API\AdminController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\BlogController;
use App\Http\Controllers\noticiasController;
use App\Http\Controllers\estudiantesController;
use App\Http\Controllers\comentariosController;
use App\Http\Controllers\publicacionesController;
use App\Http\Controllers\areasController;
use App\Http\Controllers\encargadosController;
use App\Http\Controllers\trabajosController;
use App\Http\Controllers\puestostrabajosController;
use App\Http\Controllers\asignacionestrabajosController;
use Illuminate\Support\Facades\Auth;

// Route::get('/', function () {
//     $user=Auth::user();
//     if ($user->handle()){
//         echo "eres usuario administrador";
//     }else
//     {
//         echo "eres estudiante";
//     }
// });
Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'registro']);
Route::get('listado', [AuthController::class, 'listado']);
//Route::get('mostrar', [AuthController::class, 'index'])-> name('admin.index');


Route::get('admin', [AdminController::class, 'index'])
->middleware('auth.admin')
->name('admin.index');

Route::middleware('auth:sanctum')->group( function () {
    Route::resource('blogs', BlogController::class);
});

Route::post('noticias', [noticiasController::class, 'registronoticias']);
Route::get('noticias/{id}', [noticiasController::class, 'buscar']);
Route::get('noticias', [noticiasController::class, 'listar']);
Route::put('noticias/{id}', [noticiasController::class, 'actualizar']);
Route::delete('noticias/{id}', [noticiasController::class, 'eliminar']);
Route::get("comentarios",[comentariosController::class,'index']);
Route::post("comentarios",[comentariosController::class,'store']);
Route::get("comentarios/{id}",[comentariosController::class,'search']);
Route::put("comentarios/{id}",[comentariosController::class,'update']);
Route::delete("comentarios/{id}",[comentariosController::class,'destroy']);
Route::get("estudiantes",[estudiantesController::class,'index']);
Route::post("estudiantes",[estudiantesController::class,'store']);
Route::get("estudiantes/{id}",[estudiantesController::class,'search']);
Route::put("estudiantes/{id}",[estudiantesController::class,'update']);
Route::get("publicaciones",[publicacionesController::class,'index']);
Route::post("publicaciones",[publicacionesController::class,'store']);
Route::get("publicaciones/{id}",[publicacionesController::class,'search']);
Route::put("publicaciones/{id}",[publicacionesController::class,'update']);
Route::delete("publicaciones/{id}",[publicacionesController::class,'destroy']);
Route::get("areas",[areasController::class,'index']);
Route::post("areas",[areasController::class,'store']);
Route::get("areas/{id}",[areasController::class,'search']);
Route::put("areas/{id}",[areasController::class,'update']);
Route::delete("areas/{id}",[areasController::class,'destroy']);
Route::get("encargados",[encargadosController::class,'index']);
Route::post("encargados",[encargadosController::class,'store']);
Route::get("encargados/{id}",[encargadosController::class,'search']);
Route::put("encargados/{id}",[encargadosController::class,'update']);
Route::delete("encargados/{id}",[encargadosController::class,'destroy']);
Route::post("trabajos",[trabajosController::class,'store']);
Route::get("trabajos",[trabajosController::class,'index']);
Route::get("trabajos/{id}",[trabajosController::class,'search']);
Route::put("trabajos/{id}",[trabajosController::class,'update']);
Route::delete("trabajos/{id}",[trabajosController::class,'destroy']);
Route::get("puestostrabajos",[puestostrabajosController::class,'index']);
Route::post("puestostrabajos",[puestostrabajosController::class,'store']);
Route::get("puestostrabajos/{id}",[puestostrabajosController::class,'search']);
Route::put("puestostrabajos/{id}",[puestostrabajosController::class,'update']);
Route::delete("puestostrabajos/{id}",[puestostrabajosController::class,'destroy']);
Route::get("asignacionestrabajos",[asignacionestrabajosController::class,'index']);
Route::post("asignacionestrabajos",[asignacionestrabajosController::class,'store']);
Route::get("asignacionestrabajos/{id}",[asignacionestrabajosController::class,'search']);
Route::put("asignacionestrabajos/{id}",[asignacionestrabajosController::class,'update']);
Route::delete("asignacionestrabajos/{id}",[asignacionestrabajosController::class,'destroy']);

