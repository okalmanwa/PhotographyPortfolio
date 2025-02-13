<body>
    <?php include "includes/navbar.php"; ?>
    <div class="photo-container mt-5">
        <?php if ($photo) : ?>

            
            <figure class="photo-figure">
                <img src="/public/uploads/photo_entries/<?= htmlspecialchars($photo['id']) . '.' . htmlspecialchars($photo['file_ext']) ?>" alt="<?= htmlspecialchars($photo['title']) ?>" class="photo-img">
            </figure>


            <h1 class="photo-title"><?= htmlspecialchars($photo['title']) ?></h1>
            <p class="photo-description"><?= htmlspecialchars($photo['description']) ?></p>
            <p class="photo-date"><strong>Date Posted:</strong> <?= htmlspecialchars($photo['date_posted']) ?></p>
            <p class="photo-tags"><strong>Tags:</strong>

                <?php
                if (!empty($tags)) {
                    foreach ($tags as $tag) {
                        $tag_name = $tag['name'];
                        include 'includes/tags_tile.php';
                    }
                }
                ?>
            </p>
            <?php if (!empty($photo['source'])) : ?>
                <p class="strong"><a href="<?= htmlspecialchars($photo['source']) ?>" target="_blank">Image source</a></p>
            <?php endif; ?>
            <a href="/" class="contrast home">
                << Back</a>
                <?php else : ?>
                    <p>Photo not found.</p>
                <?php endif; ?>
    </div>
    <?php include "includes/bootstrapJS-CDN.php"; ?>
</body>

</html>
