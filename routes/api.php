<?php

use App\Http\Controllers\API\AdminController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
  
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\BlogController;
use App\Http\Controllers\noticiasController;
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
Route::get('noticias/{id}', [noticiasController::class, 'mostrar']);
Route::post('noticias', [noticiasController::class, 'registro']);
Route::put("noticias/{id}",[CategoriasController::class,'actualizar']);