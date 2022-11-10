<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\estudiantes;

use function PHPUnit\Framework\returnSelf;

class estudiantesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $estudiantes=estudiantes::all();
        return $estudiantes;
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
        $estudiantes=new estudiantes();
        $estudiantes->name=$request->name;
        $estudiantes->student_card=$request->student_card;
        $estudiantes->email=$request->email;
        $estudiantes->save();   
        return "Estudiante Guardado";
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
    public function search($id){

        $estudiantes=estudiantes::select('id','name','student_card','email')->where("id","=",$id)->get();
        return $estudiantes;
        
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
    public function update(Request $request)
    {
        $estudiantes=estudiantes::findOrFail($request->id);
        $estudiantes->name=$request->name;
        $estudiantes->student_card=$request->student_card;
        $estudiantes->email=$request->email;
        $estudiantes->save();
        return $estudiantes;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $estudiantes=estudiantes::findOrFail($request->id);
        $estudiantes->delete();
        return $estudiantes;
    }
}
