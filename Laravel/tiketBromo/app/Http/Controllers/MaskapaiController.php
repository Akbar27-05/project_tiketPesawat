<?php

namespace App\Http\Controllers;

use App\Models\Maskapai;
use App\Http\Requests\StoreMaskapaiRequest;
use App\Http\Requests\UpdateMaskapaiRequest;
use Illuminate\Http\Request;

class MaskapaiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $index = Maskapai::all();
        return response()->json(['data' => $index]);
    }

    public function getIdMaskapai(Request $request)
    {
        $id = $request->input('id');

        $user = Maskapai::where('id', $id )
        ->get();

        if (!$user) {
            return response()->json(['message' => 'Username / Password tidak ditemukan'], 404);
        }else{
            return response()->json(['data' => $user]);
        }
    }

    public function updateMaskapai(Request $request, $id)
    {
        $request->validate([
            'Nama' => ['required'], 
            'Perusahaan' => ['required'], 
            'JumlahKru' => ['required'], 
            'Deskripsi' => ['required']
        ]);

        $data = Maskapai::find($id);

        if (!$data) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        // Update data berdasarkan input dari request
        $data->Nama = $request->input('Nama');
        $data->Perusahaan = $request->input('Perusahaan');
        $data->JumlahKru = $request->input('JumlahKru');
        $data->Deskripsi = $request->input('Deskripsi');
        $data->save();

        return response()->json(['message' => 'Data updated successfully']);
    }

    public function deleteMaskapai($id)
    {
        try {
            // Temukan data berdasarkan ID
            $data = Maskapai::findOrFail($id);

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
     * @param  \App\Http\Requests\StoreMaskapaiRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreMaskapaiRequest $request)
    {
        Maskapai::create($request->validated());
        return response()->json('Maskapai Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Maskapai  $maskapai
     * @return \Illuminate\Http\Response
     */
    public function show(Maskapai $maskapai)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Maskapai  $maskapai
     * @return \Illuminate\Http\Response
     */
    public function edit(Maskapai $maskapai)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateMaskapaiRequest  $request
     * @param  \App\Models\Maskapai  $maskapai
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateMaskapaiRequest $request, Maskapai $maskapai)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Maskapai  $maskapai
     * @return \Illuminate\Http\Response
     */
    public function destroy(Maskapai $maskapai)
    {
        //
    }
}
