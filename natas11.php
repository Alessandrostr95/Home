<?php
        //Enter your code here, enjoy!

function xor_encrypt($in) {
    $key = '<censored>';
    $text = $in;
    $outText = '';

    // Iterate through each character
    for($i=0;$i<strlen($text);$i++) {
    $outText .= $text[$i] ^ $key[$i % strlen($key)];
    }

    return $outText;
}

$d = array( "showpassword"=>"yes", "bgcolor"=>"#ffffff");

#print base64_encode(xor_encrypt(json_encode("{\'showpassword\':\'yes\',\'bgcolor\':\'#ffffff\'}")));


print base64_encode(xor_encrypt(json_encode($d)));
print '    ';
print base64_encode(xor_encrypt(json_encode($d,true)));





#test che funziona
$x = base64_encode(xor_encrypt(json_encode($d)));
$tempdata = json_decode(xor_encrypt(base64_decode($x)), true);
if(is_array($tempdata) && array_key_exists("showpassword", $tempdata) && array_key_exists("bgcolor", $tempdata)) {
    if (preg_match('/^#(?:[a-f\d]{6})$/i', $tempdata['bgcolor'])) {
        print $tempdata["showpassword"];
    }
}

