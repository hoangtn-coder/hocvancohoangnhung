<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="base-admin">
	<tiles:putAttribute name="title" value="Quản lý Tin Tức" />
	
	<tiles:putAttribute name="divGrid">
		<!-- Page Heading -->
        <!-- <h1 class="h3 mb-2 text-gray-800">Tables</h1> -->
       	<a href="#" class="btn btn-primary" onclick="add();">
       		<i class="fa fa-plus" aria-hidden="true"></i>
       		Thêm mới
       	</a>
       	<p></p>
       	
      	<!-- DataTales Example -->
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Quản lý Tin Tức</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<%-- <thead>
                  <tr>
                    <th>Tiêu đề</th>
                    <th>Ảnh</th>
                    <th>Mô tả</th>
                    <th>Tag</th>
                    <th>Ngày tạo</th>
                    <th>Người tạo</th>
                    <th>Ngày sửa</th>
                    <th>Người sửa</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Tiêu đề</th>
                    <th>Ảnh</th>
                    <th>Mô tả</th>
                    <th>Tag</th>
                    <th>Ngày tạo</th>
                    <th>Người tạo</th>
                    <th>Ngày sửa</th>
                    <th>Người sửa</th>
                  </tr>
                </tfoot>
                <tbody>
                	<c:forEach items="${lstNews}" var="item" varStatus="loop">
                		<tr>
                     <td>
                     	<a href='#' onclick='edit("<c:out value="${item.id}" />")'>
                     		<c:out value="${item.title}" />
                     	</a>
                     </td>
                     <td>
                     	<img class="img-thumbnail" src='/hocvan/<c:url value="${item.previewImage}" />' style="width: 200px;">
                     </td>
                     <td><c:out value="${item.description}" /></td>
                     <td><c:out value="${item.tag}" /></td>
                     <td><c:out value="${item.createdDate}" /></td>
                     <td><c:out value="${item.createdBy}" /></td>
                     <td><c:out value="${item.modifiedDate}" /></td>
                     <td><c:out value="${item.modifiedBy}" /></td>
                   </tr>
                	</c:forEach>
                </tbody> --%>
				</table>
            </div>
          </div>
        </div>
	</tiles:putAttribute>
	
	<tiles:putAttribute name="divDetail">
		<!-- Page Heading -->
   		<h1 class="h3 mb-2 text-gray-800">Chi tiết tin tức</h1>
   		
   		<div class="row">
   			<div class="col-xl-12 col-lg-7">
   				<div class="card shadow mb-4">
   					<!-- <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
   						<h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
   					</div> -->
   					<form id="theForm" name="theForm" method="post" enctype="multipart/form-data" class="form-horizontal" action="news">
   						<input type="hidden" id="id" name="id">
   						<input type="hidden" id="status" name="status">
    					<div class="card-body">
   						<div class="row form-group">
							<div class="col-sm-1 label-static">
								Tiêu đề:<font color="red">*</font>
							</div>
 							<div class="col-sm-5">
 								<input type="text" class="form-control required" id="title" name="title" placeholder="Tiêu đề">
 							</div>
 							<div class="col-sm-1 label-static">
								Ảnh:<font color="red">*</font>
							</div>
 							<div class="col-sm-5">
 								<input type="hidden" id="previewImage" name="previewImage">
 								<input type='file' id="imgInp" name="imgInp" data-toggle="tooltip" data-placement="top" title="khuyến nghị chọn ảnh kích thước 1920x1080!"/>
 								<p></p>
 								<img id="blah" class="img-thumbnail" src="#" alt="Khuyến nghị chọn ảnh kích thước 1920x1080!" style="width: 300px;"/>
 							</div>
   						</div>
   						<div class="row form-group">
							<div class="col-sm-1 label-static">
								Mô tả:<font color="red">*</font>
							</div>
							<div class="col-sm-5">
								<textarea rows="3" cols="3" class="form-control required" id="description" name="description" placeholder="Mô tả"></textarea>
							</div>
							<div class="col-sm-1 label-static">
								Tag:
							</div>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="tag" name="tag" placeholder="Tag">
							</div>
   						</div>
   						<div class="row form-group">
							<div class="col-sm-1 label-static">
								Ngày tạo:
							</div>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="createdDate" readonly="readonly" placeholder="Ngày tạo">
							</div>
							<div class="col-sm-1 label-static">
								Người tạo:
							</div>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="createdBy" readonly="readonly" placeholder="Người tạo">
							</div>
   						</div>
   						<div class="row form-group">
							<div class="col-sm-1 label-static">
								Ngày sửa:
							</div>
  							<div class="col-sm-5">
  								<input type="text" class="form-control" id="modifiedDate" readonly="readonly" placeholder="Ngày sửa">
  							</div>
  							<div class="col-sm-1 label-static">
								Người sửa:
							</div>
  							<div class="col-sm-5">
  								<input type="text" class="form-control" id="modifiedBy" readonly="readonly" placeholder="Người sửa">
  							</div>
   						</div>
   						<div class="row form-group">
							<div class="col-sm-1 label-static">
								Nội Dung:<font color="red">*</font>
							</div>
  							<div class="col-sm-11">
  								<div id="ckeditor">
  									<textarea rows="20" cols="20" class="form-control" id="contentNew" name="content" placeholder="Nội Dung"></textarea>
  								</div>
  							</div>
   						</div>
    					</div>
   					</form>
   				</div>
   			</div>
   		</div>
	</tiles:putAttribute>
	
	<tiles:putListAttribute name="stylesheets">
		<!-- Custom styles for this page -->
  		<tiles:addAttribute value="/resources/vendor/datatables/dataTables.bootstrap4.min.css" />
	</tiles:putListAttribute>
	<tiles:putListAttribute name="javascripts">
		<!-- Page level plugins -->
		<tiles:addAttribute value="/resources/vendor/datatables/jquery.dataTables.min.js" />
		<tiles:addAttribute value="/resources/vendor/datatables/dataTables.bootstrap4.min.js" />
	  	<!-- Page level custom scripts -->
	  	<tiles:addAttribute value="/resources/js/demo/datatables-demo.js" />
	  	<!-- CKEditor -->
	  	<tiles:addAttribute value="/resources/plugins/ckeditor/ckeditor.js" />
	  	<!-- ckfinder -->
	  	<tiles:addAttribute value="/resources/plugins/ckfinder/ckfinder.js" />
	</tiles:putListAttribute>
	
	<tiles:putAttribute name="extra-scripts">
		<script type="text/javascript">
			$(document).ready(function() {
				
				$('#dataTable').DataTable( {
					"aaSorting": [],
//			        data: dataSet,
					"language": {
						"sProcessing":   "Đang xử lý...",
					    "sLengthMenu":   "Xem _MENU_ mục",
					    "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
					    "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
					    "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
					    "sInfoFiltered": "(được lọc từ _MAX_ mục)",
					    "sInfoPostFix":  "",
					    "sSearch":       "Tìm:",
					    "sUrl":          "",
					    "oPaginate": {
					        "sFirst":    "Đầu",
					        "sPrevious": "Trước",
					        "sNext":     "Tiếp",
					        "sLast":     "Cuối"
					    }
				    },
			        columns: [
			            { title: "Tiêu đề" },
			            { title: "Ảnh" },
			            { title: "Mô tả" },
			            { title: "Tag" },
			            { title: "Ngày tạo" },
			            { title: "Người tạo" },
			            { title: "Ngày sửa" },
			            { title: "Người sửa" }
			        ]
			    } );
				
				setDataInDataTable(${lstNews});
				
			});
			/* var dataSet = ${lstNews}; */
			
			function setDataInDataTable(data){
				var datatable = $('#dataTable').DataTable();
				datatable.clear();
				data.forEach(function(item, index){
					datatable.row.add([
						  "<a href='#' onclick='edit(\""+ item.id +"\")'>"+ item.title +"</a>",
						  "<img class='img-thumbnail' src='/hocvan/"+ item.previewImage +"' style='width: 200px;'>",
						  item.description != "" ? item.description : "",
						  item.tag != "" ? item.tag : "",
						  item.createdDate != undefined ? item.createdDate : "",
						  item.createdBy != undefined ? item.createdBy : "", 
						  item.modifiedDate != undefined ? item.modifiedDate : "",
						  item.modifiedBy != undefined ? item.modifiedBy : ""
					]);
				});
				datatable.draw();
			}
			
			function beforeValidate() {
			}
			
			function afterValidate() {
				//set data from ckeditor to content
				$('#contentNew').val(ckeditor.getData());
			}
			
			function customizeValidate() {
				if($('#blah').attr('src')=="#"){
					setMessage("Warning"," Ảnh không được để trống.");
					return false;
				}
				
				if(ckeditor.getData() == ""){
					setMessage("Warning"," Nội dung không được để trống.");
					return false;
				}
				
				//chek dinh dang anh
				var file = $('#imgInp').get()[0].files[0];
				var filename = $('#imgInp').val();
			    if (!(isJpg(filename) || isPng(filename)) && filename != "") {
			        setMessage("Warning"," Vui lòng chọn file có dịnh dạng JPG/PNG ...");
			        return false;
			    }
				return true;
			}
			
  		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>