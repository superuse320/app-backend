<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\encargados;

class encargadosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $encargados=encargados::all();
        return $encargados;

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
        $encargados=new encargados();
        $encargados->name=$request->name;
        $encargados->email=$request->email;
        $encargados->phone=$request->phone;
        $encargados->save();
        return "Encargado Guardado";

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
    public function search(){
        $encargados=encargados::where('name','like','%'.$_GET['name'].'%')->get();
        return $encargados;
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        
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
        $encargados=encargados::find($id);
        $encargados->name=$request->name;
        $encargados->email=$request->email;
        $encargados->phone=$request->phone;
        $encargados->save();
        return "Encargado Actualizado";

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $encargados=encargados::find($id);
        $encargados->delete();
        return "Encargado Eliminado";

    }
}
