<!DOCTYPE html>
<html>
<head>
	<title>AGNI SALES INVOICE {{ $invoice->invoice_no }}</title>
</head>
<body onload="downloadInvoice()">
	<table border="1" style="width: 100%; border-collapse: collapse;" cellpadding="0" cellspacing="0" id="invoice_table">
		<tr>
			<td>
				<table border="1" style="width: 100%; border-collapse: collapse;" cellpadding="10" cellspacing="0">
					<tr>
						<td rowspan="2">
							<p style="margin: 0">Sender</p>
							<p style="margin: 0;"><strong>AGNI</strong><br/>
							
							{{-- <p style="margin: 0;"><strong>{{$invoice->staff_name}}</strong><br/>
                                {{$invoice->staff_address}}
                            </p>
							<p style="margin: 0;">Ph No: {{$invoice->staff_mobile}}</p> --}}
						</td>
						<td>
							<p style="margin: 0;">Invoice No:<br/><strong>{{$invoice->invoice_no}}</strong></p>
						</td>
						<td>
							<p style="margin: 0;">Invoice Date:<br/><strong>{{ date('d-M-Y',strtotime($invoice->created_at)) }}</strong></p>
						</td>
					</tr>
					<tr>
						<td align="center">
							<p style="margin: 0;">Order No: {{$invoice->order_no}}</p>
							<p style="margin: 0;">Order Date: {{ date('d-M-Y',strtotime($invoice->ordered_at)) }}</p>
						</td>
						{{-- <td>
							<p style="margin: 0;">Portal: <strong>AGNI INVENTORY</strong></p>
							<p style="margin: 0;">Payment Mode</p>
							<p style="margin: 0;"><strong>PREPAID</strong></p>
						</td> --}}
					</tr>
					<tr>
						<td>
							<p style="margin: 0;">Bill To: 
								@if (!empty($invoice->address_outstation)) (OutSation) @endif
								<br/>
								<strong>{{$invoice->store_name}}</strong>
								<br/>
								@if(!empty($invoice->mobile))
								<p style="margin: 0;">Mobile : {{$invoice->mobile}}</p>
								@endif
								<p style="margin: 0;">WhatsApp : {{$invoice->store_whatsapp}}</p>								
                            	{{$invoice->store_billing_address}}
								<br/>
								{{$invoice->store_billing_landmark}}
								<br/>
								{{$invoice->store_billing_state}}
								<br/>
								{{$invoice->store_billing_city}}
								<br/>
								{{$invoice->store_billing_pin}}
                            </p>
							
						</td>
						<td>
							<p style="margin: 0;">Ship To: 
								@if (!empty($invoice->address_outstation)) (OutSation) @endif 
								<br/>
								<strong>{{$invoice->store_name}}</strong>
								<br/>
								@if(!empty($invoice->mobile))
								<p style="margin: 0;">Mobile : {{$invoice->mobile}}</p>
								@endif
								<p style="margin: 0;">WhatsApp : {{$invoice->store_whatsapp}}</p>
								
                            	{{$invoice->store_shipping_address}}
								<br/>
								{{$invoice->store_shipping_landmark}}
								<br/>
								{{$invoice->store_shipping_state}}
								<br/>
								{{$invoice->store_shipping_city}}
								<br/>
								{{$invoice->store_shipping_pin}}
                            </p>
							
						</td>
						{{-- <td>
                            <p style="margin: 0;">Slip No: <br/><strong>{{$invoice->slip_no}}</strong> </p>
						</td> --}}
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" style="width: 100%; border-collapse: collapse;" cellpadding="10" cellspacing="0">
					<tr>
						<th align="center">Sl No.</th>
						<th align="center">Descriptions of Goods</th>
						<th align="center">Total Ctns</th>
						<th align="center">Total Pcs</th>
						<th align="center">Price per Piece (Exc.Tax)</th>
						<th align="center">Total Amount (Exc.Tax)</th>
						<th align="center">HSN Code</th>
						@if (!empty($invoice->invoice_products[0]->is_store_address_outstation))
                        <th align="center">IGST</th>   
                        @else
                        <th align="center">CGST</th> 
                        <th align="center">SGST</th>
                        @endif
						<th align="center">Total Amount (Inc.Tax)</th>
					</tr>
                    @php
                        $i=1;
                        $sum_count = 0;
						$total_invoice_price = 0;
                    @endphp
                    @forelse ($invoice->invoice_products as $items)      

                    @php
                        $sum_count += $items->quantity;						
						$total_invoice_price += $items->total_price;

						
                    @endphp
					<tr>
						<td align="center">{{$i}}</td>
						<td align="center"><strong>{{$items->pro_name}}</strong></td>
						<td align="center">{{$items->quantity}}</td>	
						<td align="center">{{$items->pcs}}</td>					
						<td align="center">Rs. {{ number_format((float)$items->price, 2, '.', '') }}</td>
						<td align="center">Rs. {{ number_format((float)$items->count_price, 2, '.', '') }}</td>	
						<td align="center">{{$items->hsn_code}}</td>
						@if (!empty($invoice->invoice_products[0]->is_store_address_outstation))
                        <td align="center">
                            {{$items->igst}} %
                        </td>
                        @else
                        <td align="center">
                            {{$items->cgst}} %                          
                        </td>
						<td align="center">
							{{$items->sgst}} %
						</td>
                        @endif
						<td align="center">
							Rs. {{ number_format((float)$items->total_price, 2, '.', '')}}
						</td>
					</tr>
                    
                    @php
                        $i++;
                    @endphp
                    @empty
                    <tr>
                        <td colspan="9">No items available</td>
                    </tr>    
                    @endforelse
					
					<tr>
						<td align="center"><strong>Total Invoice Amount:- Rs. {{ number_format((float)$total_invoice_price, 2, '.', '') }}</strong> </td>
					</tr>	
										
								
				</table>
			</td>	
				
		</tr>
		<tr>
			<td>
				<table border="0" style="width: 100%; border-collapse: collapse;" cellpadding="10" cellspacing="0">
					<tr>
						<td valign="top">
							<p style="margin: 0;">Amount Chargeable (in words)<br/><strong>INR {{getAmountAlphabetically($total_invoice_price)}}</strong></p>
						</td>
						<td align="right" valign="top"><h4 style="margin: 0;">E. & O.E</h4></td>
					</tr>
					<tr>
						<td style="width: 50%;">
							<p style="margin: 0;"><u>Declaration</u></p>
							<p style="margin: 0;">1. All claims, if any, for shortages or damages must be reported to customer service on the day of delivery through the contact us page on the web store 2. All Disputes are subject to Maharashtra (27) jurisdiction only.</p>
						</td>
						<td align="center" style="width: 50%; border-top: 1px solid #000; border-left: 1px solid #000;">
							<h3>AGNI International</h3>
							<h3>Authorised Signatory</h3>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table border="0" style="width: 100%; border-collapse: collapse;" cellpadding="10" cellspacing="0">
					<tr>
						<td style="width: 49%;"><p style="margin: 0;"><strong>Bill By</strong></td>
						<td style="width: 2%;" align="center">:</td>
						<td style="width: 49%;"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
    <script>
        function downloadInvoice()
        {
            var print_header = '';
            var divElements = document.getElementById("invoice_table").innerHTML;
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
            window.close();
            
        }
        
    </script>
</body>
</html>