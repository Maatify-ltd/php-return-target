<?php

declare(strict_types=1);

$expectedMinor = $argv[1] ?? '';
$floor = match ($expectedMinor) {
    '8.4' => 80427,
    '8.5' => 80512,
    default => null,
};

printf("Actual PHP version: %s\n", PHP_VERSION);

if ($floor === null) {
    fwrite(STDERR, "Expected a PHP minor with a defined patch floor (8.4 or 8.5).\n");
    exit(1);
}

$actualMinor = PHP_MAJOR_VERSION . '.' . PHP_MINOR_VERSION;
if ($actualMinor !== $expectedMinor || PHP_VERSION_ID < $floor) {
    fprintf(STDERR, "Expected PHP %s.%d or newer within PHP %s.\n", $expectedMinor, $floor % 100, $expectedMinor);
    exit(1);
}
