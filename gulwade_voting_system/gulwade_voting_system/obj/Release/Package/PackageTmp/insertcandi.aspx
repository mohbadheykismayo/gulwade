<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="insertcandi.aspx.cs" Inherits="gulwade_voting_system.insertcandi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
          <style>
          .page-header {
    background-color: #dda15e;
}


      #datatable{
          font-size: 1.4em;
      }

        #datatable1{
      font-size: 1.4em;
  }

              #todaystocktbl{
    font-size: 1.4em;
}

   
        
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
<!-- Modal -->
<div class="modal fade" id="catmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content ">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Candidate Operations</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

          <div class="page-header">
<div class="page-title">

</div>
</div>

<div class="card">
<div class="card-body">
<div class="row">

    <input id="id" style="display:none"/>
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Name Of Candidate </label>
<input type="text" id="name">
        <small id="itemname1" class="text-danger"></small>
</div>
</div>


    <div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label> Section</label>
<select class="select"  id="xil">
        <option value="0">Please select section</option>

     
       <option value="gudoomiye">gudoomiye</option>
      <option value="ku xigeen">ku xigeen</option>
</select>
</div>
</div>
  


    <div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
       <input type="file" id="FileUpload1" accept="image/*">

 <img id="selectedImage22" src="" alt="Selected Image" />


         <input type="file" id="FileUpload11" accept="image/*">

 <img id="selectedImage221" src="" alt="Selected Image" />
    </div>
</div>






  














<div class="col-lg-12">
        <a href="javascript:void(0);" id="deletebtn" class="btn btn-submit me-2" onclick="deletecategory()">delete</a>
    <a href="javascript:void(0);" id="editbtn" class="btn btn-submit me-2" onclick="updateitem()">edit</a>
<a href="javascript:void(0);" id="submitbtn" class="btn btn-submit me-2" >Submit</a>
<a href="categorylist.html" class="btn btn-cancel" data-bs-dismiss="modal">Cancel</a>
</div>
</div>
</div>
</div>

      </div>
     <%-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>--%>
    </div>
  </div>
</div>

    
    <div class="row">
    <div class="col-lg-12 col-md-12">
        <div class="page-header">
            <div class="page-title ">
                <h1>Candidates List</h1>
            </div>
            <div class="page-btn">
               <a href="#" class="btn btn-added" onclick="callmodal()">
                    <img src="assets/img/icons/plus.svg" class="me-1" alt="img">Ku dar Alaabta
                </a>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="table-top">
                    <div class="search-set">
                        <div class="search-path">
                            <a class="btn btn-filter" id="filter_search">
                                <img src="assets/img/icons/filter.svg" alt="img">
                                <span><img src="assets/img/icons/closes.svg" alt="img"></span>
                            </a>
                        </div>
                        <div class="search-input">
                            <a class="btn btn-searchset"><img src="assets/img/icons/search-white.svg" alt="img"></a>
                        </div>
                    </div>
                    <div class="wordset">
                        <ul>
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="pdf"><img src="assets/img/icons/pdf.svg" alt="img"></a></li>
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="excel"><img src="assets/img/icons/excel.svg" alt="img"></a></li>
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="print"><img src="assets/img/icons/printer.svg" alt="img"></a></li>
                        </ul>
                    </div>
                </div>

                <div class="card" id="filter_inputs">
                    <div class="card-body pb-0">
                        <div class="row">
                            <div class="col-lg-2 col-sm-6 col-12">
                                <div class="form-group">
                                    <select class="select">
                                        <option>Choose Category</option>
                                        <option>Computers</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2 col-sm-6 col-12">
                                <div class="form-group">
                                    <select class="select">
                                        <option>Choose Sub Category</option>
                                        <option>Fruits</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2 col-sm-6 col-12">
                                <div class="form-group">
                                    <select class="select">
                                        <option>Choose Sub Brand</option>
                                        <option>Iphone</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-1 col-sm-6 col-12 ms-auto">
                                <div class="form-group">
                                    <a class="btn btn-filters ms-auto"><img src="assets/img/icons/search-whites.svg" alt="img"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<div class="table-responsive">
    <table class="table" id="datatable">
        <thead>
            <tr>
                <th>Image</th>
                <th>Name </th>
                <th>Postion</th>
             
                <th>Fal</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>

            </div>
        </div>
    </div>


</div>
    <script src="datatables/jquery-3.4.1.min.js"></script>
    <script src="dtmini/datatables.min.js"></script>

