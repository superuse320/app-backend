<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\noticias;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use PhpParser\Node\Expr\AssignOp\Concat;
use Symfony\Component\HttpFoundation\Response;
class noticiasController extends Controller
{
    // $this->validate($request, [
    //     'imagen' => 'required|mimes:jpg,png,jpeg,gif,svg|max:2048',
    // ]);
    // $image_path = $request->file('imagen')->store('imagen', 'public');

    // $data = Imagen::create([
    //     'imagen' => $image_path,
    // ]);
    // return response($data, Response::HTTP_CREATED);



public function registronoticias(Request $request)
{

  $this->validate($request,[
      'title' => 'required',
      'description' => 'required',
      'category_id' => 'required',
      'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
  
    ]);
    $image_path = $request->file('image')->store('public/imagen');
    $nombreImagen=basename($image_path);
     $data = noticias::create([
        
        'title' => $request->title,
        'description' => $request->description,
        'category_id' => $request->category_id,
        'image' => $nombreImagen,
    ]);
    
    return response($data, Response::HTTP_CREATED);

    
} 
public function buscar($id) {


$noticias=noticias::select('id','description','category_id','image')->where("id","=",$id)->get();
  
return $noticias; 

  
 
}
public function listar(){

  $noticias=DB::select('call mostrar_noticias  ');
  return $noticias;  
}



public function actualizar(Request $request, noticias $post) {
    $imagen = '';
    if ($request->hasFile('file')) {
      $imagen = time() . '.' . $request->file->extension();
      $request->file->storeAs('public/imagen', $imagen);
      if ($post->image) {
        Storage::delete('public/imagen/' . $post->image);
      }
    } else {
      $imagen = $post->image;
    }
    $imagen = $request->file('image')->store('imagen','public');
    
    $postData = ['title' => $request->title, 'description' => $request->description, 'category_id' => $request->category_id, 'imagen' => "/app-backend/storage/app/public/".$imagen];

    $post->update($postData);
   return True;
  }
public function eliminar($id) {
  
  
    $post = noticias::find($id);
    $image=noticias::where("id","=",$id)->get('image');
    $image_path = $image[0]->image;
    //return $image_path;
    Storage::delete('public/imagen/' . $image_path);
    $post->delete();
  }
}
    

//   $imagen = time() . '.' . $request->file->extension();
 
//   $request->file->storeAs('public/images', $imagen);

//   $postData = ['Titulo' => $request->Titulo, 'introduccion' => $request->introduccion, 'Cuerpo' => $request->Cuerpo, 'imagen' => $imagen];

//   Noticias::create($postData);
//   return "Datos Guardos Correctamente";



