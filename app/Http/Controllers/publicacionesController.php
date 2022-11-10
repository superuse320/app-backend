<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\publicaciones;
use App\Models\estudiantes;
use App\Models\noticias;
use PhpParser\Node\Expr\FuncCall;

class publicacionesController extends Controller
{   
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    { 
      $publicacion=DB::select('call mostrar_publicacion_noticia  ');
      return $publicacion;  

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       
       $publicacion=new publicaciones();
         $publicacion->noticia_id=$request->noticia_id;
            $publicacion->estudiante_id=$request->estudiante_id;
            $publicacion->comment=$request->comment;
            $publicacion->like=$request->like;
            $verificacionNoticia=noticias::select('id')->where("id","=",$request->noticia_id)->get();
            $verificacionEstudiante=estudiantes::select('id')->where("id","=",$request->estudiante_id)->get();
            if(!$verificacionNoticia && $verificacionEstudiante )
            {
                return "Verifique que los datos Existan";
        
    }
    else{
       $publicacion->save();
         return "Publicacion Guardada";
         
    }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $publicacion=publicaciones::find($id);
        $publicacion->noticia_id=$request->noticia_id;
        $publicacion->estudiante_id=$request->estudiante_id;
        $publicacion->comment=$request->comment;
        $publicacion->like=$request->like;
        $publicacion->save();
        return "Publicacion Actualizada";

    }
    public function search($id){
          $publicacion=publicaciones::select('id','noticia_id','estudiante_id','comment','like')->where("id","=",$id)->get();
        return $publicacion;
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $publicacion=publicaciones::find($id);
        $publicacion->delete();
        return "Publicacion Eliminada";
    }
}
