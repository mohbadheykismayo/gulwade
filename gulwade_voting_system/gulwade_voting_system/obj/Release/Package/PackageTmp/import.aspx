<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="import.aspx.cs" Inherits="gulwade_voting_system.import" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
                <div style="color: White;">    
        <h4>    
           
        </h4>    
        <table>    
            <tr>    
                <td>    
                    Select File    
                  
                    <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />    
                </td>    
                   
                <td>    
                    <asp:Button ID="Button1" runat="server" Text="Upload Excel-file" OnClick="Button1_Click" class="btn btn-success"  />    
                </td>  
                <td>

<%--                      <a href="##" class="btn btn-danger" visible="false" onclick="deletedata1()" id="btndelate" >delete</a>--%>
                 <%--    <button class="btn btn-danger btn-lg px-5" type="button" >Submit</button>--%>
     <%--               <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />--%>
                                           <a href="#" class="btn btn-submit" onclick="start()">
Start System
    </a>
                       <a href="#" class="btn btn-danger" onclick="end()">
End System
    </a>

          
                       <a href="#" class="btn btn-danger" onclick="deletegaree()">
Delete
    </a>
                                      <a href="#" class="btn btn-info" onclick="resetgaree()">
Reset
    </a>     

      
                </td>
            </tr>   
            
        </table>  
                    
    </div> 
        </div>
             <table class="table table-bordered table-sm" id="tableStudents" style="  width: 100%;">
           
        <thead>
            
<tr  style="background-color:blueviolet;color:white">
   
    <td>std_id</td>
        
   

     <td>
        username
    </td>
     <td>
        password
    </td>
     

</tr>

          </thead> 
             <tbody>  </tbody>
         </table>
 
    <script src="Scripts/jquery-3.4.1.min.js"></script>
      <script>
          function end() {
              // Clear previous error messages

              Swal.fire({
                  title: 'Ma Hubtaa?',
                  text: "Ma Hubtaa Inaa Joojineyso System ka?",
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes!'
              }).then((result) => {
                  if (result.isConfirmed) {
                      // Execute the AJAX request only if the user confirms
                      $.ajax({
                          url: 'import.aspx/endsystem',
                          contentType: 'application/json; charset=utf-8',
                          dataType: 'json',
                          type: 'POST',
                          success: function (response) {
                              console.log(response);
                              if (response.d === 'true') {
                                  Swal.fire(
                                      'Successfully Ended!',
                                      'You Ended!',
                                      'success'
                                  );


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
                              Swal.fire({
                                  icon: 'error',
                                  title: 'AJAX Error',
                                  text: 'An error occurred during the AJAX request: ' + response.responseText,
                              });
                          }
                      });
                  }
              });



          }



          function start() {
              // Clear previous error messages

              Swal.fire({
                  title: 'Ma Hubtaa?',
                  text: "Ma Hubtaa Inaa Bilaweyso System ka?",
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes!'
              }).then((result) => {
                  if (result.isConfirmed) {
                      // Execute the AJAX request only if the user confirms
                      $.ajax({
                          url: 'import.aspx/startsystem',
                          contentType: 'application/json; charset=utf-8',
                          dataType: 'json',
                          type: 'POST',
                          success: function (response) {
                              console.log(response);
                              if (response.d === 'true') {
                                  Swal.fire(
                                      'Successfully Started!',
                                      'You Started!',
                                      'success'
                                  );


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
                              Swal.fire({
                                  icon: 'error',
                                  title: 'AJAX Error',
                                  text: 'An error occurred during the AJAX request: ' + response.responseText,
                              });
                          }
                      });
                  }
              });



          }






          function resetgaree() {
              // Clear previous error messages

              Swal.fire({
                  title: 'Ma Hubtaa?',
                  text: "Ma Hubtaa Inaa Reset Gareneyso Codadka?",
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes!'
              }).then((result) => {
                  if (result.isConfirmed) {
                      // Execute the AJAX request only if the user confirms
                      $.ajax({
                          url: 'import.aspx/reset',
                          contentType: 'application/json; charset=utf-8',
                          dataType: 'json',
                          type: 'POST',
                          success: function (response) {
                              console.log(response);
                              if (response.d === 'true') {
                                  Swal.fire(
                                      'Successfully Reseted!',
                                      'You Reseted!',
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
                              Swal.fire({
                                  icon: 'error',
                                  title: 'AJAX Error',
                                  text: 'An error occurred during the AJAX request: ' + response.responseText,
                              });
                          }
                      });
                  }
              });



          }



          function deletegaree() {
              // Clear previous error messages

              Swal.fire({
                  title: 'Ma Hubtaa?',
                  text: "Ma Hubtaa Inaa Delete Gareneyso Codadka?",
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes!'
              }).then((result) => {
                  if (result.isConfirmed) {
                      // Execute the AJAX request only if the user confirms
                      $.ajax({
                          url: 'import.aspx/tuur',
                          contentType: 'application/json; charset=utf-8',
                          dataType: 'json',
                          type: 'POST',
                          success: function (response) {
                              console.log(response);
                              if (response.d === 'true') {
                                  Swal.fire(
                                      'Successfully Deleted!',
                                      'You Deleted!',
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
                              Swal.fire({
                                  icon: 'error',
                                  title: 'AJAX Error',
                                  text: 'An error occurred during the AJAX request: ' + response.responseText,
                              });
                          }
                      });
                  }
              });



          }


      </script>
   
    <script>
        DataBind();
        function DataBind() {
            $.ajax({
                url: 'import.aspx/DataBind',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    $("#tableStudents tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#tableStudents tbody").append(

                            "<tr style='cursor:pointer' >"
                            + "<td>" + response.d[i].std_id + "</td>"
                            + "<td>" + response.d[i].username + "</td>"
                            + "<td>" + response.d[i].password + "</td>"

                            + "</tr>")
                    }

                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        };
        function deletedata1() {

            swal({
                title: "Are you sure?",
                text: "Once deleted, you will not be able to recover this imaginary file!",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {

                        var id = document.getElementById("txtid").value
                        $.ajax({
                            url: 'importstdpass.aspx/delatadata',
                            data: "{ 'id': '" + id + "'} ",

                            dataType: "json",
                            type: 'post',
                            contentType: "application/json",

                            success: function (response) {

                                //// alert("saved")
                                //$("#myModal").modal("hide");
                                DataBind();
                            },
                            error: function (response) {
                                alert(response.responseText);

                            }
                        });
                        swal("Poof! Your imaginary file has been deleted!", {
                            icon: "success",
                        });
                    } else {
                        swal("Your imaginary file is safe!");
                        /*     $("#myModal").modal("hide");*/
                        DataBind();
                    }
                });

        };
    </script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function () {
            var table = $('#tableStudents').DataTable({
                lengthChange: false,
                buttons: ['copy', 'excel', 'csv', 'pdf', 'colvis']
            });

            table.buttons().container()
                .appendTo('#tableStudents_wrapper .col-md-6:eq(0)');
        });
    </script>
</asp:Content>
