<?php

$curl = curl_init();

$data = [
    "channel_id" => getenv('PLUGIN_CHANNEL_ID'),
    "message" => "訊息".getenv('PLUGIN_MSG').". build".getenv("build.status"),
];

curl_setopt_array($curl, array(
    CURLOPT_URL => getenv('PLUGIN_URL')."/api/v4/posts",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "POST",
    CURLOPT_POSTFIELDS => json_encode($data),
    CURLOPT_HTTPHEADER => array(
        "Content-Type: application/json",
        "Authorization: Bearer " . getenv('PLUGIN_TOKEN'),
        "Accept: application/json"
    ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;
