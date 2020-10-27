var editUrl = '';
$(document).ready(function() {
	$('#divDetail').css('display', 'none');
	editUrl = location.pathname + '/edit';
	saveUrl = location.pathname + '/save';
	delUrl = location.pathname + '/delete';
	reLoadUrl = location.pathname + '/reLoad';
	
//	$('#dataTable').DataTable( {
//		"aaSorting": [],
////        data: dataSet,
//		"language": {
//			"sProcessing":   "Đang xử lý...",
//		    "sLengthMenu":   "Xem _MENU_ mục",
//		    "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
//		    "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
//		    "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
//		    "sInfoFiltered": "(được lọc từ _MAX_ mục)",
//		    "sInfoPostFix":  "",
//		    "sSearch":       "Tìm:",
//		    "sUrl":          "",
//		    "oPaginate": {
//		        "sFirst":    "Đầu",
//		        "sPrevious": "Trước",
//		        "sNext":     "Tiếp",
//		        "sLast":     "Cuối"
//		    }
//	    },
//        columns: [
//            { title: "Tiêu đề" },
//            { title: "Ảnh" },
//            { title: "Mô tả" },
//            { title: "Tag" },
//            { title: "Ngày tạo" },
//            { title: "Người tạo" },
//            { title: "Ngày sửa" },
//            { title: "Người sửa" }
//        ]
//    } );
//	
//	setDataInDataTable(dataSet);
});

//START set data in DataTable
//function setDataInDataTable(data){
//	var datatable = $('#dataTable').DataTable();
//	datatable.clear();
//	data.forEach(function(item, index){
//		datatable.row.add([
//			  "<a href='#' onclick='edit(\""+ item.id +"\")'>"+ item.title +"</a>",
//			  "<img class='img-thumbnail' src='/hocvan/"+ item.previewImage +"' style='width: 200px;'>",
//			  item.description != "" ? item.description : "",
//			  item.tag != "" ? item.tag : "",
//			  item.createdDate != undefined ? item.createdDate : "",
//			  item.createdBy != undefined ? item.createdBy : "", 
//			  item.modifiedDate != undefined ? item.modifiedDate : "",
//			  item.modifiedBy != undefined ? item.modifiedBy : ""
//		]);
//	});
//	datatable.draw();
//}
//END set data in DataTable

//Start load img in page
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function(e) {
      $('#blah').attr('src', e.target.result);
    }
    
    reader.readAsDataURL(input.files[0]); // convert to base64 string
  }
}

$("#imgInp").change(function() {
  readURL(this);
});
//END  load img in page


//START CkEditor
var ckeditor = '';
function getCkEditor(id){
	ckeditor = CKEDITOR.replace(id, {
		entities_latin: false,
	    entities_greek: false,
        height: "300px",
        width: "100%"
    } );
	CKFinder.setupCKEditor(ckeditor,'/hocvan/resources/plugins/ckfinder/');
}
//END CkEditor

function add() {
	clearDiv('divDetail');
	$('#divGrid').css('display', 'none');
    $('#divDetail').css('display', 'inline');
    getCkEditor('contentNew');
    
    $('#blah').attr({
		src: '#'
	});
}

function edit(id) {
	
	clearDiv('divDetail');
	$.ajax({url: editUrl + "?id=" + id,
			type : "GET",
			success: function(res){
				$("#id").val(res.id);
				$("#title").val(res.title);
				$("#previewImage").val(res.previewImage);
				
				$('#blah').attr({
					src: '/hocvan/' + res.previewImage
				});
				
				$("#description").val(res.description);
				$("#tag").val(res.tag);
				$("#createdDate").val(res.createdDate);
				$("#createdBy").val(res.createdBy);
				$("#modifiedDate").val(res.modifiedDate);
				$("#modifiedBy").val(res.modifiedBy);
				$("#contentNew").val(res.contentNew);
				getCkEditor('contentNew');
		    	$('#divGrid').css('display', 'none');
		        $('#divDetail').css('display', 'inline');
			},
			error: function(res) {
				setMessage("Danger",res.description);
			}
		}
	);
}
//START check file type
var isJpg = function(name) {
    return name.match(/jpg$/i)
};
    
var isPng = function(name) {
    return name.match(/png$/i)
};
//END check file type

//START set token when call ajax
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
//END set token when call ajax


