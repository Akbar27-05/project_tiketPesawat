<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreBandaraRequest extends FormRequest
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
            'Nama' => ['required'],
            'KodeIATA' => ['required'], 
            'Kota' => ['required'], 
            'NegaraID' => ['required'], 
            'JumlahTerminal' => ['required'], 
            'Alamat' => ['required']
        ];
    }
}
