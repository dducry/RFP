<?php
include('align.php');

$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
// Check if file already exists
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
if (file_exists($target_file)) {
	echo "Sorry, resource already exists.";
	$uploadOk = 0;
} 
// Check file size
if ($_FILES["fileToUpload"]["size"] > 500000) {
	echo "Sorry, your resource is too large to upload.";
	$uploadOk = 0;
} 
//Load JPG, JPEG, PNG, and GIF files. All other file types gives an error message before setting $uploadOk to 0:
// Allow certain file formats
if($imageFileType != "xls" && $imageFileType != "xlsx")//&& $imageFileType != "png" && $imageFileType != "jpeg"
{
	echo "Sorry, only XLS files are allowed.";
	$uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
	echo "Sorry, your resource was not uploaded.";
	// if everything is ok, try to upload file
} else {
	if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
		echo "The resource ". basename( $_FILES["fileToUpload"]["name"]). " has been referenced.";
		echo '<form action="index.php"><input type="submit" value="Go Back" /></form>';
		exec('java -cp "java/bin/:java/lib/poi-3.15/*:java/lib/apache-jena-3.2.0/lib/*:java/lib/poi-3.15/ooxml-lib/*:java/lib/poi-3.15/lib/*" rfp.ResourceToOnto --excel "uploads/' . basename( $_FILES["fileToUpload"]["name"]) . '" "' . $_POST["uri"] . '" > java-debug.log');
		unlink($target_file);
		align($target_file . '.owl');
	} else {
		echo "Sorry, there was an error uploading your resource.";
	}
}
?>
