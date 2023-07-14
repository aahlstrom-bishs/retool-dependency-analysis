#powershell

Write-Host "-- compiling..."

$PYDEVD_DISABLE_FILE_VALIDATION=1

jupyter nbconvert --execute get_formatted_appState.ipynb --to python --log-level=ERROR
jupyter nbconvert --execute map_dependencies.ipynb --to python --log-level=ERROR
jupyter nbconvert --execute build_digraph.ipynb --to python --log-level=ERROR

Write-Host "-- compiled"
Write-Host "-- executing..."

python get_formatted_appState.py
python map_dependencies.py
python build_digraph.py

Write-Host "-- done"