<script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $('[id*=FileUpload11]').change(function () {
            if (typeof (FileReader) != "undefined") {
                var input = this;
                if (input.files.length > 0) {
                    var file = input.files[0];

                    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                    if (regex.test(file.name.toLowerCase())) {
                        var fileName = file.name;
                        var contentType = file.type;

                        // Initialize the reader here
                        var reader = new FileReader();  // <-- Add this line to initialize the reader

                        reader.onload = function (e) {
                            $('#selectedImage221').attr('src', e.target.result);
                        }

                        reader.readAsDataURL(file);
                    } else {
                        alert(file.name + " is not a valid image file.");
                    }
                }
            } else {
                alert("This browser does not support HTML5 FileReader.");
            }
        });

        $("[id*=editbtn]").click(function () {







            // Clear previous error messages
            document.getElementById('itemname1').textContent = "";
    





            var magac = $("#name").val();
            var xil = $("#xil").val();
      

            var id = $("#id").val();

            // Validate the form values
            let isValid = true;

            if (magac.trim() === "") {
                document.getElementById('itemname1').textContent = "Please enter the  Item Name.";
                isValid = false;
            }









            // Check if a file is selected and create a FileReader to read the file
            var fileInput = document.getElementById('FileUpload11'); // Replace 'fileInput' with your actual file input ID



            var file = fileInput.files[0];
            var byteData = "";
            var fileName = file ? file.name : "";

            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    byteData = e.target.result.split(';base64,')[1];

                    // Create a JSON object
                    var jsonData = {
                        id: id, // Include the book ID in the data
                        Data: byteData,
                        Name: fileName,
                        magac: magac,
                        xil: xil,
                       

                    };

                    // Send data to server using AJAX
                    if (isValid) {

                        $.ajax({
                            type: "POST",
                            url: "insertcandi.aspx/updatexil", // Change the URL to your update endpoint
                            data: JSON.stringify({ data1: jsonData }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (r) {
                                console.log(r.d);
                                // Clear the file input
                                $("#FileUpload11").val(''); // Replace #fileInput with the actual ID of your file input element
                                // Optionally, reset reader.result to ensure it doesn't hold old data
                                reader.result = null;

                                Swal.fire({
                                    icon: 'success',
                                    title: 'Success',
                                    text: r.d
                                });
                            },
                            error: function (r) {
                                alert(r.responseText);
                            },
                            failure: function (r) {
                                alert(r.responseText);
                            }
                        });

                    }
                };
                reader.readAsDataURL(file);
            } else {
                Swal.fire({
                    icon: 'warning',
                    title: 'No Image Selected',
                    text: 'Please select an image before saving.'
                });

            }

            return false;
        });




        $(document).ready(function () {
            var reader = new FileReader();
            var fileName;
            var contentType;

            $('[id*=FileUpload1]').change(function () {
                if (typeof (FileReader) != "undefined") {
                    var input = this;
                    if (input.files.length > 0) {
                        var file = input.files[0];

                        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                        if (regex.test(file.name.toLowerCase())) {
                            fileName = file.name;
                            contentType = file.type;

                            reader.onload = function (e) {
                                $('#selectedImage22').attr('src', e.target.result);
                            }

                            reader.readAsDataURL(file);
                        } else {
                            alert(file.name + " is not a valid image file.");
                        }
                    }
                } else {
                    alert("This browser does not support HTML5 FileReader.");
                }
            });

            $("[id*=submitbtn]").click(function () {






                // Clear previous error messages
                document.getElementById('itemname1').textContent = "";
         





                var magac = $("#name").val();
                var xil = $("#xil").val();


                // Validate the form values
                let isValid = true;

                if (magac.trim() === "") {
                    document.getElementById('itemname1').textContent = "Please enter the  Item Name.";
                    isValid = false;
                }



                var im = $("#FileUpload1").val();


                if (!im) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'No Image Selected',
                        text: 'Please select an image before saving.'
                    });
                    return false; // Prevent further execution
                }

                var byteData = reader.result.split(';')[1].replace("base64,", "");

                var obj = {
                    Data: byteData,
                    Name: fileName,
                    ContentType: contentType,
                     magac: magac,
                    xil: xil,
              

                };
                // If all validations pass, proceed with AJAX call
                if (isValid) {
                    $.ajax({
                        type: "POST",
                        url: "insertcandi.aspx/submitxil",
                        data: JSON.stringify({ data: obj }), // Update the data field to include the prescid
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            // Clear the file input
                            $("#FileUpload1").val(''); // Replace #fileInput with the actual ID of your file input element
                            // Optionally, reset reader.result to ensure it doesn't hold old data
                            reader.result = null;

                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: r.d
                            });
                            $('#catmodal').modal('hide');
                            clearInputFields();
                            datadisplay();
                            getitem();
                        },
                        error: function (r) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: r.responseText
                            });
                            console.log(r.responseText);
                        },
                        failure: function (r) {
                            alert(r.responseText);
                            console.log(r);
                        }
                    });

                    function clearInputFields() {
                        // Replace these lines with code to clear the input fields
                        $("#itemname").val('');
                        $("#price").val('');
                        $("#section").val('');
                        $("#catdrop").val('');

                    }
                }
                return false;
            });
        });
     

        function callmodal() {
            document.getElementById('submitbtn').style.display = 'inline-block';
            document.getElementById('editbtn').style.display = 'none';
            document.getElementById('deletebtn').style.display = 'none';



            document.getElementById('FileUpload11').style.display = 'none';
            document.getElementById('selectedImage221').style.display = 'none';
            document.getElementById('FileUpload1').style.display = 'inline-block';
            document.getElementById('selectedImage22').style.display = 'inline-block';

            /*  $("#catname").val('');*/
            $('#catmodal').modal('show');

        }






        $("#datatable").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");


            var name = row.find("td:nth-child(2)").text();
            var price = row.find("td:nth-child(5)").text();
            $("#id").val(id);
            $("#name").val(name);


            document.getElementById('submitbtn').style.display = 'none';
            document.getElementById('editbtn').style.display = 'inline-block';
            document.getElementById('deletebtn').style.display = 'none';


            document.getElementById('FileUpload11').style.display = 'inline-block';
            document.getElementById('selectedImage221').style.display = 'inline-block';
            document.getElementById('FileUpload1').style.display = 'none';
            document.getElementById('selectedImage22').style.display = 'none';

            $('#catmodal').modal('show');



        });






        $("#datatable").on("click", ".delete-btn", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");
         


            // Clear previous error messages

            Swal.fire({
                title: 'Ma Hubtaa ?',
                text: "Ma Rabtaa Inaad Delete Gareeneyso ?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, start it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Execute the AJAX request only if the user confirms
                    $.ajax({
                        url: 'insertcandi.aspx/deletexil',
                        data: "{'id':'" + id + "'}",
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        type: 'POST',
                        success: function (response) {
                            console.log(response);
                            if (response.d === 'true') {
                                Swal.fire(
                                    'Successfully Deleted!',
                                    'You Started a Candidate!',
                                    'success'
                                );
                                $('#stockmodal').modal('hide');

                                displaytodaystock();
                            } else {
                                // Handle errors in the response
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Data Insertion Failed',
                                    text: 'There was an error while inserting the stock data: ' + response.d,
                                });
                            }
                        },
                        error: function (response) {
                            console.log(response);
                            Swal.fire({
                                icon: 'error',
                                title: 'Lama Tuuri Karo Tartan buu Ku Jiraa',
                                text: 'An error occurred during the AJAX request: ',
                            });
                        }
                    });
                }
            });



        });



        function datadisplay() {
            $.ajax({
                url: 'insertcandi.aspx/datadisplay', // Ensure this URL is correct
                dataType: "json",
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    console.log(response);

                    $("#datatable tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var id = response.d[i].candi;
                        var name = response.d[i].name;
                        var image = response.d[i].image; // This should be the path to the image
                        var position = response.d[i].position;

                        // If 'image' is a URL, wrap it in an <img> tag
                        var imageTag = '<img src="' + image + '" alt="Item Image" style="width:50px;height:50px;">';

                        $("#datatable tbody").append(
                            "<tr>" +
                            "<td>" + imageTag + "</td>" +
                            "<td>" + name + "</td>" +
                            "<td>" + position + "</td>" +
                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + id + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + id + '">' +
                            '<img src="assets/img/icons/delete.svg" alt="Delete">' +
                            '</a>' +
                            "</td>" +
                            "</tr>"
                        );
                    }

              
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

        // Call the datadisplay function to load data
        $(document).ready(function () {
            datadisplay();
           });


    </script>
</asp:Content>
