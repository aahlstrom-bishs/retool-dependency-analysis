# set up input data
title the retool JSON export file as `raw_data.json` and place in the `/inputs` folder
--> `/inputs/raw_data.json`


## linux
```
chmod +x execute.sh
./execute.sh
```

## windows
```
cd code
.\execute.ps1
```

```graphviz
digraph finite_state_machine {
    rankdir=LR;
    size="8,5"

    node [shape = doublecircle]; S;
    node [shape = point ]; qi

    node [shape = circle];
    qi -> S;
    S  -> q1 [ label = "a" ];
    S  -> S  [ label = "a" ];
    q1 -> S  [ label = "a" ];
    q1 -> q2 [ label = "ddb" ];
    q2 -> q1 [ label = "b" ];
    q2 -> q2 [ label = "b" ];
}
```