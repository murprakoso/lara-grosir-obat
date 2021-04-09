<?php

use App\Unit;
use Illuminate\Database\Seeder;

class ProductUnitsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Unit::create([
            'name' => 'Botol'
        ]);
        Unit::create([
            'name' => 'Tube'
        ]);
        Unit::create([
            'name' => 'Renteng'
        ]);
        Unit::create([
            'name' => 'Box'
        ]);
        Unit::create([
            'name' => 'Kaleng'
        ]);
        Unit::create([
            'name' => 'Keping'
        ]);
        Unit::create([
            'name' => 'Pak'
        ]);
        Unit::create([
            'name' => 'Pcs'
        ]);
    }
}
