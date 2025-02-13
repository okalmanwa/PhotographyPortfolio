<div>
    <a href="<?= $photoDetailsUrl ?>" class="card-link">
        <div class="col setWidth">
            <div class="card h-100">
                <img src="/public/uploads/photo_entries/<?= htmlspecialchars($photo['id']) . '.' . htmlspecialchars($photo['file_ext']) ?>" class="card-img-top" alt="<?= htmlspecialchars($photo['title']) ?>">
                <div class="card-body">
                    <h5 class="card-title"><?= htmlspecialchars($photo['title']) ?></h5>
                    <p class="photo-description"><?= htmlspecialchars($photo['description']) ?></p>
                </div>
            </div>
        </div>
    </a>

</div>
