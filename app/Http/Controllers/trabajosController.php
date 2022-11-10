<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\trabajos;
use App\Models\areas;
use App\Models\encargados;
class trabajosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $trabajos=trabajos::all();
        return $trabajos;

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
        $trabajos=new trabajos();
        $trabajos->area_id=$request->area_id;
        $trabajos->encargado_id=$request->encargado_id;
        $verificacionAreas=areas::where('id',$request->area_id)->get();
        $verificacionEncargados=encargados::where('id',$request->encargado_id)->get();
        if(count($verificacionAreas)>0 && count($verificacionEncargados)>0){
            $trabajos->save();
            return "Trabajo Guardado";
    }
    else{
        return "No se pudo guardar el trabajo";
    }
    }
    public function search($id){
        $trabajos=trabajos::where('id',$id)->get();
        return $trabajos;
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
        $trabajos=trabajos::find($id);
        $trabajos->area_id=$request->area_id;
        $trabajos->encargado_id=$request->encargado_id;
        $verificacionAreas=areas::where('id',$request->area_id)->get();
        $verificacionEncargados=encargados::where('id',$request->encargado_id)->get();
        if(count($verificacionAreas)>0 && count($verificacionEncargados)>0){
            $trabajos->save();
            return "Trabajo Actualizado";

    }
    else{
        return "No se pudo actualizar el trabajo";
    }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $trabajos=trabajos::find($id);
        $trabajos->delete();
        return "Trabajo Eliminado";
    }
}
