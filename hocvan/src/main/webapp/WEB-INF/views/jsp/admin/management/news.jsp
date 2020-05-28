<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<!-- Begin Page Content -->
        <div class="container-fluid">
        
        	<!-- Begin DivGrid -->
			<div id="divGrid">
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
		                  <thead>
		                    <tr>
		                      <th>Tiêu đề</th>
		                      <th>Ảnh</th>
		                      <!-- <th>Nội dung</th> -->
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
		                      <!-- <th>Nội dung</th> -->
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
			                      	<img class="img-thumbnail" src='/hocvan/<c:url value="${item.previewImage}" />'>
			                      </td>
			                      <%-- <td><c:out value="${item.content}" /></td> --%>
			                      <td><c:out value="${item.description}" /></td>
			                      <td><c:out value="${item.tag}" /></td>
			                      <td><c:out value="${item.createdDate}" /></td>
			                      <td><c:out value="${item.createdBy}" /></td>
			                      <td><c:out value="${item.modifiedDate}" /></td>
			                      <td><c:out value="${item.modifiedBy}" /></td>
			                    </tr>
		                  	</c:forEach>
		                  </tbody>
		                </table>
		              </div>
		            </div>
		          </div>
			</div>
			
			<!-- Begin DivDetail -->
			<div id="divDetail">
				<!-- Page Heading -->
          		<h1 class="h3 mb-2 text-gray-800">Chi tiết tin tức</h1>
          		
          		<div class="row">
          			<div class="col-xl-12 col-lg-7">
          				<div class="card shadow mb-4">
          					<!-- <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          						<h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
          					</div> -->
          					<form id="newsForm" name="newsForm" method="post" enctype="multipart/form-data" class="form-horizontal">
          						<input type="hidden" id="id" name="id">
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
	          								<input type='file' id="imgInp" name="imgInp"/>
	          								<p></p>
	          								<img id="blah" class="img-thumbnail" src="#" alt="your image" style="width: 200px;"/>
	          							</div>
	         						</div>
	         						<div class="row form-group">
	         								<div class="col-sm-1 label-static">
	         									Mô tả:<font color="red">*</font>
	         								</div>
	          							<div class="col-sm-5">
	          								<textarea rows="3" cols="3" class="form-control" id="description" name="description" placeholder="Mô tả"></textarea>
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
	          									<textarea rows="20" cols="20" class="form-control" id="contentNew" name="contentNew" placeholder="Nội Dung"></textarea>
	          								</div>
	          							</div>
	         						</div>
	          						<div align="center" class="divaction">
							        	<input type="button" onclick="save();" value="Lưu" id="btnSave" class="btn btn-primary"> 
							        	<input type="button" onclick="del()" value="Xóa" id="btnDel" class="btn btn-danger"> 
							            <!-- <input type="button" onclick="cancel()" value="Bỏ qua" id="btlCancel" class="btn btn-secondary"> -->
							            <a href="/hocvan/admin/management/news" class="btn btn-secondary">Bỏ qua</a>
							        </div>
	          					</div>
          					</form>
          				</div>
          			</div>
          		</div>
			</div>
        </div>
        <!-- /.container-fluid -->
        
<script type="text/javascript">
</script>
