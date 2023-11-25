<?php

namespace App\Http\Controllers;

use App\Models\StatusPenerbangan;
use App\Http\Requests\StoreStatusPenerbanganRequest;
use App\Http\Requests\UpdateStatusPenerbanganRequest;

class StatusPenerbanganController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $index = StatusPenerbangan::all();
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
     * @param  \App\Http\Requests\StoreStatusPenerbanganRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreStatusPenerbanganRequest $request)
    {
        StatusPenerbangan::create($request->validated());
        return response()->json('Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\StatusPenerbangan  $statusPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function show(StatusPenerbangan $statusPenerbangan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\StatusPenerbangan  $statusPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function edit(StatusPenerbangan $statusPenerbangan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateStatusPenerbanganRequest  $request
     * @param  \App\Models\StatusPenerbangan  $statusPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateStatusPenerbanganRequest $request, StatusPenerbangan $statusPenerbangan)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\StatusPenerbangan  $statusPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function destroy(StatusPenerbangan $statusPenerbangan)
    {
        //
    }
}
