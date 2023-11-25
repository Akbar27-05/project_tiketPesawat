<?php

namespace App\Http\Controllers;

use App\Models\TransaksiHeader;
use App\Http\Requests\StoreTransaksiHeaderRequest;
use App\Http\Requests\UpdateTransaksiHeaderRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TransaksiHeaderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $index = DB::table('transaksi_headers AS headers')
        ->join('akuns', 'headers.AkunID', '=', 'akuns.id')
        ->join('jadwal_penerbangans AS jadwal', 'headers.JadwalPenerbanganID', '=', 'jadwal.id')
        ->join('bandaras AS berangkat', 'jadwal.BandaraKeberangkatanID', '=', 'berangkat.id')
        ->join('bandaras AS tujuan', 'jadwal.BandaraTujuanID', '=', 'tujuan.id')
        ->join('maskapais', 'jadwal.MaskapaiID', '=', 'maskapais.id')
        ->select('headers.id AS HeadersID','jadwal.id AS JadwalID', 'akuns.id AS AkunID', 'akuns.Nama', 'jadwal.KodePenerbangan', 'maskapais.Nama AS Maskapai', 'berangkat.Nama AS BandaraKeberangkatan', 'tujuan.Nama AS BandaraTujuan', 'headers.TanggalTransaksi AS TglTransaksi', 'headers.MetodePembayaran', 'headers.TerimaPembayaran', 'jadwal.TanggalWaktuKeberangkatan AS TglKeberangkatan', 'jadwal.DurasiPenerbangan')
        ->get();
        return response()->json(['data' => $index]);
    }

    public function getApply(Request $request)
    {
        $id = $request->input('id');
        $akunid = $request->input('AkunID');

        $Pelayanan = TransaksiHeader::where('id', $id)
            ->where('AkunID', $akunid)
            ->get('TerimaPembayaran');

        return response(['data' => $Pelayanan]);
    }

    public function tiketSaya(Request $request)
    {
        $AkunID = $request->input('AkunID');

        $index = DB::table('transaksi_headers AS headers')
        ->join('akuns', 'headers.AkunID', '=', 'akuns.id')
        ->join('jadwal_penerbangans AS jadwal', 'headers.JadwalPenerbanganID', '=', 'jadwal.id')
        ->join('bandaras AS berangkat', 'jadwal.BandaraKeberangkatanID', '=', 'berangkat.id')
        ->join('bandaras AS tujuan', 'jadwal.BandaraTujuanID', '=', 'tujuan.id')
        ->join('maskapais', 'jadwal.MaskapaiID', '=', 'maskapais.id')
        ->select('headers.id AS HeadersID','jadwal.id AS JadwalID', 'akuns.id AS AkunID', 'akuns.Nama', 'jadwal.KodePenerbangan', 'maskapais.Nama AS Maskapai', 'berangkat.Nama AS BandaraKeberangkatan', 'tujuan.Nama AS BandaraTujuan', 'headers.TanggalTransaksi AS TglTransaksi', 'headers.MetodePembayaran', 'headers.TerimaPembayaran', 'jadwal.TanggalWaktuKeberangkatan AS TglKeberangkatan', 'jadwal.DurasiPenerbangan')
        ->where('AkunID', $AkunID )
        ->get();
        return response()->json(['data' => $index]);

        if (!$index) {
            return response()->json(['message' => 'Login untuk melihat page ini'], 404);
        }else{
            return response()->json(['data' => $index]);
        }
    }

    public function insertData(Request $request)
    {
        $akun = $request->input('AkunID');
        $tgl = $request->input('TanggalTransaksi');
        $jadwal = $request->input('JadwalPenerbanganID');
        $pnmpng = $request->input('JumlahPenumpang');
        $tot = $request->input('TotalHarga');
        $kode = $request->input('KodePromoID');
        $metod = $request->input('MetodePembayaran');
        $terima = $request->input('TerimaPembayaran');

        $data = [
            'AkunID' => $akun,
            'TanggalTransaksi' => $tgl,
            'JadwalPenerbanganID' => $jadwal,
            'JumlahPenumpang' => $pnmpng,
            'TotalHarga' => $tot,
            'KodePromoID' => $kode,
            'MetodePembayaran' => $metod,
            'TerimaPembayaran' => $terima
        ];

        $record = TransaksiHeader::create($data);

        $insertedId = $record->id;

        return response()->json(['data' => $insertedId]);
    }

    public function getIdHeader(Request $request)
    {
        $id = $request->input('id');

        $user = TransaksiHeader::where('id', $id )
        ->get();

        if (!$user) {
            return response()->json(['message' => 'Username / Password tidak ditemukan'], 404);
        }else{
            return response()->json(['data' => $user]);
        }
    }

    public function updateHeader(Request $request, $id)
    {
        $request->validate([
            'AkunID' => ['required'], 
            'TanggalTransaksi' => ['required'], 
            'JadwalPenerbanganID' => ['required'], 
            'JumlahPenumpang' => ['required'], 
            'TotalHarga' => ['required'], 
            'KodePromoID' => ['required'],
            'MetodePembayaran' => ['required'],
            'TerimaPembayaran' => ['required'],
        ]);

        $data = TransaksiHeader::find($id);

        if (!$data) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        $data->AkunID = $request->input('AkunID');
        $data->TanggalTransaksi = $request->input('TanggalTransaksi');
        $data->JadwalPenerbanganID = $request->input('JadwalPenerbanganID');
        $data->JumlahPenumpang = $request->input('JumlahPenumpang');
        $data->TotalHarga = $request->input('TotalHarga');
        $data->KodePromoID = $request->input('KodePromoID');
        $data->MetodePembayaran = $request->input('MetodePembayaran');
        $data->TerimaPembayaran = $request->input('TerimaPembayaran');
        $data->save();

        return response()->json(['message' => 'Data updated successfully']);
    }

    public function deleteHeader($id)
    {
        try {
            $data = TransaksiHeader::findOrFail($id);

            if (!$data) {
                return response()->json(['message' => 'Data tidak ditemukan'], 404);
            }

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
     * @param  \App\Http\Requests\StoreTransaksiHeaderRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreTransaksiHeaderRequest $request)
    {
        TransaksiHeader::create($request->validated());
        return response()->json('Transaksi Header Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TransaksiHeader  $transaksiHeader
     * @return \Illuminate\Http\Response
     */
    public function show(TransaksiHeader $transaksiHeader)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\TransaksiHeader  $transaksiHeader
     * @return \Illuminate\Http\Response
     */
    public function edit(TransaksiHeader $transaksiHeader)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateTransaksiHeaderRequest  $request
     * @param  \App\Models\TransaksiHeader  $transaksiHeader
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateTransaksiHeaderRequest $request, TransaksiHeader $transaksiHeader)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TransaksiHeader  $transaksiHeader
     * @return \Illuminate\Http\Response
     */
    public function destroy(TransaksiHeader $transaksiHeader)
    {
        //
    }
}
