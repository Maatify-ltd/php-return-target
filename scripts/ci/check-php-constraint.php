<?php

declare(strict_types=1);

use Composer\Semver\Semver;

require dirname(__DIR__, 2) . '/vendor/autoload.php';

$manifest = json_decode(file_get_contents(dirname(__DIR__, 2) . '/composer.json'), true, flags: JSON_THROW_ON_ERROR);
$constraint = $manifest['require']['php'];

foreach (['8.4.26' => false, '8.4.27' => true, '8.5.11' => false, '8.5.12' => true, '8.6.0' => false] as $version => $expected) {
    $accepted = Semver::satisfies($version, $constraint);
    printf("PHP %s: %s\n", $version, $accepted ? 'accepted' : 'rejected');
    if ($accepted !== $expected) {
        fwrite(STDERR, "Unexpected Composer constraint result for PHP $version.\n");
        exit(1);
    }
}
