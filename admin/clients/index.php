<?php if ($_settings->chk_flashdata('success')) : ?>
	<script>
		alert_toast("<?php echo $_settings->flashdata('success') ?>", 'success')
	</script>
<?php endif; ?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">Danh sách khách hàng</h3>
	</div>
	<div class="card-body">
		<div class="container-fluid">
			<table class="table table-hover table-striped" id="list">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="35%">
					<col width="20%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>#</th>
						<th>Ngày khởi tạo</th>
						<th>Tên</th>
						<th>Email</th>
						<th>Trạng thái</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					$qry = $conn->query("SELECT *,concat(firstname,' ',lastname) as fullname from `clients` where delete_flag = 0 order by concat(firstname,' ',lastname) asc ");
					while ($row = $qry->fetch_assoc()) :
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td><?php echo date("Y-m-d H:i", strtotime($row['date_created'])) ?></td>
							<td><?php echo $row['fullname'] ?></td>
							<td><?php echo $row['email'] ?></td>
							<td class="text-center">
								<?php if ($row['status'] == 1) : ?>
									<span class="badge badge-success px-3 rounded-pill">Đang hoạt động</span>
								<?php else : ?>
									<span class="badge badge-danger px-3 rounded-pill">Ngừng hoạt động</span>
								<?php endif; ?>
							</td>
							<td align="center">
								<button type="button" class="btn btn-flat p-1 btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
									Hành động
									<span class="sr-only">Chuyển đổi danh sách</span>
								</button>
								<div class="dropdown-menu" role="menu">
									<a class="dropdown-item edit_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-edit text-primary"></span>Sửa</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span>Xóa</a>
								</div>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('.delete_data').click(function() {
			_conf("Bạn có chắc muốn xóa khách hàng này vĩnh viễn?", "delete_client", [$(this).attr('data-id')])
		})
		$('.edit_data').click(function() {
			uni_modal("<i class='fa fa-edit'></i>Cập nhật thông tin khách hàng", "clients/manage_client.php?id=" + $(this).attr('data-id'))
		})
		$('.table').dataTable({
			columnDefs: [{
				orderable: false,
				targets: [4, 5]
			}],
			order: [0, 'asc']
		});
		$('.dataTable td,.dataTable th').addClass('py-1 px-2 align-middle')
	})

	function delete_client($id) {
		start_loader();
		$.ajax({
			url: _base_url_ + "classes/Master.php?f=delete_client",
			method: "POST",
			data: {
				id: $id
			},
			dataType: "json",
			error: err => {
				console.log(err)
				alert_toast("An error occured.", 'error');
				end_loader();
			},
			success: function(resp) {
				if (typeof resp == 'object' && resp.status == 'success') {
					location.reload();
				} else {
					alert_toast("An error occured.", 'error');
					end_loader();
				}
			}
		})
	}
</script>