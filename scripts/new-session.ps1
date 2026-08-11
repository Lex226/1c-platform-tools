param(
    [Parameter(Mandatory = $false)]
    [string]$Topic = "general",

    [Parameter(Mandatory = $false)]
    [string]$Date = (Get-Date -Format "yyyy-MM-dd"),

    [Parameter(Mandatory = $false)]
    [string]$Time = (Get-Date -Format "HHmm")
)

$root = Split-Path -Parent $PSScriptRoot
$sessionsDir = Join-Path $root "sessions"

if (-not (Test-Path $sessionsDir)) {
    New-Item -ItemType Directory -Path $sessionsDir | Out-Null
}

$slug = ($Topic.Trim().ToLower() -replace "[^a-z0-9\-]+", "-") -replace "-+", "-"
if ([string]::IsNullOrWhiteSpace($slug)) {
    $slug = "general"
}

$fileName = "{0}-{1}-{2}.md" -f $Date, $Time, $slug
$filePath = Join-Path $sessionsDir $fileName

if (Test-Path $filePath) {
    Write-Host "Session note already exists: $filePath"
    exit 0
}

$content = @"
---
type: raw-session
date: $Date
time: $Time
topic: $Topic
status: raw
promoted_to: []
platform_verified_on: null
rdt_version: null
verification: hypothesis
discarded: []
---

# Session: $Topic

## Goal
-

## Observed
-

## Reproduced
-

## Externally confirmed
-

## Discarded hypotheses
-

## Candidate artifacts to promote
-

## Links
- ADR-0001: `adr/0001-scope-platform-not-configuration.md`
- ADR-0002: `adr/0002-versioning-via-frontmatter.md`
- HANDOFF: `sessions/HANDOFF.md`
"@

Set-Content -Path $filePath -Value $content -Encoding UTF8

Write-Host "Created session note: $filePath"
Write-Host "Next steps:"
Write-Host "1. Fill the session note."
Write-Host "2. Promote stable findings into docs/."
Write-Host "3. Update sessions/HANDOFF.md."
