<?php

	// install path
	$path = '../';
	$install = 'install';
	$dir = $path.$install;

	// include files
	require_once('database/database.inc.php');
	require_once('includes/core_class.php');
	require_once('includes/database_class.php');
	require_once('includes/functions.php');

	// check file exists
	if(!file_exists($db_inc_file)){
		header('Location: index.php');
	}

	// install folder delete
	if (isset($_POST['delete'])) {
		if (is_dir($dir)) {
			if(file_exists($db_inc_file))
			{
				emptyDir($dir);
				rmdir($dir);
				header('Location: '.$path.'');
			}
		}
	}
require_once('header.php');
?>
						<?php if(file_exists($db_inc_file)){ ?>
							<div class="text-center">
								<h4 class="mb-3">Welcome to <?php echo APP_TITLE; ?> Installation</h4>
							</div>
							<form method="post">
								<div class="bg-light p-3 mb-4">
									<h4>Step 5 / 5</h4>
									<p class="mb-0">Completed</p>
								</div>
								<div class="alert alert-success"><i class="mdi mdi-check-circle-outline"></i> Application is successfully installed, please click here to login now.</div>
								<?php if(file_exists($db_inc_file)){ ?>
								<div class="alert alert-warning"><i class="mdi mdi-check-circle-outline"></i> database.inc.php file is successfully installed</div>
								<?php } ?>
								<div class="alert alert-danger"><i class="mdi mdi-information-outline"></i> <b>Note:</b> Please delete install folder for security purpose</div>
								<div class="form-controls">
									<button type="submit" name="delete" class="btn btn-danger" rel="tooltip" data-placement="top" title="Click here to delete">Delete</button>
								</div>
							</form>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
	</div>

<?php require_once('footer.php'); ?>