<?php

namespace App\Imports;

use App\Product;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Symfony\Component\HttpFoundation\Request;

class ProductImport implements ToModel, WithStartRow
{
    private $rows = 0;

    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        return new Product([
            'name'        => $row[0],
            'unit_id'     => $_POST['unit_id'],
            'cash_price'  => $row[1],
        ]);
    }

    public function startRow(): int
    {
        return 2;
    }
}
