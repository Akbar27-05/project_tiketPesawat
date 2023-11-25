import React, { useEffect, useState } from 'react'

const Card = ({title, onCardChange}) => {
  const [inputV1, setInputV1] = useState('Tuan');
  const [inputV2, setInputV2] = useState('');
  const [inputV3, setInputV3] = useState(localStorage.getItem('idHeder'));
  const [error1, setError1] = useState('');
  const [error2, setError2] = useState('');

  const numberFromLocalStorage = parseFloat(inputV3);

  const angkaLain = 1; 
  const hasilPenjumlahan = numberFromLocalStorage + angkaLain;

  const handleSelectChange = (event) => {
    const selectedValue = event.target.value;
    setInputV1(selectedValue);
  };

  const handleSelectChange2 = (event) => {
    const newValue = event.target.value;
    if (newValue.trim() === '') {
      setError2('Nilai tidak boleh kosong');
    } else {
      setError2('');
    }
    setInputV2(newValue);
  };

  useEffect(() => {

    onCardChange(title, { TransaksiHeaderID: hasilPenjumlahan, TitelPenumpang: inputV1, NamaLengkapPenumpang: inputV2 });
  }, [hasilPenjumlahan, inputV1, inputV2]);
  return (
      <div
        className="card bg-light mb-3 shadow-md"
        style={{ maxWidth: "auto" }}
      >
        <div className="card-header">Penumpang #{title + 1}</div>
        <div className="card-body">
          <div className="form-group">
            <select value={inputV1} onChange={handleSelectChange}>

              <option value="Tuan">Tuan</option>
              <option value="Nyonya">Nyonya</option>
            </select>

            <p>Nilai yang Dipilih: {inputV1}</p>
          </div>
          <div class="form-group">
            <label>Nama Lengkap</label>
            <input value={inputV2} onChange={handleSelectChange2} type="text" className="form-control" placeholder="Nama ..."/>
            {error2 && <p style={{ color: 'red' }}>{error2}</p>}
          </div>
        </div>
    </div>
  )
}

export default Card
