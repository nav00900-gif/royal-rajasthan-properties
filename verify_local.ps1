$urls = @(
  'http://localhost:8080/',
  'http://localhost:8080/project.html',
  'http://localhost:8080/projects/',
  'http://localhost:8080/projects/index.html',
  'http://localhost:8080/projects/residential-plots.html',
  'http://localhost:8080/projects/commercial.html',
  'http://localhost:8080/projects/villas.html',
  'http://localhost:8080/projects/residential.html',
  'http://localhost:8080/projects/300-bigha-mega-township.html',
  'http://localhost:8080/projects/residential-gated-plots.html',
  'http://localhost:8080/projects/commercial-boulevard-plots.html',
  'http://localhost:8080/projects/the-royal-haveli-enclave.html',
  'http://localhost:8080/projects/jaipur-skyward-residences.html',
  'http://localhost:8080/projects/aravalli-greens-township.html',
  'http://localhost:8080/projects/meridian-corporate-tower.html',
  'http://localhost:8080/projects/udaipur-lakeside-sanctuary.html',
  'http://localhost:8080/projects/mehrangarh-view-floors.html',
  'http://localhost:8080/sitemap.xml',
  'http://localhost:8080/admin.html',
  'http://localhost:8080/thank-you.html'
)

$passed = 0
$failed = 0

foreach ($u in $urls) {
  try {
    $res = Invoke-WebRequest -Uri $u -Method Get -TimeoutSec 5 -UseBasicParsing
    if ($res.StatusCode -eq 200) {
      Write-Host "200 OK : $u" -ForegroundColor Green
      $passed++
    } else {
      Write-Host "$($res.StatusCode) : $u" -ForegroundColor Yellow
      $failed++
    }
  } catch {
    Write-Host "FAIL ($_) : $u" -ForegroundColor Red
    $failed++
  }
}

Write-Host "`nSummary: $passed Passed, $failed Failed out of $($urls.Count) URLs." -ForegroundColor Cyan
