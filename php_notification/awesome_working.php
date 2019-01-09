
<?php

$deviceToken = '9e6b78125b944d0aabbbd13048953ffe8b0b7fc5ec073e9fff349f51a2b76701';

    
// Put your private key's passphrase here:
    // Put your private key's passphrase here:
     $passphrase = 'Temp1234';
    $ctx = stream_context_create();
    
    stream_context_set_option($ctx, 'ssl', 'local_cert', './ck.pem');
    stream_context_set_option($ctx, 'ssl', 'cafile', './entrust_2048_ca.cer');
    
    stream_context_set_option($ctx, 'ssl', 'verify_peer', true);
    // stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);
    
    $fp = stream_socket_client('ssl://gateway.sandbox.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);

if (!$fp) {
    exit("Failed to connect: $err $errstr" . PHP_EOL);
}

echo 'Connected to APNS' . PHP_EOL . "<br />";

    
// Create the payload body
$body['aps'] = array(
	'alert' => array(
		'title' => 'Sample push number ' . mt_rand(100, 999),
		'body' => 'Sample push body goes here'
	),
	'badge' => 9,
	'sound' => 'default',
	'mutable-content' => 1,
	'category' => 'rich-apns'
);


$payload = json_encode($body);

// Build the binary notification
$msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;




    
    // Send it to the server
    $result = fwrite($fp, $msg, strlen($msg));
    


    if (!$result)
    echo 'Message not delivered' . PHP_EOL;
    else
    echo 'Message successfully delivered';
    
    // Close the connection to the server
    fclose($fp);
    
    
