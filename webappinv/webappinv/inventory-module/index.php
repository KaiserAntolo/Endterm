<div id="third-submenu">
  Search <input type="text" id="search-input">
</div>
<div id="subcontent">
  <?php
  switch($action) {
    case 'result':
      require_once 'inventory-module/search-user.php';
      break;
    default:
      require_once 'inventory-module/main.php';
      break; 
  }
  ?>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
  $('#search-input').on('input', function() {
    var keyword = $(this).val().trim();

    if (keyword !== '') {
      $.ajax({
        url: 'processes/search.php',
        method: 'GET',
        data: { q: keyword },
        beforeSend: function() {
          // Display loading spinner or message
          $('#subcontent').html('Searching...');
        },
        success: function(response) {
          // Update the subcontent with the search results
          $('#subcontent').html(response);
        },
        error: function() {
          // Display an error message
          $('#subcontent').html('An error occurred while searching.');
        }
      });
    } else {
      // If the search input is empty, load the default content
      $.ajax({
        url: 'inventory-module/main.php',
        method: 'GET',
        success: function(response) {
          $('#subcontent').html(response);
        },
        error: function() {
          $('#subcontent').html('An error occurred while loading the default content.');
        }
      });
    }
  });
});
</script>
