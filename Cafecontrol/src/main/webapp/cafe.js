let total=0;
let toMenu=[];
$(document)
.ready(function(){
	loadMenu();
	return false;
})
.on('click','#selMenu',function(){
    c_m=$('#selMenu option:selected').text();
    ar=c_m.split(' ');
   $('#menucode').val(ar[0]);
   $('#menuname').val(ar[1]);
   $('#price').val(ar[2]);
   $('#count').val(1)
})
.on('change','#count',function(){
    pc=$('#selMenu option:selected').text();
     ar=pc.split(' ');
     parseInt(ar[2]);
    $('#price').val(ar[2]*$('#count').val());
})
.on('click','#btnReset',function(){
    $('#menucode,#menuname,#count,#price').val('');
})
.on('click','#btnAdd',function(){
    total=0; 
    P=parseInt($('#price').val());
    toMenu.push(P);
    strOrder='<option>'+$('#menucode').val()+'  '+$('#menuname').val()+'  '+' x'+$('#count').val()+'  '+P+'</option>';
    $('#selOrder').append(strOrder);
    
    for(i=0;i<toMenu.length;i++){
        total+=toMenu[i];
    }
    $('#total').val(total);
    $('#menucode,#menuname,#count,#price').val('');
})
.on('click','#btnCancel',function(){
    $('#selOrder').text('');
    toMenu=[];
    $('#total').val('');
})
.on('click','#btnDone',function(){
	$('#selOrder option').each(function(){
		if($('#mobile').val()=="") $('#mobile').val('-');
		sal='<option>'+$('#mobile').val()+"  "+$(this).text()+"</option>";
		$('#selSales').append(sal);	
		tosal=[];
		tosal=$(this).text().split("  ");
		tosal2=tosal[2].replace(' x','');
		$.get('Sales_insert',{mobile:$('#mobile').val(),
			  				menu_code:tosal[0],
			  				qty:tosal2,
			  				total:tosal[3]},function(txt){},'text')
	})
	total=0; 
	toMenu=[];
	$('#selOrder').text('');
	$('#total,#mobile').val('');
})
.on('click','#clean',function(){
    $('#selSales').empty();
})
.on('click','#btnMenu',function(){
    $('#dlgMenu').dialog({
        width: 700,
        open:function(){
            loadMenu1();    
       },
        close:function(){
         	loadMenu();
            }
        })
    })
.on('click','#selMenu1',function(){
    let str=$('#selMenu1 option:selected').text();
    ar1=str.split(' ');
    $('#_menucode').val(ar1[0]);
    $('#_menuname').val(ar1[1]);
    $('#_price').val(ar1[2]);
})
.on('click','#btnGo',function(){
	let operation="";
	if($('#_menucode').val()==''){
		if($('#_menuname').val()!='' && $('#_price').val()!=''){
			operation="insert";
		} else{
			alert('메뉴명 또는 가격이 채워지지 않았습니다.');
			return false;
		}
	}else{
		if($('#_menuname').val()!='' && $('#_price').val()!=''){
			operation="update";
		} else{
			operation="delete";
		}
	}
	$.get(operation,{code:$('#_menucode').val(),name:$('#_menuname').val(),price:$('#_price').val()},function(){
		loadMenu1();
		$('#_menucode,#_menuname,#_price').val('');
		},'text');
		return false;
})
.on('click','#btnSum',function(){

    $('#dlgSales').dialog({
        width: 700,
        
        open:function(){
        	loadSales();
        	loadSales1();
            },
        close:function(){
         	
            }
        })
    })
function loadMenu(){
	 $('#selMenu').empty();
$.get('select',{},function(txt){
		let rec=txt.split(';');
		for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
			 $('#selMenu').append(html);
		}
	},'text');
	return false;
}
function loadMenu1(){
	$('#selMenu1').empty();
	$.get('select',{},function(txt){
			let rec=txt.split(';');
			for(i=0; i<rec.length; i++){
				let field=rec[i].split(',');
				let html='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
				 $('#selMenu1').append(html);
			}
		},'text');
		return false;
	}
function loadSales(){
	$('#selSales1').empty();
    $.get('Sales_select1',{},function(txt){
		let rec=txt.split(';');
		for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option>'+field[0]+' / '+'x'+field[1]+' / '+field[2]+'</option>';
			 $('#selSales1').append(html);
		}
	},'text');
	return false;
}
function loadSales1(){
	$('#selSales2').empty();
    $.get('Sales_select2',{},function(txt){
		let rec=txt.split(';');

		for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option>'+field[0]+' / '+field[1]+'</option>';
			 $('#selSales2').append(html);
		}
	},'text');
	return false;
}