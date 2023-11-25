<?php

namespace App\Http\Controllers;

use App\Models\TransaksiDetail;
use App\Http\Requests\StoreTransaksiDetailRequest;
use App\Http\Requests\UpdateTransaksiDetailRequest;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class TransaksiDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $index = TransaksiDetail::all();
        return response()->json(['data' => $index]);
    }

    public function insertDetail(Request $request)
    {
        $dataArray = $request->all();

        foreach ($dataArray as $data) {
            TransaksiDetail::create([
                'TransaksiHeaderID' => $data['TransaksiHeaderID'],
                'TitelPenumpang' => $data['TitelPenumpang'],
                'NamaLengkapPenumpang' => $data['NamaLengkapPenumpang'],
            ]);
        }
        return response()->json(['data' => "Data berhasil disimpan"]);
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
     * @param  \App\Http\Requests\StoreTransaksiDetailRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreTransaksiDetailRequest $request)
    {
        TransaksiDetail::create($request->validated());
        return response()->json('Transaksi Detail Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TransaksiDetail  $transaksiDetail
     * @return \Illuminate\Http\Response
     */
    public function show(TransaksiDetail $transaksiDetail)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\TransaksiDetail  $transaksiDetail
     * @return \Illuminate\Http\Response
     */
    public function edit(TransaksiDetail $transaksiDetail)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateTransaksiDetailRequest  $request
     * @param  \App\Models\TransaksiDetail  $transaksiDetail
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateTransaksiDetailRequest $request, TransaksiDetail $transaksiDetail)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TransaksiDetail  $transaksiDetail
     * @return \Illuminate\Http\Response
     */
    public function destroy(TransaksiDetail $transaksiDetail)
    {
        //
    }
}
