            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer bg-white text-center">
                All Rights Reserved by Clipping Path House. © 2021 – 2025
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->

    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <!-- <script src="assets/js/jquery.min.js"></script> -->
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
    <!-- sweetalert plugin js -->
    <script src="assets/sweetalert/sweetalert.min.js"></script>
    <!--Wave Effects -->
    <script src="assets/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="assets/js/sidebarmenu.js"></script>
    <!--Datatables -->
    <script src="assets/js/datatables.min.js"></script>

    <!-- buttons plugin js -->
    <script src="assets/buttons/dataTables.buttons.js"></script>
    <!--Custom JavaScript -->
    <script src="assets/js/custom.js"></script>
    <script>
        /****************************************
         *       Basic Table                   *
         ****************************************/
        $('#zero_config').DataTable({
            "aaSorting": [ [0,'desc'] ],
        });
    </script>
    <script>
        
        function show_control(cmb, elem1, elem2){
            //alert(elem1);
            if(document.getElementsByName(cmb)[0].value == 'Other'){
                document.getElementById(elem1).style.display = '';
                document.getElementById(elem2).style.display = '';
            }
            else{
                document.getElementById(elem1).style.display = 'none';
                document.getElementById(elem2).style.display = 'none';
            }
        }
        function job_submit(){
            var user_id = '<?php echo $user_id;?>';
            var job_title = $("#txt_name").val();
            var file_dir_name =$("#txt_file_dir").val();
            var main_service =$("#service").val();
            var add_service =$("#additionalservice").val();
            var format=$("#fileformate").val();
            if(format=='Other'){
                var format=$("#txt_file_format").val();
            }
            var delivery_time =$("#delivarytime").val();
            if(delivery_time=='Other'){
                var delivery_time =$("#txt_delivery_time").val();
            }
            var job_instruction=$("#txt_job_instruction").val();
            var totaljobfile=$("#numberoffile").val();
            var total_files = document.getElementById('files_table').rows.length;
            //alert(total_files);
            var job_instruction = document.getElementsByName('txt_job_instruction')[0].value;
            if(job_title == '' || delivery_time == '' || main_service == '' || format == ''){
                alert('Fill up all required fields');
                return false;
            }
            if(document.getElementById('files_table').rows.length == 0){
                alert('Upload your files');
                return false;
            }
            
            if(document.getElementsByName('txt_check')[0].value == ''){
                alert('Upload files first');
                return false;
            }
            $('input[type="submit"]').attr('disabled','disabled');
            register_job_http = new XMLHttpRequest();
            register_job_http.onload = function(){
                swal({
                            title: "Job Submitted",
                            text: register_job_http.responseText,
                            type: "success",
                            showCancelButton: false,
                            confirmButtonColor: "#28a745",
                            confirmButtonText: "Yes",
                            closeOnConfirm: false
                            },
                        function () {
                            window.location.href="create_job.php";
                            });
            
            }
            register_job_http.open("POST", "../upload_plugin/register_job_submit.php", false);
            register_job_http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            register_job_http.send('user_id='+user_id+'&&job_title='+job_title+'&&main_service='+main_service+'&&add_service='+add_service+'&&format='+format+'&&delivery_time='+delivery_time+'&&total_files='+totaljobfile+'&&job_instruction='+job_instruction+'&&file_dir_name='+file_dir_name);
        }
        function button_hover(){
            document.getElementsByName('btn_job_submit')[0].style.background = 'green';
        }
        function button_out(){
            document.getElementsByName('btn_job_submit')[0].style.background = '#4DAE4D';
        }
    
    </script>
    <script>
    $(document).ready(function () {
        
        function readURL(input) {
          if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function(e) {
              $('#blah').attr('src', e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);
          }
        }
        
        $("#imgInp").change(function() {
            // alert("hi");
          readURL(this);
        });
        
        $('#searchresult').click(function(){ 
            var startdate = $('#startdate').val();
            var enddate = $('#enddate').val();
            var paymmentst = $('#paymmentst').val();
            $.ajax({
                url: "loadjobhistorry.php",
                method: "POST",
                data: {startdate:startdate,enddate:enddate,paymmentst:paymmentst},
                dataType: "text",
                success:function(data){
                    $('#job_data').html(data);
                }
            });
        });
    });
    
    function createpdf(){
        $("#pdfgenerator").submit();
    }
    </script>

</body>

</html>