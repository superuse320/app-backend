<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\puestostrabajos;

class puestostrabajosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $puestostrabajos=puestostrabajos::all();
        return $puestostrabajos;
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
    public function search($id){
        $puestostrabajos=puestostrabajos::where('id',$id)->get();
        return $puestostrabajos;
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $puestostrabajos=new puestostrabajos();
        $puestostrabajos->workplace=$request->workplace;
        $puestostrabajos->description=$request->description;
        $puestostrabajos->trabajo_id=$request->trabajo_id;
        $puestostrabajos->save();
        return "Puesto de Trabajo Guardado";
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
        $puestostrabajos=puestostrabajos::find($id);
        $puestostrabajos->workplace=$request->workplace;
        $puestostrabajos->description=$request->description;
        $puestostrabajos->trabajo_id=$request->trabajo_id;
        $puestostrabajos->save();
        return "Puesto de Trabajo Actualizado";

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $puestostrabajos=puestostrabajos::find($id);
        $puestostrabajos->delete();
        return "Puesto de Trabajo Eliminado";

    }
}
