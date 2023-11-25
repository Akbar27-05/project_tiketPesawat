
<?php

use App\Http\Controllers\AkunController;
use App\Http\Controllers\BandaraController;
use App\Http\Controllers\JadwalPenerbanganController;
use App\Http\Controllers\KodePromoController;
use App\Http\Controllers\MaskapaiController;
use App\Http\Controllers\NegaraController;
use App\Http\Controllers\PerubahanStatusJadwalPenerbanganController;
use App\Http\Controllers\TransaksiDetailController;
use App\Http\Controllers\TransaksiHeaderController;
use App\Models\JadwalPenerbangan;
use App\Models\KodePromo;
use App\Models\TransaksiHeader;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::apiResource('akun', AkunController::class);
Route::apiResource('jadwal', JadwalPenerbanganController::class);
Route::apiResource('bandara', BandaraController::class);
Route::apiResource('maskapai', MaskapaiController::class);
Route::apiResource('kode', KodePromoController::class);
Route::apiResource('negara', NegaraController::class);
Route::apiResource('perubahan', PerubahanStatusJadwalPenerbanganController::class);
Route::apiResource('header', TransaksiHeaderController::class);
Route::apiResource('detail', TransaksiDetailController::class);

Route::post('/tiketSaya', [TransaksiHeaderController::class, 'tiketSaya']);

Route::post('/login', [AkunController::class, 'login']);
Route::post('/cariBandara', [JadwalPenerbanganController::class, 'cariBandara']);    
Route::post('/insertData', [TransaksiHeaderController::class, 'insertData']);         
Route::post('/insertDetail', [TransaksiDetailController::class, 'insertDetail']);         

Route::delete('/deleteBandara/{id}', [BandaraController::class, 'deleteBandara']);     
Route::post('/selectBandara', [BandaraController::class, 'selectBandara']);     
Route::post('/updateBandara/{id}', [BandaraController::class, 'updateBandara']);   

Route::delete('/deleteMaskapai/{id}', [MaskapaiController::class, 'deleteMaskapai']);         
Route::post('/getIdMaskapai', [MaskapaiController::class, 'getIdMaskapai']);         
Route::put('/updateMaskapai/{id}', [MaskapaiController::class, 'updateMaskapai']);   

Route::delete('/deleteKode/{id}', [KodePromoController::class, 'deleteKode']);         
Route::post('/getIdKode', [KodePromoController::class, 'getIdKode']);         
Route::post('/getKode', [KodePromoController::class, 'getKode']);         
Route::put('/updateKode/{id}', [KodePromoController::class, 'updateKode']);  

Route::delete('/deleteJadwal/{id}', [JadwalPenerbanganController::class, 'deleteJadwal']);     
Route::post('/selectIdJadwal', [JadwalPenerbanganController::class, 'selectIdJadwal']);     
Route::post('/updateJadwal/{id}', [JadwalPenerbanganController::class, 'updateJadwal']);         

Route::post('/getIdHeader', [TransaksiHeaderController::class, 'getIdHeader']);
Route::put('/updateHeader/{id}', [TransaksiHeaderController::class, 'updateHeader']);
Route::delete('/deleteHeader/{id}', [TransaksiHeaderController::class, 'deleteHeader']);
Route::post('/getApply', [TransaksiHeaderController::class, 'getApply']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
