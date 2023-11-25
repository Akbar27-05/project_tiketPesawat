<?php

namespace App\Http\Controllers;

use App\Models\KodePromo;
use App\Http\Requests\StoreKodePromoRequest;
use App\Http\Requests\UpdateKodePromoRequest;
use Illuminate\Http\Request;

class KodePromoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $index = KodePromo::all();
        return response()->json(['data' => $index]);
    }

    public function getIdKode(Request $request)
    {
        $id = $request->input('id');

        $user = KodePromo::where('id', $id )
        ->get();

        if (!$user) {
            return response()->json(['message' => 'id tidak ditemukan'], 404);
        }else{
            return response()->json(['data' => $user]);
        }
    }

    public function getKode(Request $request)
    {
        $kode = $request->input('Kode');

        $user = KodePromo::where('Kode', $kode )
        ->get();

        if (!$user) {
            return response()->json(['message' => 'kode tidak ditemukan'], 404);
        }else{
            return response()->json(['data' => $user]);
        }
    }

    public function updateKode(Request $request, $id)
    {
        $request->validate([
            'Kode' => ['required'], 
            'PresentaseDiskon' => ['required'], 
            'MaksimumDiskon' => ['required'], 
            'BerlakuSampai' => ['required'], 
            'Deskripsi' => ['required']
        ]);

        $data = KodePromo::find($id);

        if (!$data) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        // Update data berdasarkan input dari request
        $data->Kode = $request->input('Kode');
        $data->PresentaseDiskon = $request->input('PresentaseDiskon');
        $data->MaksimumDiskon = $request->input('MaksimumDiskon');
        $data->BerlakuSampai = $request->input('BerlakuSampai');
        $data->Deskripsi = $request->input('Deskripsi');
        $data->save();

        return response()->json(['message' => 'Data updated successfully']);
    }

    public function deleteKode($id)
    {
        try {
            // Temukan data berdasarkan ID
            $data = KodePromo::findOrFail($id);

            if (!$data) {
                return response()->json(['message' => 'Data tidak ditemukan'], 404);
            }

            // Hapus data
            $data->delete();

            return response()->json(['message' => 'Data berhasil dihapus'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Gagal menghapus data'], 500);
        }
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
     * @param  \App\Http\Requests\StoreKodePromoRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreKodePromoRequest $request)
    {
        KodePromo::create($request->validated());
        return response()->json('Kode Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\KodePromo  $kodePromo
     * @return \Illuminate\Http\Response
     */
    public function show(KodePromo $kodePromo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\KodePromo  $kodePromo
     * @return \Illuminate\Http\Response
     */
    public function edit(KodePromo $kodePromo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateKodePromoRequest  $request
     * @param  \App\Models\KodePromo  $kodePromo
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateKodePromoRequest $request, KodePromo $kodePromo)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\KodePromo  $kodePromo
     * @return \Illuminate\Http\Response
     */
    public function destroy(KodePromo $kodePromo)
    {
        //
    }
}
