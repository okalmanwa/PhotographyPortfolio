<?php include "includes/head.php" ?>

<body>
  <?php include "includes/navbar.php" ?>
  <?php require_once "includes/init.php"; ?>


  <?php if (is_user_logged_in()) { ?>

    <?php
    $photo_id = $_GET['photo_id'] ?? null;
    $photos = null;
    $tags = [];

    $hide = "";
    $unhide = "hidden";

    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST["update"])) {
      $id = $_POST['id'];
      $title = $_POST['title'] ?? '';
      $description = $_POST['description'] ?? '';
      $date_posted = $_POST["date_posted"];
      $upload = $_FILES["image"] ?? null;

      $file_result = false;

      if ($upload["error"] == UPLOAD_ERR_OK) {
        $upload_file_name = basename($upload["name"]);
        $upload_file_ext = pathinfo($upload_file_name, PATHINFO_EXTENSION);
        $upload_storage_path = "public/uploads/photo_entries/" . $id . "." . $upload_file_ext;

        if (move_uploaded_file($upload['tmp_name'], $upload_storage_path)) {
          $photo_sql = "UPDATE photo_entries SET title = :title, description = :description, date_posted = :date_posted, file_name = :file_name, file_ext = :file_ext WHERE id = :id";
          $input = array(
            ':id' => $id,
            ':file_name' => $upload_file_name,
            ':file_ext' => $upload_file_ext,
            ':title' => $title,
            ':description' => $description,
            ':date_posted' => $date_posted,
          );
          $file_result = exec_sql_query($db, $photo_sql, $input);
        }
      }
      // this is code for the editing of the specific entries (this is for everything
      // except the photo file)

      $update_result = exec_sql_query($db, "UPDATE photo_entries SET title = :title, description = :description, date_posted = :date_posted WHERE id = :id", [
        ':title' => $title,
        ':description' => $description,
        ':date_posted' => $date_posted,
        ':id' => $id
      ]);

      if ($update_result || $file_result) {
        $hide = "hidden";
        $unhide = "";
      } else {
        echo "<p>Update failed.</p>";
      }
    }
    // $db_contents = exec_sql_query($db, "SELECT * FROM photo_entries;");
    // $allPhotos = $db_contents->fetchAll();

    if ($photo_id) {
      $result = exec_sql_query($db, "SELECT * FROM photo_entries WHERE id = :id", array(':id' => $photo_id));
      $photos = $result->fetch();
      $tags_result = exec_sql_query($db, "SELECT tags.name FROM tags INNER JOIN photo_tags ON tags.id = photo_tags.tag_id WHERE photo_tags.photo_entries_id = :id", array(':id' => $photo_id));
      $tags = $tags_result->fetchAll();
    }

    ?>

    <form method="post" action="<?php echo $move; ?>" class="<?php echo $hide; ?> editpage" enctype="multipart/form-data" novalidate>
      <input type="hidden" name="id" value="<?php echo htmlspecialchars($photos['id']); ?>">
      <div class="form-group">
        <label for="image">Image:</label>
        <img src="/public/uploads/photo_entries/<?php echo htmlspecialchars($photos['id']) . '.' . htmlspecialchars($photos['file_ext']); ?>" alt="<?php echo htmlspecialchars($photos['title']); ?>" class="adeditpic">
      </div>

      <label for="title">Title:</label>
      <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($photos['title']); ?>">

      <label for="description">Description:</label>
      <textarea id="description" name="description"><?php echo htmlspecialchars($photos['description']); ?></textarea>

      <label for="date_posted">Date Posted:</label>
      <input type="date" id="date_posted" name="date_posted" value="<?php echo htmlspecialchars($photos['date_posted']); ?>">

      <div class="form-group">
        <label for="upload-file" class="form-label strong">Photo File:</label>
        <input type="file" class="form-control-file" id="upload-file" name="image" accept=".jpg">
      </div>

      <p> Tags associated with entry </p>

      <ul>
        <?php foreach ($tags as $tag) : ?>
          <li><?php echo htmlspecialchars($tag['name']); ?></li>
        <?php endforeach; ?>
      </ul>

      <button type="submit" name="update">UPDATE</button>

    </form>


    <form method="post" action="/admin" class="<?php echo $unhide; ?> editpage" novalidate>
      <h>Update Successful. Click the next button to navigate back to view the changes made on the admin page.</h>
      <button type="submit" name="next">NEXT</button>
    </form>

  <?php } ?>

  <?php if (!is_user_logged_in()) { ?>
    <h1 class="hero  text-center p-5">Login</h1>

    <?php echo login_form('/admin', $session_messages); ?>
  <?php } ?>

</body>

</html>
