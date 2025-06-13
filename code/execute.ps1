#powershell
Write-Host "-- setting up directories..."
# Check if the directory exists
if (-Not (Test-Path -Path "inputs" -PathType Container)) {
    # If the directory doesn't exist, create it
    New-Item -ItemType Directory -Path "inputs" -Force
}

# Add output directories
$folders = @(
    "debug_files",
    "intermediate_outputs",
    "../outputs"
)
foreach ($path in $folders) {
    # Remove the item (file or directory) recursively and forcefully
    if (Test-Path -Path $path) {
        Remove-Item -Path $path -Recurse -Force
    }
    # Create a new directory
    New-Item -ItemType Directory -Path $path -Force
}

Write-Host "-- directory setup complete"
Write-Host "-- compiling..."

$executable_names = @(
    "1_parse_appState",
    "2_map_dependencies",
    "3_build_holistic_digraphs",
    "4_map_and_build_digraph_sql_SELECT"
    "5_build_digraph_chained_events"
)
foreach ($executable_name in $executable_names) {
    $file_ipynb = $executable_name + ".ipynb"
    $file_py = $executable_name + ".py"
    Write-Host "    >>  compiling " + $file_ipynb
    if (Test-Path -Path $file_py) {
        Remove-Item -Path $file_py -Force
    }
    jupyter nbconvert --execute $file_ipynb --to python --log-level=ERROR
}

Write-Host "-- compiled"
Write-Host "-- executing..."

foreach ($executable_name in $executable_names) {
    $file_py = $executable_name + ".py"
    Write-Host "    >>  executing " + $file_py
    python $file_py
    Remove-Item -Path $file_py -Force
}

Write-Host "-- done"