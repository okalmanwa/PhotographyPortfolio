<?php
$currentTagName = $_GET['tag'] ?? '';
$activeClass = ($currentTagName == $tag_name) ? 'active-tag' : '';
?>
<div class="col-custom">
    <div class="list-group">
        <a href="?<?= http_build_query(['tag' => $tag_name]) ?>" class="list-group-item list-group-item-action tag <?= $activeClass ?>">
            <?= htmlspecialchars($tag_name) ?>
        </a>
    </div>
</div>
