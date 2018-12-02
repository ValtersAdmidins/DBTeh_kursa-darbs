<?php

    session_start();

    if (isset($_POST['submit'])) {

        include '../includes/database.inc.php';
        include '../includes/vehicle.inc.php';

        $user_ID = $_SESSION['u_ID'];
        $category = $_POST['category'];
        $mark = $_POST['mark'];
        $year = $_POST['year'];
        $colour = $_POST['colour'];
        $number_plate = $_POST['number_plate'];

        $insert_data = array($user_ID, $category, $mark, $year, $colour, $number_plate);

        $vehicle = new Vehicles();
        $vehicle->addVehicle($insert_data);
    }

    else {

        header("Location: ../newDriverVehicle.php");
        exit();
    }