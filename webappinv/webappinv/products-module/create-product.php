<h3>Provide the Required Information</h3>
<div id="form-block">
    <form method="POST" action="processes/process.product.php?action=newproduct">
        <div id="form-block-center">
            <label for="fname">Product Name</label>
            <input type="text" id="pname" class="input" name="pname" placeholder="Product name..">

            <label for="lname">Description</label>
            <textarea id="desc" class="input" name="desc" placeholder="Description.."></textarea>
            
            <label for="fname">Product Retail Price</label>
            <input type="text" id="price" class="input" name="price" placeholder="Product price..">

            <label for="ptype">Type</label>
            <select id="ptype" name="ptype">
            <option value="T-ShirtM">T-Shirt(MEN)</option>
            <option value="T-ShirtF">T-Shirt(WOMEN)</option>
            <option value="pants">Pants</option>
            <option value="sando">Sando</option>
            <option value="jersey">Jersey</option>
            <option value="shortsM">Shorts(MEN)</option>
            <option value="shortsW">Shorts(WOMEN)</option>
              <?php
              if($product->list_types() != false){
                foreach($product->list_types() as $value){
                   extract($value);
              ?>
              <option value="<?php echo $type_id;?>"><?php echo $type_name;?></option>
              <?php
                }
              }
              ?>
        </select>
              </div>
        <div id="button-block">
        <input type="submit" value="Save">
        </div>
  </form>
</div>
<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $firstname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $access = $_POST["access"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $confirmpassword = $_POST["confirmpassword"];

    // Check if any of the fields is blank
    if (empty($firstname) || empty($lastname) || empty($access) || empty($email) || empty($password) || empty($confirmpassword)) {
        echo "<p style='color: red;'>Error: Please fill in all fields.</p>";
    } else {
        // Proceed with saving the data or performing other actions
        // ...
    }
}
?>