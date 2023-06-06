
<h3>Provide the Required Information</h3>
<div id="form-block">
    <form method="POST" action="processes/process.user.php?action=new">
        <div id="form-block-half">
            <label for="fname">First Name</label>
            <input type="text" id="fname" class="input" name="firstname" placeholder="Your name..">

            <label for="lname">Last Name</label>
            <input type="text" id="lname" class="input" name="lastname" placeholder="Your last name..">

            <label for="access">Access Level</label>
            <select id="access" name="access">
              <option value="Salesperson">Salesperson</option>
              <option value="Staff">Staff</option>
              <option value="Manager">Manager</option>
            </select>
        </div>
        <div id="form-block-half">
            <label for="email">Email</label>
            <input type="email" id="email" class="input" name="email" placeholder="Your email..">

            <label for="password">Password</label>
            <input type="password" id="password" class="input" name="password" placeholder="Enter password..">

            <label for="confirmpassword">Confirm Password</label>
            <input type="password" id="confirmpassword" class="input" name="confirmpassword" placeholder="Confirm password..">
            
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
