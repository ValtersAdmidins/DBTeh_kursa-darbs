<?php

class Login extends Database {

    public function loginUser($user_data) {

        session_start();
        $conn = $this->connect();

        $userORemail = $conn->real_escape_string($user_data[0]);
        $password = $conn->real_escape_string($user_data[1]);

        //Error handlers
        //Check if inputs are empty
        if (empty($userORemail) || empty($password)) {

            header("Location: ../index.php?login=empty");
            exit();
        }
        
        else {

            $sql = "SELECT * FROM lietotaji WHERE lietotajvards='$userORemail' OR epasts='$userORemail'";
            $resultUsers = $this->connect()->query($sql);
            $resultCheck = $resultUsers->num_rows;

            if ($resultCheck < 1) {

                header("Location: ../index.php?login=error");
                exit();
            }
            
            else {

                if ($rowUsers = $resultUsers->fetch_assoc()) {
                    
                    //De-hashing the password
                    $hashedPwdCheck = password_verify($password, $rowUsers['parole']);
                    if ($hashedPwdCheck == false) {

                        header("Location: ../index.php?login=error");
                        exit();
                    } 
                    
                    else if ($hashedPwdCheck == true) {

                        //Log in the user here
                        $_SESSION['u_ID'] = $rowUsers['ID'];
                        $_SESSION['u_first'] = $rowUsers['vards'];
                        $_SESSION['u_last'] = $rowUsers['uzvards'];
                        $_SESSION['u_email'] = $rowUsers['epasts'];
                        $_SESSION['u_username'] = $rowUsers['lietotajvards'];
                        
                        $user_ID = $rowUsers['ID'];
                        $sql = "SELECT * FROM lietotajiem_ir_lomas WHERE lietotaji_ID='$user_ID'";
                        $resultRoles = $this->connect()->query($sql);

                        if ($rowRoles = $resultRoles->fetch_assoc()) {
                            
                            $_SESSION['u_role'] = $rowRoles['lomas_ID'];
                        }

                        header("Location: ../index.php?login=success");
                        exit();
                    }

                }

            }

        }

    }

}