<?php

namespace App\Http\Controllers;

use App\Models\Negara;
use App\Http\Requests\StoreNegaraRequest;
use App\Http\Requests\UpdateNegaraRequest;

class NegaraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $index = Negara::all();
        return response()->json(['data' => $index]);
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
     * @param  \App\Http\Requests\StoreNegaraRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreNegaraRequest $request)
    {
        Negara::create($request->validated());
        return response()->json('Negara Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Negara  $negara
     * @return \Illuminate\Http\Response
     */
    public function show(Negara $negara)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Negara  $negara
     * @return \Illuminate\Http\Response
     */
    public function edit(Negara $negara)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateNegaraRequest  $request
     * @param  \App\Models\Negara  $negara
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateNegaraRequest $request, Negara $negara)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Negara  $negara
     * @return \Illuminate\Http\Response
     */
    public function destroy(Negara $negara)
    {
        //
    }
}
