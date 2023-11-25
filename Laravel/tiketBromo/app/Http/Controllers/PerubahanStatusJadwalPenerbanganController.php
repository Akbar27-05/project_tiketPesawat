<?php

namespace App\Http\Controllers;

use App\Models\PerubahanStatusJadwalPenerbangan;
use App\Http\Requests\StorePerubahanStatusJadwalPenerbanganRequest;
use App\Http\Requests\UpdatePerubahanStatusJadwalPenerbanganRequest;
use Illuminate\Support\Facades\DB;

class PerubahanStatusJadwalPenerbanganController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $index = DB::table('perubahan_status_jadwal_penerbangans')
        ->join('jadwal_penerbangans AS jadwal', 'perubahan_status_jadwal_penerbangans.JadwalPenerbanganID', '=', 'jadwal.id')
        ->join('bandaras AS berangkat', 'jadwal.BandaraKeberangkatanID', '=', 'berangkat.id')
        ->join('bandaras AS tujuan', 'jadwal.BandaraTujuanID', '=', 'tujuan.id')
        ->join('maskapais', 'jadwal.MaskapaiID', '=', 'maskapais.id')
        ->join('status_penerbangans AS status', 'perubahan_status_jadwal_penerbangans.StatusPenerbanganID', '=', 'status.id')
        ->select('perubahan_status_jadwal_penerbangans.id AS PerubahanID','jadwal.id AS JadwalID','jadwal.KodePenerbangan', 'maskapais.Nama AS Maskapai', 'berangkat.Nama AS BandaraKeberangkatan', 'tujuan.Nama AS BandaraTujuan', 'jadwal.TanggalWaktuKeberangkatan', 'jadwal.DurasiPenerbangan', 'status.Nama AS StatusPenerbangan', 'perubahan_status_jadwal_penerbangans.WaktuPerubahanTerjadi', 'perubahan_status_jadwal_penerbangans.PerkiraanWaktuDelay AS WaktuDelay')
        ->get();
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
     * @param  \App\Http\Requests\StorePerubahanStatusJadwalPenerbanganRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePerubahanStatusJadwalPenerbanganRequest $request)
    {
        PerubahanStatusJadwalPenerbangan::create($request->validated());
        return response()->json('Perubahan Success');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PerubahanStatusJadwalPenerbangan  $perubahanStatusJadwalPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function show(PerubahanStatusJadwalPenerbangan $perubahanStatusJadwalPenerbangan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PerubahanStatusJadwalPenerbangan  $perubahanStatusJadwalPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function edit(PerubahanStatusJadwalPenerbangan $perubahanStatusJadwalPenerbangan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdatePerubahanStatusJadwalPenerbanganRequest  $request
     * @param  \App\Models\PerubahanStatusJadwalPenerbangan  $perubahanStatusJadwalPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePerubahanStatusJadwalPenerbanganRequest $request, PerubahanStatusJadwalPenerbangan $perubahanStatusJadwalPenerbangan)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PerubahanStatusJadwalPenerbangan  $perubahanStatusJadwalPenerbangan
     * @return \Illuminate\Http\Response
     */
    public function destroy(PerubahanStatusJadwalPenerbangan $perubahanStatusJadwalPenerbangan)
    {
        //
    }
}
