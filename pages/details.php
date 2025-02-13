<?php
include './includes/head.php';
require_once "includes/init.php";

$photo_id = $_GET['id'] ?? null;
$photo_id = (int)$photo_id;  

$photo = false;

if ($photo_id > 0) {

    $photo = exec_sql_query($db, "SELECT * FROM photo_entries WHERE id = :id", array(":id" => $photo_id))->fetch();

    if ($photo) {
        $tags = exec_sql_query($db, "SELECT tags.name FROM tags
                                     JOIN photo_tags ON tags.id = photo_tags.tag_id
                                     WHERE photo_tags.photo_entries_id = :photo_id", array(":photo_id" => $photo_id))->fetchAll();
    }
}

include "includes/photo-details.php";
