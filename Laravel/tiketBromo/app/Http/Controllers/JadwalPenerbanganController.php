<?php

namespace App\Http\Controllers;

use App\Models\JadwalPenerbangan;
use App\Http\Requests\StoreJadwalPenerbanganRequest;
use App\Http\Requests\UpdateJadwalPenerbanganRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JadwalPenerbanganController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $index = DB::table('jadwal_penerbangans')
        ->join('bandaras AS berangkat', 'jadwal_penerbangans.BandaraKeberangkatanID', '=', 'berangkat.id')
        ->join('bandaras AS tujuan', 'jadwal_penerbangans.BandaraTujuanID', '=', 'tujuan.id')
        ->join('maskapais', 'jadwal_penerbangans.MaskapaiID', '=', 'maskapais.id')
        ->select('jadwal_penerbangans.*', 'berangkat.Nama AS BandaraKeberangkatan', 'tujuan.Nama AS BandaraTujuan', 'maskapais.Nama AS Maskapai')
        ->get();
        return response()->json(['data' => $index]);
    }

    public function cariBandara(Request $request)
    {

        $dari = $request->input('BandaraKeberangkatanID');
        $tujuan = $request->input('BandaraTujuanID');

        $user = DB::table('jadwal_penerbangans')
        ->join('bandaras AS berangkat', 'jadwal_penerbangans.BandaraKeberangkatanID', '=', 'berangkat.id')
        ->join('bandaras AS tujuan', 'jadwal_penerbangans.BandaraTujuanID', '=', 'tujuan.id')
        ->join('maskapais', 'jadwal_penerbangans.MaskapaiID', '=', 'maskapais.id')
        ->select('jadwal_penerbangans.*', 'berangkat.Nama AS BandaraKeberangkatan', 'tujuan.Nama AS BandaraTujuan', 'maskapais.Nama AS Maskapai')
        ->where('BandaraKeberangkatanID', $dari )
        ->where('BandaraTujuanID', $tujuan)
        ->get();

        if (!$user) {
            return response()->json(['message' => 'Username / Password tidak ditemukan'], 404);
        }else{
            return response()->json(['data' => $user]);
        }
    }

    public function selectIdJadwal(Request $request)
    {

        $id = $request->input('id');

        $user = DB::table('jadwal_penerbangans')
        ->join('bandaras AS berangkat', 'jadwal_penerbangans.BandaraKeberangkatanID', '=', 'berangkat.id')
        ->join('bandaras AS tujuan', 'jadwal_penerbangans.BandaraTujuanID', '=', 'tujuan.id')
        ->join('maskapais', 'jadwal_penerbangans.MaskapaiID', '=', 'maskapais.id')
        ->select('jadwal_penerbangans.*', 'berangkat.Nama AS BandaraKeberangkatan', 'tujuan.Nama AS BandaraTujuan', 'maskapais.Nama AS Maskapai')
        ->where('jadwal_penerbangans.id', $id )
        ->get();

        if (!$user) {
            return response()->json(['message' => 'Username / Password tidak ditemukan'], 404);
        }else{
            return response()->json(['data' => $user]);
        }
    }

    public function updateJadwal(Request $request, $id)
    {
        $request->validate([
            'KodePenerbangan' => ['required'], 
            'BandaraKeberangkatanID' => ['required'], 
            'BandaraTujuanID' => ['required'], 
            'MaskapaiID' => ['required'], 
            'TanggalWaktuKeberangkatan' => ['required'], 
            'DurasiPenerbangan' => ['required'], 
            'HargaPerTiket' => ['required']
        ]);

        $data = JadwalPenerbangan::find($id);

        if (!$data) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        // Update data berdasarkan input dari request
        $data->KodePenerbangan = $request->input('KodePenerbangan');
        $data->BandaraKeberangkatanID = $request->input('BandaraKeberangkatanID');
        $data->BandaraTujuanID = $request->input('BandaraTujuanID');
        $data->MaskapaiID = $request->input('MaskapaiID');
        $data->TanggalWaktuKeberangkatan = $request->input('TanggalWaktuKeberangkatan');
        $data->DurasiPenerbangan = $request->input('DurasiPenerbangan');
        $data->HargaPerTiket = $request->input('HargaPerTiket');
        $data->save();

        return response()->json(['message' => 'Data updated successfully']);
    }

    public function deleteJadwal($id)
    {
        try {
            // Temukan data berdasarkan ID
            $data = JadwalPenerbangan::findOrFail($id);

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
     * @param  \App\Http\Requests\StoreJadwalPenerbanganRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreJadwalPenerbanganRequest $request)
    {
        JadwalPenerbangan::create($request->validated());
        return response()->json('Jadwal Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\JadwalPenerbangan  $jadwalPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function show(JadwalPenerbangan $jadwalPenerbangan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\JadwalPenerbangan  $jadwalPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function edit(JadwalPenerbangan $jadwalPenerbangan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateJadwalPenerbanganRequest  $request
     * @param  \App\Models\JadwalPenerbangan  $jadwalPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateJadwalPenerbanganRequest $request, JadwalPenerbangan $jadwalPenerbangan)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\JadwalPenerbangan  $jadwalPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function destroy(JadwalPenerbangan $jadwalPenerbangan)
    {
        //
    }
}
