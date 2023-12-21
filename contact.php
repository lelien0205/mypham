<?php
    require 'send_contact.php';
    if(isset($_POST['btn-contact'])){

        $email = $_POST['email'];
        $title = $_POST['title'];
        $contact_content = $_POST['contact_content'];
        if(!empty($email) && !empty($title) && !empty($contact_content))
        {
            $sql = "INSERT INTO `contact` (`email`, `title`, `contact_content`) VALUES ('$email', '$title', '$contact_content')";
            if($conn->query($sql) === true)
            {
                $response = array('status' => 'success', 'message' => 'Gửi liên hệ thành công!');
                echo json_encode($response);
            }
            else
            {
                $response = array('status' => 'error', 'message' => 'Có lỗi xảy ra khi lưu dữ liệu.');
                echo json_encode($response);
            }
        }
        else
        {
            echo "Chưa nhập đủ thông tin";
        }
    }


   $response = array('status' => 'success', 'message' => 'Gửi liên hệ thành công!');
   echo json_encode($response);
   exit();
?>