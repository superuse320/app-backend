<?php

namespace App\Http\Controllers;
use App\Http\Controllers\DB;
use App\Models\noticias;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
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



public function registro(Request $request)
{

  $this->validate($request,[
      'title' => 'required',
      'description' => 'required',
      'category' => 'required',
      'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
  
    ]);
    $image_path = $request->file('image')->store('imagen', 'public');
     $data = noticias::create([
        
        'title' => $request->title,
        'description' => $request->description,
        'category' => $request->category,
        'image' => $image_path,
    ]);
    return response($data, Response::HTTP_CREATED);
} 
public function   mostrar(noticias $post) {

  $imagen=noticias::find($post);
  return $imagen;
  
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

    $postData = ['title' => $request->title, 'description' => $request->description, 'category' => $request->category, 'imagen' => $imagen];

    $post->update($postData);
   return True;
  }

  
    

//   $imagen = time() . '.' . $request->file->extension();
 
//   $request->file->storeAs('public/images', $imagen);

//   $postData = ['Titulo' => $request->Titulo, 'introduccion' => $request->introduccion, 'Cuerpo' => $request->Cuerpo, 'imagen' => $imagen];

//   Noticias::create($postData);
//   return "Datos Guardos Correctamente";



}
