<tr>
   <td>
    <img src="/public/uploads/photo_entries/<?php echo htmlspecialchars($photo['id']) . '.' . htmlspecialchars($photo['file_ext']); ?>" alt="" class = "adminpic">
  </td>

  <td><?php echo htmlspecialchars($title); ?></td>
  <td><?php echo htmlspecialchars($description); ?></td>
  <td><?php echo htmlspecialchars($date_posted); ?></td>


  <td>
    <a class="contrastadmin" href="/entry/edit?<?php echo http_build_query(array('photo_id' => $photo['id'])); ?>">EDIT</a>
  </td>

</tr>
