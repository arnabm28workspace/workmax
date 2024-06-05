<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PurchaseOrder extends Model
{
    //to get the supplier details
    public function supplier() {
        return $this->belongsTo('App\Models\Supplier', 'supplier_id', 'id');
    }
}
