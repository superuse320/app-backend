<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\areas;

class areasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $areas=areas::all();
        return $areas;
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
        $areas=new areas();
        $areas->name=$request->name;
        $areas->description=$request->description;
        $areas->number_jobs=$request->number_jobs;
        $areas->entry_time=$request->entry_time;
        $areas->exit_time=$request->exit_time;
        $areas->price=$request->price;
        $areas->save();
        return "Area Guardado";
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
        $areas=areas::find($id);
        $areas->name=$request->name;
        $areas->description=$request->description;
        $areas->number_jobs=$request->number_jobs;
        $areas->entry_time=$request->entry_time;
        $areas->exit_time=$request->exit_time;
        $areas->price=$request->price;
        $areas->save();
        return "Area Actualizado";

    }
    public function search($id){
        $areas=areas::select('name','description','number_jobs','entry_time','exit_time','price')->where('id',$id)->get();
        return $areas;
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $areas=areas::find($id);
        $areas->delete();
        return "Area Eliminado";

    }
}
