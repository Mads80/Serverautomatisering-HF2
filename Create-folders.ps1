$root = "C:\DFSRoots\MarketingDocs\Byer"

Foreach($folder in Get-Content "$root\Foldernames.txt")
{
    New-Item "$root\$folder" -ItemType Directory -ErrorAction SilentlyContinue
}