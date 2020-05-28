/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: VI (Vietnamese; Tiếng Việt)
 */
(function ($) {
	$.validator.addMethod(
	        "date",
	        function (value, element) {
	            var bits = value.match(/([0-9]+)/gi), str;
	            if (!bits)
	                return this.optional(element) || false;
	            if (bits[1].length != 2 || bits[0].length != 2 || bits[2].length != 4) {
	            	$.validator.messages.date = "Nh\u1EADp ng\u00E0y th\u00E1ng theo \u0111\u1ECBnh d\u1EA1ng dd/MM/yyyy";
	            	return false;
	            }
	            	
	            str = bits[1] + '/' + bits[0] + '/' + bits[2];
	            return this.optional(element) || !/Invalid|NaN/.test(new Date(str));
	        },
	        "Nhập ngày tháng theo định dạng dd/mm/yyyy"
	);
        var messagesNumberClsErorr = $.validator.messages.number;
        $.validator.addMethod(
	        "number",
	        function (value, element) {
                    if($(element).val().length==0)
                        return true;
                    var numTemp = $(element).val().convertStringToNumber();
                    if(numTemp == undefined || numTemp.toString()==='NaN'){
                       return false;
                    }
                    var mV= $(element).attr("maxVal");
                    if(mV!=undefined && mV.trim().length>0){
                        if($(element).val().convertStringToNumber() <= $(element).attr("maxVal").convertStringToNumber())
                            return true;
                        $.validator.messages.number = "Gi\u00E1 tr\u1ECB t\u1ED1i nh\u1EADp t\u1ED1i \u0111a " +formatSo(mV);
                        return false;
                    }
                    // scale
                    var scaleAttr = $(element).attr("scale");
                    // precision
                    var precisionAttr = $(element).attr("precision");
                    if(scaleAttr != undefined && precisionAttr != undefined){
                        var scale = scaleAttr.trim().length==0?0:parseInt(scaleAttr);
                        var precision = precisionAttr.trim().length==0?0:parseInt(precisionAttr);
                        var smaxValue = "".padStart(precision-scale,"9") + "."+ "".padStart(scale,"9");
                        if(smaxValue.convertStringToNumber()>=$(element).val().convertStringToNumber()){
                            $.validator.messages.number =messagesNumberClsErorr;
                            return true;
                        }else{
                            $.validator.messages.number = "Gi\u00E1 tr\u1ECB nh\u1EADp kh\u00F4ng \u0111\u01B0\u1EE3c l\u1EDBn h\u01A1n " +formatSo(smaxValue, scale);
                            return false;
                        }
                    }
                    return true;
	        },"Hãy nhập số."
	);
        
        $.validator.addMethod(
    	        "decimal",
    	        function (value, element) {
                        if($(element).val().length==0)
                            return true;
                        var numTemp = $(element).val().convertStringToNumber();
                        if(numTemp == undefined || numTemp.toString()==='NaN'){
                           return false;
                        }
                        //var regexp = /^\d{1,2}\.\d{0,4}$/;
                        var regexp = /^\d{1,2}(\.\d{0,4})?$/;
                        if (!regexp.test(numTemp)) {
                        	 $.validator.messages.decimal = "Gi\u00E1 tr\u1ECB nh\u1EADp kh\u00F4ng \u0111\u01B0\u1EE3c l\u1EDBn h\u01A1n 99.9999";
                        	 return false;
                        }
                        return true;
    	        },"Hãy nhập số."
    	);
        
        $.validator.addMethod(
    	        "ascii",
    	        function (value, element) {
                        if($(element).val().length==0)
                            return true;
                        var regspace = /\s/;
                        if (regspace.test($(element).val())) {
                       	 $.validator.messages.ascii = "Kh\u00F4ng \u0111\u01B0\u1EE3c nh\u1EADp d\u1EA5u c\u00E1ch";
                       	 return false;
                       }
                        var regexp = /[^\x00-\x7F]+/;
                        if (regexp.test($(element).val())) {
                        	 $.validator.messages.ascii = "Kh\u00F4ng \u0111\u01B0\u1EE3c nh\u1EADp k\u00ED t\u1EF1 utf-8";
                        	 return false;
                        }
                        return true;
    	        },"Hãy nhập số."
    	);
        
        $.validator.addMethod(
    	        "uppercase",
    	        function (value, element) {
                        if($(element).val().length==0)
                            return true;
                        var str = $(element).val().toUpperCase();
                        $(element).val(str);
                        return true;
    	        },"Hãy nhập số."
    	);
        
        $.validator.addMethod(
    	        "lowercase",
    	        function (value, element) {
                        if($(element).val().length==0)
                            return true;
                        var str = $(element).val().toLowerCase();
                        $(element).val(str);
                        return true;
    	        },"Hãy nhập số."
    	);
        
        $.validator.addMethod(
            "addressIp",
	        function (value, element) {
            	if($(element).val().length==0){
            		$.validator.messages.addressIp = "\u0110\u1ECBa ch\u1EC9 IP kh\u00F4ng \u0111\u01B0\u1EE3c \u0111\u1EC3 tr\u1ED1ng";
            		return false;
            	}
            	if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(value)) {  
            	    return true;
            	  }  
            	$.validator.messages.addressIp = "\u0110\u1ECBa ch\u1EC9 IP kh\u00F4ng \u0111\u00FAng \u0111\u1ECBnh d\u1EA1ng";
            	return false;
	        },
	        "H\u00E3y nh\u1EADp s\u1ED1"
        );
        
        $.validator.addMethod(
                "notnull",
    	        function (value, element) {
                	if($(element).val().length==0){
                		$.validator.messages.notnull = "Kh\u00F4ng \u0111\u1EC3 tr\u1ED1ng";
                		return false;
                	}
                	return true;
    	        }
            );
        
        $.validator.addMethod(
                "cmt",
    	        function (value, element) {
                	if($(element).val().length==0){
                		/*$.validator.messages.cmt = "CMT kh\u00F4ng \u0111\u01B0\u1EE3c \u0111\u1EC3 tr\u1ED1ng";*/
                		/*return false;*/
                		return true;
                	}
                         var regex = new RegExp("^([0-9]{9}$|[0-9]{12})$");
         	        	if(regex.test(value)){
         	        		return true;
         	        	}else{
         	        		$.validator.messages.cmt = "CMT kh\u00F4ng \u0111\u00FAng \u0111\u1ECBnh d\u1EA1ng";
                            return false;
         	        	}
    	        }
            )
       
         $.validator.addMethod(
            "textint",
	        function (value, element) {
                     return isNumber(element,'i');
	        },
	        "H\u00E3y nh\u1EADp s\u1ED1 nguy\u00EAn"
        );
        
        $.validator.addMethod(
                "textnumber",
    	        function (value, element) {
                	$.validator.messages.textnumber = "H\u00E3y nh\u1EADp s\u1ED1 nguy\u00EAn";
                	return $.isNumeric(value);
    	        },
    	        "H\u00E3y nh\u1EADp s\u1ED1 nguy\u00EAn"
            );
         $.validator.addMethod(
            "partnerCode",
	        function (value, element) {
            	//value = value.replace(',','');
 				if (value.length != 3 && value.length != 8) {
 					 $.validator.messages.partnerCode = "mã không được vượt quá 3 hoặc 8 kí tự"
 					return false;
 				}
 				return true;
	        },
	        "Hãy nhập số"
        );
         
         
         $.validator.addMethod(
                 "catProductService",
     	        function (value, element) {
                 	//value = value.replace(',','');
      				if (value.length == 0) {
      					 $.validator.messages.catProductId = "phải chọn sản phẩm"
      					return false;
      				}
      				return true;
     	        },
     	        "Hãy nhập số"
             );
         $.validator.addMethod(
                 "partnerBranchCode",
     	        function (value, element) {
                	var regexp = /^\d{2}([0-9A-Za-z]*)\d{3}$/;
                	if (!regexp.test($(element).val())) {
                		$.validator.messages.partnerBranchCode = "mã chi nhánh sai định dạng"
                		return false
                	}
                	var a = $('select[name="partnerBranch.partnerId"] option:selected').val();
          			var branchCode = $(element).val();
          			if (a == '' || a == null || a=="" || branchCode == null || branchCode == "")
          				return true;
          			var text = $('select[name="partnerBranch.partnerId"] option:selected').text();
          			var partner = text.split("-");
          			var partnerCode = partner[0].trim();
          			var code = branchCode.substring(2, branchCode.length-3)
          			if (code != partnerCode) {
      					 $.validator.messages.partnerBranchCode = "Mã chi nhánh sai định dạng";
      					return false
          			}
      				return true;
     	        },
     	        "Hãy nhập số"
         );
         $.validator.addMethod(
                 "validateBranchCode",
     	        function (value, element) {
                	var a = $(element).val();
                	var branchCode = $('input[name="partnerBranch.code"]').val();
          			if (a == '' || a == null || a=="" || branchCode == null || branchCode == "")
          				return true;
          			var text = $('select[name="partnerBranch.partnerId"] option:selected').text();
          			var partner = text.split("-");
          			var partnerCode = partner[0].trim();
          			var code = branchCode.substring(2, branchCode.length-3)
          			if (code != partnerCode) {
      					 $.validator.messages.validateBranchCode = "Mã chi nhánh sai định dạng với đơn vị";
      					return false
          			}
      				return true;
     	        },
     	        "Hãy nhập số"
         );
         
	
	$.validator.addMethod(
	        "hhmmss",
	        function (value, element) {
	            if(value=='')
                        return true;
                    if(value.length!=6)
                        return false;
                    var hh = parseInt(value.substring(0,2));
                    if(hh=='NaN')
                        return false;
                    if(hh>=24)
                        return false;
                    var mm = parseInt(value.substring(2,4));
                    if(mm=='NaN')
                        return false;
                    if(mm>=60)
                        return false;
                    var ss = parseInt(value.substring(4,6));
                    if(ss=='NaN')
                        return false;
                    if(ss>=60)
                        return false;
                    return true;
                    
	        },
	        "Sai &#273;&#7883;nh d&#7841;ng hhmmss"
	);
	$.extend($.validator.messages, {
		required: "Hãy nhập.",
		remote: "Hãy sửa cho đúng.",
		email: "Kiểm tra trường email.",
		url: "Hãy nhập URL.",
		date: "Hãy nhập ngày.",
		dateISO: "Hãy nhập ngày (ISO).",
		number: "Hãy nhập số.",
		digits: "Hãy nhập chữ số.",
		creditcard: "Hãy nhập số thẻ tín dụng.",
		equalTo: "Hãy nhập thêm lần nữa.",
		accept: "Phần mở rộng không đúng.",
		decimal:"Hãy nhập số",
		ascii: "Không đcược nhập kí tự utf-8",
		catProductService: "phải chọn sản phẩm",
		partnerBranchCode : "mã chi nhánh sai định dạng",
		validateBranchCode : "Mã chi nhánh sai định dạng với đơn vị"/*,
		maxlength: $.format("Hãy nhập từ {0} kí tự trở xuống."),
		minlength: $.format("Hãy nhập từ {0} kí tự trở lên."),
		rangelength: $.format("Hãy nhập từ {0} đến {1} kí tự."),
		range: $.format("Hãy nhập từ {0} đến {1}."),
		max: $.format("Hãy nhập từ {0} trở xuống."),
		min: $.format("Hãy nhập từ {1} trở lên.")*/
	});
}(jQuery));