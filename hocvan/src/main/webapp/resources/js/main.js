var editUrl = '';
$(document).ready(function() {
	$('#divDetail').css('display', 'none');
	editUrl = location.pathname + '/edit';
	saveUrl = location.pathname + '/save';
	
});

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

function add() {
	clearDiv('divDetail');
	$('#divGrid').css('display', 'none');
    $('#divDetail').css('display', 'inline');
    getCkEditor('contentNew');
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
			error: function(e) {
				alert(e);
			}
		}
	);
}

var isJpg = function(name) {
    return name.match(/jpg$/i)
};
    
var isPng = function(name) {
    return name.match(/png$/i)
};


//set token when call ajax
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});


function save() {
	if (!$('#newsForm').valid()) {
		console.log("validate flase");
        return;
    }else{
    	console.log("validate true");
    }
	
	var file = $('#imgInp').get()[0].files[0];
	var filename = $('#imgInp').val();
    if (!(isJpg(filename) || isPng(filename)) && filename != "") {
        alert('Vui lòng chọn file có dịnh dạng JPG/PNG ...');
        return;
    }
    $('#contentNew').val(ckeditor.getData());
    
	$.ajax({url: saveUrl,
			type : "POST",
			data: new FormData($('#newsForm')[0]),
            processData: false,
            contentType: false,
			success: function(res){
				console.log(res.description);
				alert(res.description);
			},
			error: function(e) {
				alert(e.description);
			}
		}
	);
	
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

function clearDiv(divId){
	$('#' + divId + ' input:not(input[type="button"], input[type="radio"]), #' + divId + ' select, #' + divId + ' textarea').val('');		
	$('#' + divId + ' input[type="radio"]' + ', #' + divId + ' input[type="checkbox"]').prop("checked", false);
}

function cancel() {
    $('#divGrid').css('display', 'inline');
    $('#divDetail').css('display', 'none');
    $("#ckeditor").empty();
	$("#ckeditor").append('<textarea rows="20" cols="20" class="form-control" id="contentNew" placeholder="Nội Dung"></textarea>');
}
