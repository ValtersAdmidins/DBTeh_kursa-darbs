<?php

    include_once 'header.php';
    include 'includes/database.inc.php';
    include 'includes/location.inc.php';
    include 'includes/vehicle.inc.php';
?>

<main>

    <?php

        if (isset($_SESSION['u_ID']) && $_SESSION['u_role'] == 2) {

    ?>

    <h2 style="text-align: center;">Izveidot jaunu šofera maršrutu</h2>
    
    <div class="container">
        <form id="routeForm" action="process/addingNewRoute.php" method="POST">

            <div class="form-group">
                <div class="form-inline">
                    <label for="country_from">Valsts no: </label>
                    <select id="country_from" class="form-control col" name="country_from" required>
                        <option value="">Izvēlēties valsti*</option>
                        <?php

                            $countries = new Location();
                            $countries->showAllCountries();

                        ?>
                    </select>
                    <label for="city_from">Pilsēta no: </label>
                    <select id="city_from" class="form-control col" name="city_from" required>
                        <option value="">Izvēlēlieties valsti vispirms*</option>
                        <!-- ajax html option here [js/locationSelection.js] -->
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <div class="form-inline">
                    <label for="country_to">Valsts uz: </label>
                    <select id="country_to" class="form-control col" name="country_to" required>
                        <option value="">Izvēlēties valsti*</option>
                        <?php

                            $countries = new Location();
                            $countries->showAllCountries();

                        ?>
                    </select>

                    <label for="city_to">Pilsēta uz: </label>
                    <select id="city_to" class="form-control col" name="city_to" required>
                        <option value="">Izvēlēlieties valsti vispirms*</option>
                        <!-- ajax html option here [js/locationSelection.js] -->
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <div class="form-inline">
                    <label for="address_from">Adresse no: </label>
                    <input type="text" maxlength="20" class="form-control col" name="address_from" placeholder="Adrese no">
                    
                    <label for="address_to">Adresse uz: </label>
                    <input type="text" maxlength="20" class="form-control col" name="address_to" placeholder="Adrese uz">
                </div>
            </div>

            <div class="form-group">
                <label for="departure_time">Izbraukšanas laiks: </label>
                <input id="datetimepicker" class="form-control" type="text" name="departure_time" required>
            </div>

            <div class="form-group">
                <label for="price">Piedāvātā samaksa:</label>
                <input type="number" class="form-control" min="0" name="price">
            </div>

            <div class="form-group">
                <label for="seats">Pieejamās sēdvietas: </label>
                <input type="number" class="form-control" min="1" name="seats">
            </div>

            <div class="form-group">
                <label for="vehicle">Izvēlēlieties transportalīdzekli: </label>
                <select id="vehicle" class="form-control col" name="vehicle" required>
                    <option value="">Izvēlēlieties transportalīdzekli*</option>
                    <?php

                        $vehicle = new Vehicles();
                        $vehicle->showAllMyVehiclesInForm();

                    ?>
                </select>
            </div>

            <button class="btn btn-primary" type="submit" name="submit">Izveidot maršrutu!</button>
        </form>
    </div> 
            
    <?php

        }
    
    ?>

</main>

<?php

include_once 'footer.php';

?>