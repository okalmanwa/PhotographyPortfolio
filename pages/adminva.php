<?php include './includes/head.php' ?>

<body>
  <?php require "includes/navbar.php"; ?>
  <?php require_once "includes/init.php"; ?>





  <?php if (is_user_logged_in()) { ?>


    <!-- header -->
    <?php include "includes/adminhero.php"; ?>
    <!-- this is code for the sorting tags -->

    <?php

    $currentTagName = $_GET['tag'] ?? null;

    // filtering by tags
    if ($currentTagName !== null) {
      $photosQuery = "SELECT photo_entries.* FROM photo_entries
            INNER JOIN photo_tags ON photo_entries.id = photo_tags.photo_entries_id
            INNER JOIN tags ON photo_tags.tag_id = tags.id
            WHERE tags.name = :tag_name";
      $allPhotos = exec_sql_query($db, $photosQuery, [':tag_name' => $currentTagName])->fetchAll();
    } else {
      $photosQuery = "SELECT * FROM photo_entries";
      $allPhotos = exec_sql_query($db, $photosQuery)->fetchAll();
    }
    ?>

    <div class="row five-cols padding">
      <?php
      $tags = exec_sql_query($db, 'SELECT * FROM tags')->fetchAll();
      foreach ($tags as $tag) {
        $tag_id = $tag['id'];
        $tag_name = $tag['name'];
        include "includes/admintagtile.php";
      }
      ?>
    </div>

    <table>
      <tr>
        <th>Image</th>
        <th>Title</th>
        <th>Description</th>
        <th>Date Posted</th>
        <th> Edit </th>
      </tr>

      <?php
      foreach ($allPhotos as $photo) {
        $display = http_build_query(['id' => $photo['id']]);
        $title = $photo["title"];
        $description = $photo["description"];
        $date_posted = $photo["date_posted"];

        include "includes/admintile.php";
      }
      ?>
      <table>

      <?php } ?>

      <?php if (!is_user_logged_in()) { ?>
        <h1 class="hero text-white text-center p-5">Login</h1>

        <?php echo login_form('/admin', $session_messages); ?>
      <?php } ?>


      <?php include "includes/bootstrapJS-CDN.php" ?>

</body>

</html>
