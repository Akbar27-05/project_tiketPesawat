<?php

namespace App\Http\Controllers;

use App\Models\Akun;
use App\Http\Requests\StoreAkunRequest;
use App\Http\Requests\UpdateAkunRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AkunController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $akun = Akun::all();
        return response()->json(['data' => $akun]);
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
    public function login(Request $request)
    {
        $username = $request->input('Username');
        $password = $request->input('Password');

        $user = Akun::where('Username', $username )
        ->where('Password', $password)
        ->get();

        if (!$user) {
            return response()->json(['message' => 'Username / Password tidak ditemukan'], 404);
        }else{
            return response()->json(['data' => $user]);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreAkunRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreAkunRequest $request)
    {
        Akun::create($request->validated());
        return response()->json("Akun Created");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Akun  $akun
     * @return \Illuminate\Http\Response
     */
    public function show(Akun $akun)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Akun  $akun
     * @return \Illuminate\Http\Response
     */
    public function edit(Akun $akun)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateAkunRequest  $request
     * @param  \App\Models\Akun  $akun
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateAkunRequest $request, Akun $akun)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Akun  $akun
     * @return \Illuminate\Http\Response
     */
    public function destroy(Akun $akun)
    {
        //
    }
}
