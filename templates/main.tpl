<!DOCTYPE html>
<html>
  <head>
    <title>Temecula Catering - Application</title>
    <link rel="stylesheet" type="text/css" href="css/application.css">
    <link rel="stylesheet" type="text/css" href="css/ui-lightness/jquery-ui-1.10.3.custom.min.css">
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
      $(".datepicker").datepicker();
    });
    </script>
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <img src="http://temecula-catering.com/images/HomeBanner2.jpg" alt="temecula catering">
      </div>
      <div id="content">
        <h1>Temecula Catering Employment Application</h1>
        <p>Thank you for your interest in employment with Temecula Catering. Please fill out the fields below for consideration.</p>
        <form action="{* action needed *}" method="POST" enctype="multipart/form-data">
          <fieldset>
            <legend>Contact Information</legend>
            <label for="last_name">Last Name:</label>
            <input id="last_name" type="text" name="last_name">
            <label for="first_name">First Name:</label>
            <input id="first_name" type="text" name="first_name">
            <label for="middle_initial">Middle Initial</label>
            <input id="middle_initial" type="text" name="middle_initial">
            {include file='address.tpl' id_prefix='' name_prefix='contact_' address_to_label='Address'}
            <label for="driver_license">Driver License Number:</label>
            <input id="driver_license" type="text" name="driver_license">
            <label for="phone_number">Phone Number</label>
            <input id="phone_number" type="text" name="phone_number">
          </fieldset>
          <fieldset>
            <legend>Applicant History</legend>
            <label for="date_available">Date Available:</label>
            <input id="date_available" class="datepicker" type="text" name="date_available">

          </fieldset>
        </form>
      </div>
      <div id="footer">
        <p>Copyright {$smarty.now|date_format:"%Y"} Temecula Catering</p>
      </div>
    </div>
  </body>
</html>