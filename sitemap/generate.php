<?php

function createSitemap($baseUrl, $directory)
{
    $xml = new DOMDocument('1.0', 'UTF-8');

    // Create the root <urlset> element
    $urlset = $xml->createElement('urlset');
    $urlset->setAttribute('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9');
    $xml->appendChild($urlset);

    // Get all PHP files in the specified directory and its subdirectories
    $files = getPHPFiles($directory);

    foreach ($files as $file) {
        $relativePath = str_replace($directory, '', $file);
        $url = $baseUrl . ltrim($relativePath, '/');

        // Create a <url> element for each PHP file
        $urlElement = $xml->createElement('url');
        $urlset->appendChild($urlElement);

        // Create a <loc> element for the URL
        $locElement = $xml->createElement('loc', $url);
        $urlElement->appendChild($locElement);
    }

    // Save the XML document to a file
    $xml->formatOutput = true;
    $xml->save('sitemap.xml');
}

function getPHPFiles($directory)
{
    $files = [];

    $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($directory, RecursiveDirectoryIterator::SKIP_DOTS),
        RecursiveIteratorIterator::SELF_FIRST
    );

    foreach ($iterator as $file) {
        if ($file->isFile() && $file->getExtension() === 'php') {
            $path = $file->getPathname();
            $trimmedPath = str_replace(".\\", "", $path);
            $files[] = $trimmedPath;
        }
    }

    return $files;
}

// Specify the base URL and directory path
$baseUrl = 'http://localhost/';
$directory = './';

// Call the function to create the sitemap
createSitemap($baseUrl, $directory);

echo 'Sitemap created successfully!';

?>