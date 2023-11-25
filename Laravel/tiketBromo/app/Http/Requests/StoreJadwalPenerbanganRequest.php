<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreJadwalPenerbanganRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'KodePenerbangan' => ['required'], 
            'BandaraKeberangkatanID' => ['required'], 
            'BandaraTujuanID' => ['required'], 
            'MaskapaiID' => ['required'], 
            'TanggalWaktuKeberangkatan' => ['required'], 
            'DurasiPenerbangan' => ['required'], 
            'HargaPerTiket' => ['required']
        ];
    }
}
