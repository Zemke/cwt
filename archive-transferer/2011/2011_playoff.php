<?php

$db2011 = mysqli_connect('127.0.0.1', 'root', '', 'cwt_2011');
if (mysqli_connect_errno($db2011)) {
    die('Failed to connect to database: ' . mysqli_connect_error());
}

$dbRestore = mysqli_connect('127.0.0.1', 'root', '', 'cwt_restore');
if (mysqli_connect_errno($dbRestore)) {
    die('Failed to connect to database: ' . mysqli_connect_error());
}


function findUserByUsername($username, $db) {
    $sql = "SELECT `id`, `username` FROM `users` WHERE `username`='$username'";
    $result = mysqli_query($db, $sql); echo mysqli_error($db);
    $user = mysqli_fetch_array($result);

    if ($user === null) {
        if ($username == 'DarkXLord') {
            return findUserByUsername('DarKxXxLorD', $db);
        }
        if ($username == 'TenoriTaiga') {
            return findUserByUsername('nappy', $db);
        }

        echo $username . " not found in remote database.\n";
    }

    return $user;
}

function addToRestores($homeId, $awayId, $scoreH, $scoreA, $stage, $reported, $reporterId, $db) {
    $submitterId = 1; // Zemke
    $tournamentId = 10; // 2010
    $created = gmdate('Y-m-d H:i:s'); // Right now

    $sql = "INSERT INTO `restores` (
        `submitter_id`, `tournament_id`, `home_id`, `away_id`, `score_h`, `score_a`, `stage`, `reported`, `reporter_id`, `created`)
        VALUES ('$submitterId', '$tournamentId', '$homeId', '$awayId', '$scoreH', '$scoreA', '$stage', '$reported', '$reporterId', '$created')";
    $result = mysqli_query($db, $sql); echo mysqli_error($db);
    return $result;
}

    $sql = "SELECT * FROM `playoff`";
    $result = mysqli_query($db2011, $sql);

while ($game = mysqli_fetch_array($result)) {
    $home = findUserByUsername($game['home'], $dbRestore);
    $away = findUserByUsername($game['away'], $dbRestore);

    if ($home === null || $away === null) {
        continue;
    }

    $reporter = findUserByUsername($game['reportedby'], $dbRestore);

    switch ($game['stage']) {
        case '1':
            $stage = 'Last Sixteen';
            break;
        case '2':
            $stage = 'Quarterfinal';
            break;
        case '3':
            $stage = 'Semifinal';
            break;
        case '4':
            $stage = 'Third Place';
            break;
        case '5':
            $stage = 'Final';

    }

    $resultAddToRestores = addToRestores($home['id'], $away['id'], $game['scoreh'], $game['scorea'], $stage, $game['date'] . ' ' . $game['time'], $reporter['id'], $dbRestore);

    if ($resultAddToRestores === false) {
        echo '#' . $game['id'] . " could not be processed\n";
        continue;
    }
}

