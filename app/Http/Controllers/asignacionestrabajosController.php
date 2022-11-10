<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\asignacionestrabajos;
class asignacionestrabajosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $asignacionestrabajos=asignacionestrabajos::all();
        return $asignacionestrabajos;
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
    public function search(){
        $asignacionestrabajos=asignacionestrabajos::where('id','like','%'.$_GET['id'].'%')->get();
        return $asignacionestrabajos;
    }
    public function store(Request $request)
    {
        $asignacionestrabajos=new asignacionestrabajos();
        $asignacionestrabajos->trabajador_id=$request->trabajador_id;
        $asignacionestrabajos->puestostrabajo_id=$request->puestostrabajo_id;
       
        $asignacionestrabajos->save();
        return "Asignacion Guardada";

        
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
        $asignacionestrabajos=asignacionestrabajos::find($id);
        $asignacionestrabajos->trabajador_id=$request->trabajador_id;
        $asignacionestrabajos->puestostrabajo_id=$request->puestostrabajo_id;
        $asignacionestrabajos->save();
        return "Asignacion Actualizada";
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $asignacionestrabajos=asignacionestrabajos::find($id);
        $asignacionestrabajos->delete();
        return "Asignacion Eliminada";
    }
}
