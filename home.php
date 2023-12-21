<style>
    .carousel-item>img {
        object-fit: fill !important;
    }

    #carouselExampleControls .carousel-inner {
        height: 280px !important;
    }
</style>
<?php
$brands = isset($_GET['b']) ? json_decode(urldecode($_GET['b'])) : array();
?>
<section class="py-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-2 px-1 border-right text-sm position-sticky ">
                <h6><b>Các thương hiệu nổi bật</b></h6>
                <ul class="list-group">
                    <a href="" class="list-group-item list-group-item-action">
                        <div class="icheck-primary d-inline">
                            <input type="checkbox" id="brandAll">
                            <label for="brandAll">
                                Tất cả
                            </label>
                        </div>
                    </a>
                    <?php
                    $qry = $conn->query("SELECT * FROM brands where status =1 ");
                    while ($row = $qry->fetch_assoc()) :
                    ?>
                        <li class="list-group-item list-group-item-action">
                            <div class="icheck-primary d-inline">
                                <input type="checkbox" id="brand-item-<?php echo $row['id'] ?>" <?php echo in_array($row['id'], $brands) ? "checked" : "" ?> class="brand-item" value="<?php echo $row['id'] ?>">
                                <label for="brand-item-<?php echo $row['id'] ?>">
                                    <?php echo $row['name'] ?>
                                </label>
                            </div>
                        </li>
                    <?php endwhile; ?>
                </ul>
            </div>
            <div class="col-lg-10 py-2">
                <div class="row">
                    <div class="col-md-12">
                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <?php
                                $upload_path = "uploads/banner";
                                if (is_dir(base_app . $upload_path)) :
                                    $file = scandir(base_app . $upload_path);
                                    $_i = 0;
                                    foreach ($file as $img) :
                                        if (in_array($img, array('.', '..')))
                                            continue;
                                        $_i++;
                                ?>
                                        <div class="carousel-item h-100 <?php echo $_i == 1 ? "active" : '' ?>">
                                            <img src="<?php echo validate_image($upload_path . '/' . $img) ?>" class="d-block w-100  h-100" alt="<?php echo $img ?>">
                                        </div>
                                    <?php endforeach; ?>
                                <?php endif; ?>
                            </div>
                            <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Trước</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Tiếp</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-4 row-cols-md-3 row-cols-xl-4 ">
                        <?php
                        $where = "";
                        if (count($brands) > 0)
                            $where = " and p.brand_id in (" . implode(",", $brands) . ") ";
                        $products = $conn->query("SELECT p.*,b.name as bname,c.category FROM `products` p inner join brands b on p.brand_id = b.id inner join categories c on p.category_id = c.id where p.status = 1 {$where} order by rand() ");
                        while ($row = $products->fetch_assoc()) :
                            $upload_path = base_app . '/uploads/product_' . $row['id'];
                            $img = "";
                            if (is_dir($upload_path)) {
                                $fileO = scandir($upload_path);
                                if (isset($fileO[2]))
                                    $img = "uploads/product_" . $row['id'] . "/" . $fileO[2];
                                // var_dump($fileO);
                            }
                            foreach ($row as $k => $v) {
                                $row[$k] = trim(stripslashes($v));
                            }
                            $inventory = $conn->query("SELECT distinct(`price`) FROM inventory where product_id = " . $row['id'] . " order by `price` asc");
                            $inv = array();
                            while ($ir = $inventory->fetch_assoc()) {
                                $inv[] = format_num($ir['price']);
                            }
                            $price = '';
                            if (isset($inv[0]))
                                $price .= $inv[0];
                            if (count($inv) > 1) {
                                $price .= " ~ " . $inv[count($inv) - 1];
                            }
                        ?>
                            <div class="col mb-5">
                                <a class="card product-item text-reset text-decoration-none" href=".?p=view_product&id=<?php echo md5($row['id']) ?>">
                                    <!-- Product image-->
                                    <div class="overflow-hidden shadow product-holder">
                                        <img class="card-img-top w-100 product-cover" src="<?php echo validate_image($img) ?>" alt="..." />
                                    </div>
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder"><?php echo $row['name'] ?></h5>
                                            <!-- Product price-->
                                            <span><b class="text-muted">Giá: </b><?php echo $price ?>&#8363;</span>
                                        </div>
                                        <p class="m-0"><small><span class="text-muted">Thương hiệu:</span> <?php echo $row['bname'] ?></small></p>
                                        <p class="m-0"><small><span class="text-muted">Danh mục:</span> <?php echo $row['category'] ?></small></p>
                                    </div>
                                </a>
                            </div>
                        <?php endwhile; ?>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact Section Button -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="dist/css/contact.css">
        <div>
            <div class="contact-button" data-toggle="modal" data-target="#exampleModal">
                <div class="button-circle">
                    <div class="echo-effect"></div>
                    <div class="button-icon">
                        <i class="fas fa-phone-alt fa-flip-horizontal"></i>
                    </div>
                </div>
            </div>
        </div>

        <!--contact form-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Liên hệ với chúng tôi</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="contact.php" method="post" id="contact-form">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Email:</label>
                                <input type="text" class="form-control" id="recipient-name" name="email">
                            </div>
                            <div class="form-group">
                                <label for="recipient-title" class="col-form-label">Tiêu đề:</label>
                                <input type="text" class="form-control" id="recipient-title" name="title">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Nội dung liên hệ:</label>
                                <textarea class="form-control" id="message-text" name="contact_content"></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-primary" name="btn-contact">Liên hệ</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    function _filter() {
        var brands = []
        $('.brand-item:checked').each(function() {
            brands.push($(this).val())
        })
        _b = JSON.stringify(brands)
        var checked = $('.brand-item:checked').length
        var total = $('.brand-item').length
        if (checked == total)
            location.href = "./?";
        else
            location.href = "./?b=" + encodeURI(_b);
    }

    function check_filter() {
        var checked = $('.brand-item:checked').length
        var total = $('.brand-item').length
        if (checked == total) {
            $('#brandAll').attr('checked', true)
        } else {
            $('#brandAll').attr('checked', false)
        }
        if ('<?php echo isset($_GET['b']) ?>' == '')
            $('#brandAll,.brand-item').attr('checked', true)
    }
    $(function() {
        check_filter()
        $('#brandAll').change(function() {
            if ($(this).is(':checked') == true) {
                $('.brand-item').attr('checked', true)
            } else {
                $('.brand-item').attr('checked', false)
            }
            _filter()
        })
        $('.brand-item').change(function() {
            _filter()
        })
    })

    $('#contact-form').submit(function(e) {
        e.preventDefault();
        console.log("Form submitted!");
        start_loader();
        if ($('.err-msg').length > 0)
            $('.err-msg').remove();

        // Append the 'btn-contact=true' parameter to the serialized form data
        var formData = $(this).serialize() + '&btn-contact=true';

        $.ajax({
            url: _base_url_ + "contact.php?f=contact",
            method: "POST",
            data: formData,
            dataType: "json",
            error: function(xhr, status, error) {
                console.log(xhr.responseText);
                alert_toast("An error occurred", 'error');
                end_loader();
            },
            success: function(resp) {
                if (typeof resp == 'object' && resp.status === 'success') {
                    alert_toast("Contact Successfully", 'success');
                    $('#exampleModal').modal('hide');
                    setTimeout(function() {
                        location.reload();
                    }, 2000);
                } else if (!!resp.msg) {
                    var _err_el = $('<div>');
                    _err_el.addClass("alert alert-danger err-msg").text(resp.message);
                    $('#contact-form').prepend(_err_el);
                    end_loader();
                } else {
                    console.log(resp);
                    alert_toast("An error occurred", 'error');
                    end_loader();
                }
            }
        });
    });
</script>