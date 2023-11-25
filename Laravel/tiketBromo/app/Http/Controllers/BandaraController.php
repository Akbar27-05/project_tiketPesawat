<?php

namespace App\Http\Controllers;

use App\Models\Bandara;
use App\Http\Requests\StoreBandaraRequest;
use App\Http\Requests\UpdateBandaraRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BandaraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $index = DB::table('bandaras')
        ->join('negaras', 'bandaras.NegaraID', '=', 'negaras.id')
        ->select('bandaras.*', 'negaras.Nama AS Negara')
        ->orderBy('bandaras.Nama','asc')
        ->get();
        return response()->json(['data' => $index]);
    }

    public function selectBandara(Request $request)
    {

        $idBandara = $request->input('ID');

        $index = Bandara::where('ID', $idBandara )
        ->get();

        if (!$index) {
            return response()->json(['message' => 'Username / Password tidak ditemukan'], 404);
        }else{
            return response()->json(['data' => $index]);
        }
    }

    public function updateBandara(Request $request, $id)
    {
        $request->validate([
            'Nama' => ['required'],
            'KodeIATA' => ['required'], 
            'Kota' => ['required'], 
            'NegaraID' => ['required'], 
            'JumlahTerminal' => ['required'], 
            'Alamat' => ['required']
        ]);

        $data = Bandara::find($id);

        if (!$data) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        // Update data berdasarkan input dari request
        $data->Nama = $request->input('Nama');
        $data->KodeIATA = $request->input('KodeIATA');
        $data->Kota = $request->input('Kota');
        $data->NegaraID = $request->input('NegaraID');
        $data->JumlahTerminal = $request->input('JumlahTerminal');
        $data->Alamat = $request->input('Alamat');
        $data->save();

        return response()->json(['message' => 'Data updated successfully']);
    }

    public function deleteBandara($id)
    {
        try {
            // Temukan data berdasarkan ID
            $data = Bandara::findOrFail($id);

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
     * @param  \App\Http\Requests\StoreBandaraRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreBandaraRequest $request)
    {
        Bandara::create($request->validated());
        return response()->json("Bandara Created");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Bandara  $bandara
     * @return \Illuminate\Http\Response
     */
    public function show(Bandara $bandara)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Bandara  $bandara
     * @return \Illuminate\Http\Response
     */
    public function edit(Bandara $bandara)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateBandaraRequest  $request
     * @param  \App\Models\Bandara  $bandara
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateBandaraRequest $request, Bandara $bandara)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Bandara  $bandara
     * @return \Illuminate\Http\Response
     */
    public function destroy(Bandara $bandara)
    {
        //
    }
}
