<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\trabajadores;
class trabajadoresController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $trabajadores=trabajadores::all();
        return $trabajadores;
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
        $trabajadores=new trabajadores();
        $trabajadores->name_last_name=$request->name_last_name;
        $trabajadores->email=$request->email;
        $trabajadores->phone=$request->phone;
        $trabajadores->adress=$request->adress;
       $trabajadores->student_card=$request->student_card;
        $trabajadores->save();
        return "Trabajador Guardado"; 
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
    public function search($id){
        $trabajadores=trabajadores::where('name_last_name','like','%'.$id.'%')->get();
        return $trabajadores;
    }
    public function update(Request $request, $id)
    {
        $trabajadores=trabajadores::find($id);
        $trabajadores->name_last_name=$request->name_last_name;
        $trabajadores->email=$request->email;
        $trabajadores->phone=$request->phone;
        $trabajadores->adress=$request->adress;
        $trabajadores->student_card=$request->student_card;
        $trabajadores->save();
        return "Trabajador Actualizado";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $trabajadores=trabajadores::find($id);
        $trabajadores->delete();
        return "Trabajador Eliminado";
    }
}