//START build message modal
function setMessage(type,data){//Success,Info,Warning,Danger
	$(".msg").empty();
	switch(type){
	case "Success":
		$(".msg").append("<div class=\"alert alert-success alert-dismissible\">" +
				"<a href=\"#\" class=\"close\" data-dismiss=\"modal\" aria-label=\"close\">&times;</a>" +
				"<strong>Thành công!</strong>" + data +
				"</div>");
		break;
	case "Info":
		$(".msg").append("<div class=\"alert alert-info alert-dismissible\">" +
				"<a href=\"#\" class=\"close\" data-dismiss=\"modal\" aria-label=\"close\">&times;</a>" +
				"<strong>Info!</strong>" +
				" This alert box could indicate a neutral informative change or action." +
				"</div>");
		break;
	case "Warning":
		$(".msg").append("<div class=\"alert alert-warning alert-dismissible\">" +
				"<a href=\"#\" class=\"close\" data-dismiss=\"modal\" aria-label=\"close\">&times;</a>" +
				"<strong>Cảnh báo!</strong>" + data +
				"</div>");
		break;
	case "Danger":
		$(".msg").append("<div class=\"alert alert-danger alert-dismissible\">" +
				"<a href=\"#\" class=\"close\" data-dismiss=\"modal\" aria-label=\"close\">&times;</a>" +
				"<strong>Thật bại!</strong>" + data +
				"</div>");
		break;
	}
	
	$("#myModal").modal();
}
//END build message modal

function save() {
	// Truoc khi validate    
    if (typeof beforeValidate == 'function'){
    	beforeValidate();
    }
    
    // customize validate
    if (typeof customizeValidate == 'function') {
        if (!customizeValidate())
            return;
    }
    	
	//validate
	if (!$('#theForm').valid()) {
		setMessage("Warning"," Vui lòng nhập đầy đủ thông tin bắt buộc.");
		return;
    }
	
//	if($('#blah').attr('src')=="#"){
//		setMessage("Warning"," Ảnh không được để trống.");
//		return;
//	}
//	
//	if(ckeditor.getData() == ""){
//		setMessage("Warning"," Nội dung không được để trống.");
//		return;
//	}
//	
//	//chek dinh dang anh
//	var file = $('#imgInp').get()[0].files[0];
//	var filename = $('#imgInp').val();
//    if (!(isJpg(filename) || isPng(filename)) && filename != "") {
//        setMessage("Warning"," Vui lòng chọn file có dịnh dạng JPG/PNG ...");
//        return;
//    }
    
	
//	$('#contentNew').val(ckeditor.getData());
	
	if (typeof afterValidate == 'function'){
		afterValidate();
    }
	
	$.ajax({url: saveUrl,
		type : "POST",
		data: new FormData($('#theForm')[0]),
        processData: false,
        contentType: false,
		success: function(res){
			reLoad();
			setMessage("Success",res.description);
		},
		error: function(res) {
			setMessage("Danger",res.description);
		}
	});
    
//	$.ajax({url: saveUrl + "?id=" + id + "&title=" + encodeURIComponent(title) + "&description=" + encodeURIComponent(description)
//			+ "&tag=" + encodeURIComponent(tag) + "&content=" + encodeURIComponent(content),
//			type : "POST",
//			data: new FormData($('#fileForm')[0]),
//	        processData: false,
//	        contentType: false,
//			success: function(res){
//				console.log(res.description);
//				alert(res.description);
//			},
//			error: function(e) {
//				alert(e.description);
//			}
//		}
//	);
}

function showConfirmDel() {
	if ($('#id').val().trim().length <= 0) {
		setMessage("Warning"," Chưa có bản ghi nào được chọn.");
		return
    }
	
	$("#myModalDel").modal();
}

function del() {
	var id = $('#id').val();
	$.ajax({url: delUrl + "?id=" + id,
		type : "GET",
		success: function(res){
			reLoad();
			setMessage("Success",res.description);
		},
		error: function(res) {
			setMessage("Danger",res.description);
		}
	});
}

function clearDiv(divId){
	$('#' + divId + ' input:not(input[type="button"], input[type="radio"]), #' + divId + ' select, #' + divId + ' textarea').val('');		
	$('#' + divId + ' input[type="radio"]' + ', #' + divId + ' input[type="checkbox"]').prop("checked", false);
}

function cancel() {
	reLoad();
}

//reLoad dataTable
function reLoad(){
	$('#divGrid').css('display', 'inline');
    $('#divDetail').css('display', 'none');
    $("#ckeditor").empty();
	$("#ckeditor").append('<textarea rows="20" cols="20" class="form-control" id="contentNew" name="contentNew" placeholder="Nội Dung"></textarea>');
	
	$.ajax({url: reLoadUrl,
		type : "GET",
		success: function(res){
			setDataInDataTable(res);
		},
		error: function(res) {
			setMessage("Danger",res.description);
		}
	});
}

