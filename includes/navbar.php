<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">LensLore 📸</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item list">
          <a class="nav-link" href="/">Home</a>
        </li>
        <li class="nav-item list">
          <a class="nav-link" href="/">upload-photo</a>
        </li>

        <?php if (is_user_logged_in()) { ?>
          <li class="nav-item list">
          <a class="nav-link" href="/admin">Admin</a>
        </li>
        <?php } ?>

        <?php if (is_user_logged_in()) { ?>
          <li class="right nav-link logout-link button-logout">
            <a href="<?php echo logout_url(); ?>">Log out
            </a>
          </li>
        <?php } ?>

      </ul>
    </div>
  </div>
</nav>
