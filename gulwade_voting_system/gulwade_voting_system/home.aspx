<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="gulwade_voting_system.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vote</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/sweetalert2.css" rel="stylesheet" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> <!-- Ensures mobile responsiveness -->

 <style>
     body {
    background-color: #f8f9fa;
    min-height: 100vh;
    margin: 0;
    display: flex;
    flex-direction: column;
    overflow-x: hidden; /* Prevent horizontal scroll */
}

.header {
    background: linear-gradient(135deg, #4A90E2, #8CCB3E);
    padding: 20px;
}

.header img {
    width: 80px;
    height: 80px;
}

.header h2 {
    color: #fff;
    font-size: 1.5rem;
}

.container-fluid {
    flex-grow: 1;
}

/* Cards styling */
.card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.card-img-top {
    border-radius: 15px;
    height: 150px;
    object-fit: cover;
}

.card-input-element {
    display: none;
}

.card-input:hover .card {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.card-input-element:checked + .card {
    border: 2px solid #4A90E2;
    background-color: #e0f7fa;
    box-shadow: 0 0 10px rgba(74, 144, 226, 0.5);
}

.btn-success {
    background-color: #28a745;
    border-color: #28a745;
}

.btn-success:hover {
    background-color: #218838;
    border-color: #1e7e34;
}

/* Responsive styles */
@media (max-width: 768px) {
    .header h2 {
        font-size: 1.2rem; /* Adjust font size for smaller screens */
    }
    .header img {
        width: 60px; /* Adjust image size on smaller screens */
        height: 60px;
    }
    .card-img-top {
        height: 120px; /* Adjust card image size for mobile */
    }
    .card-body {
        padding: 10px; /* Reduce padding on mobile */
    }
    .card-title {
        font-size: 0.9rem; /* Smaller font for card titles on mobile */
    }
    .col-12 {
        text-align: center; /* Center text on small screens */
    }
}

 </style>
</head>
<body>
    <form id="form1" runat="server">
     <!-- Header Section -->
<div class="container-fluid header py-3">
    <div class="row align-items-center text-center text-md-start">
        <div class="col-md-3 col-12 mb-3 mb-md-0">
            <img class="bg-white rounded-circle p-2" src="images/LOOGO_-_Copy-removebg-preview.png" alt="Gulwade Logo" />
            <span class="h5 d-block mt-2 text-white">Gulwade Primary And Secondary School</span>
        </div>
        <div class="col-md-6 col-12 mb-3 mb-md-0">
            <h2 class="fw-bold text-white">Student Voting System</h2>
        </div>
        <div class="col-md-3 col-12 d-flex justify-content-around text-white">
            <div>
                <span class="h5"><asp:Label ID="Label1" runat="server"></asp:Label></span>
            </div>
            <div>
                <span class="h5"><asp:Label ID="Label2" runat="server"></asp:Label></span>
            </div>
        </div>
    </div>
</div>

        <!-- Main Content -->
        <div class="container py-5">
            <h3 class="mb-4 text-primary text-center">Gudoomiyaha</h3>
            <div class="row" id="product-container"></div>

            <h3 class="mt-5 mb-4 text-primary text-center">G.Kuxigeenka</h3>
            <div class="row" id="xigeen-container"></div>

            <div class="row mt-5">
                <div class="col-12 text-center">
                    <button id="btnsubmit" class="btn btn-success btn-lg px-5 fw-bold shadow" type="button" onclick="handleSubmit()">Dhiibo Codkaaga</button>
                </div>
            </div>
        </div>

        <script src="Scripts/fastclick.js"></script>
        <script src="Scripts/jquery-3.4.1.min.js"></script>
        <script src="Scripts/sweetalert2.min.js"></script>
        <script>
            $(document).ready(function () {
                // Fetch product data (Chairperson)
                $.ajax({
                    type: 'POST',
                    url: 'home.aspx/GetProducts',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        $('#product-container').empty();
                        $.each(data.d, function (index, product) {
                            const imgSrc = `${product.ImageUrl}`;
                            const productCard = `
                                <div class="col-4 col-sm-6 col-md-4 col-lg-3 mb-4">
                                    <label class="card-input">
                                        <input type="radio" name="product" value="${product.Id}" class="card-input-element" />
                                        <div class="card p-3 h-100">
                                            <img class="card-img-top" src="${imgSrc}" alt="${product.Name}" />
                                            <div class="card-body text-center">
                                                <h6 class="card-title">${product.Name}</h6>
                                            </div>
                                        </div>
                                    </label>
                                </div>`;
                            $('#product-container').append(productCard);
                        });
                    },
                    error: function (error) {
                        console.log('Error:', error);
                    }
                });

                // Fetch xigeen data (Vice Chairperson)
                $.ajax({
                    type: 'POST',
                    url: 'home.aspx/getxigeen',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        $('#xigeen-container').empty();
                        $.each(data.d, function (index, product) {
                            const imgSrc = `${product.ImageUrl}`;
                            const productCard = `
                                <div class="col-4 col-sm-6 col-md-4 col-lg-3 mb-4">
                                    <label class="card-input">
                                        <input type="radio" name="xigen" value="${product.Id}" class="card-input-element" />
                                        <div class="card p-3 h-100">
                                            <img class="card-img-top" src="${imgSrc}" alt="${product.Name}" />
                                            <div class="card-body text-center">
                                                <h6 class="card-title">${product.Name}</h6>
                                            </div>
                                        </div>
                                    </label>
                                </div>`;
                            $('#xigeen-container').append(productCard);
                        });
                    },
                    error: function (error) {
                        console.log('Error:', error);
                    }
                });
            });

            var productValue;
            var xigenValue;

            function handleSubmit() {
                // Get the selected product value from the dynamic radio button
                productValue = $('input[name="product"]:checked').val();
                // Get the selected xigen value from the dynamic radio button
                xigenValue = $('input[name="xigen"]:checked').val();

                var std = document.getElementById("Label1").innerText;
                var name = document.getElementById("Label2").innerText;

                // Map productValue and xigenValue to their corresponding names dynamically
                var productName = mapValueToName('product', productValue);
                var xigenName = mapValueToName('xigen', xigenValue);

                // If either value is undefined, log an error
                if (!productValue || !xigenValue) {
                    productName = productName || 'Unknown Product';
                    xigenName = xigenName || 'Unknown Xigen';
                    console.log("Please select both a product and a xigen.");
                    showInvalidSelectionDialog(std, name, productName, xigenName);
                    return;
                }

                // Show confirmation dialog only if both product and xigen are selected
                showConfirmationDialog(std, name, productName, xigenName);
            }

            function mapValueToName(type, value) {
                if (type === 'product') {
                    // Correctly find the product name based on the selected value
                    return $('input[name="product"][value="' + value + '"]').closest('label').find('.card h6').text() || 'Unknown Product';
                } else if (type === 'xigen') {
                    // Correctly find the xigen name based on the selected value
                    return $('input[name="xigen"][value="' + value + '"]').closest('label').find('.card h6').text() || 'Unknown Xigen';
                }
            }


            // Function to show confirmation dialog
            function showConfirmationDialog(std, name, productName, xigenName) {
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: "btn btn-success fw-bold",
                        cancelButton: "btn btn-danger fw-bold",
                        content: 'text-bold text-bigger text-blue text-green'
                    },
                    buttonsStyling: false,
                    onOpen: (popup) => {
                        const confirmButton = popup.querySelector('.swal2-confirm');
                        if (confirmButton) {
                            confirmButton.style.marginRight = '10px';
                        }
                    }
                });

                swalWithBootstrapButtons.fire({
                    title: "Ma Hubtaa Codkaaga?",
                    html: `<span class="fw-bold fs-5 text-primary">Gudoomiyaha:<br> ${productName}</span><br> 
               <span class="fw-bold fs-5 text-success">G.Kuxigeenka:<br> ${xigenName}</span>`,
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Haa, Waan Hubaa!",
                    cancelButtonText: "Maya,Ma Hubi!",
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        submitData(std, name, productValue, xigenValue);
                    } else if (result.dismiss === Swal.DismissReason.cancel) {
                        showCancelledDialog();
                    }
                });
            }

            // Function to handle invalid selections
            function showInvalidSelectionDialog(std, name, productName, xigenName) {
                Swal.fire({
                    title: "Ayaga Dhan Wada Dooro",
                    text: `Fadlan Dooro Gudoomiyaha Iyo G.Kuxigeenka.`,
                    icon: "error"
                });
            }

            // Function to submit the selected data
            function submitData(std, name, productValue, xigenValue) {
                $.ajax({
                    url: 'home.aspx/submitData',
                    data: JSON.stringify({
                        std: std,
                        name: name,
                        productValue: productValue,
                        xigenValue: xigenValue
                    }),
                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        Swal.fire({
                            title: "Waad Dhiibata Codkaaga!",
                            text: "Mahadsanid Sidaad Codkaaga U Dhiibatay.",
                            icon: "success",
                            timer: 3000,
                            showConfirmButton: false
                        }).then(() => {
                            window.location.href = "login.aspx";
                        });
                        document.getElementById("btnsubmit").style.display = "none";

                    },
                    error: function (response) {
                        Swal.fire({
                            title: "Error",
                            text: "An error occurred: " + response.statusText,
                            icon: "error",
                            timer: 3000,
                            showConfirmButton: false
                        });
                    }
                });
            }

            // Function to show cancellation dialog
            function showCancelledDialog() {
                Swal.fire({
                    title: "Waad Ka Laabatay",
                    text: "Wali Maadan Codeen.",
                    icon: "error",
                    timer: 3000,
                    showConfirmButton: false
                });
            }
        </script>
    </form>
</body>
</html>
