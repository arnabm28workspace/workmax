@extends('admin.layouts.app')
@section('page', 'View Barcodes' )
@section('content')
<section>    
    <div class="search__filter">
        <div class="row align-items-center justify-content-between">
            <div class="col-auto">
                <div class="row">
                    <div class="col">                
                        <div class="row g-3 align-items-center">                            
                            <div class="col-auto">
                                <a onclick='printResultHandler()'  class="btn btn-outline-success btn-sm">Download</a>
                                <a href="{{ route('admin.purchaseorder.index') }}" class="btn btn-outline-danger btn-sm">Back</a>
                            </div>
                        </div>
                
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="print_div">
        <div>
        <h5>Order No:- <span>{{$unique_id}}</span></h5>
        <div class="row">
             @foreach ($purchase_order_boxes as $arr)
            <div class="col-md-3">
                <img alt="Barcoded value {{$arr->barcode_no}}"
     src="https://bwipjs-api.metafloor.com/?bcid=code128&text={{$arr->barcode_no}}&includetext">
            </div>
            @endforeach
        </div>
        </div>
    </div>
   
</section>
@endsection
@section('script')
<script type="text/javascript">
    function printDownload()
    {
        var htmlVal = document.getElementById('bar_sec');
        // console.log(htmlVal); return true;
        // var newWin=window.open('','Print-Window');
        // newWin.document.open();
        // var htmlVal = document.getElementById('bar_sec');
        // newWin.document.write(htmlVal);
        // newWin.document.close();
        // setTimeout(function(){newWin.close();},1000);

        var mywindow = window.open("", "PRINT", "height=400,width=600");        
        // mywindow.document.write(htmlVal);
        mywindow.document.write(htmlVal.innerHTML);
        mywindow.document.close();
        mywindow.focus();

        mywindow.print();
        mywindow.close();

        return true;
    }
</script>

<script type="text/javascript">
    function printResultHandler() {
        //Get the HTML of div
        var print_header = '';
        var divElements = document.getElementById("print_div").innerHTML;
        var print_footer = '';

        //Get the HTML of whole page
        var oldPage = document.body.innerHTML;
        //Reset the page's HTML with div's HTML only
        document.body.innerHTML =
                "<html><head><title></title></head><body><font size='2'>" +
                divElements + "</font>" + print_footer + "</body>";
        //Print Page
        window.print();
        //Restore orignal HTML
        document.body.innerHTML = oldPage;
        //bindUnbind();
    }
</script>
@endsection