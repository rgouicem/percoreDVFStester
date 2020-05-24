# Per-core DVFS tester
Check if your CPU has per-core dynamic frequency scaling (DVFS) in 5 seconds

Just run `percoreDVFStester.sh` on your idle machine. After the start of the loop, if only 1 core goes to max frequency (or 2 if you have SMT enabled), you have per-core frequency scaling. If all cores go to max frequency, you don't.

# Examples
On a CPU without per-core DVFS (Intel(R) Core(TM) i5-8350U), all cores run at ~800 MHz at first. When the loop starts, all cores raise their frequency to ~3.3 GHz. (Output is truncated for better readability)
```
bash# ./percoreDVFStester.sh
cpu0: 792035 kHz
cpu1: 796026 kHz
cpu2: 794895 kHz
cpu3: 794557 kHz
cpu4: 787178 kHz
cpu5: 796791 kHz
cpu6: 796036 kHz
cpu7: 796153 kHz


*********** START LOOPER **********
cpu0: 1159407 kHz
cpu1: 1057116 kHz
cpu2: 1108635 kHz
cpu3: 2322402 kHz
cpu4: 1033994 kHz
cpu5: 1065203 kHz
cpu6: 1184297 kHz
cpu7: 976759 kHz


cpu0: 3280041 kHz
cpu1: 3314401 kHz
cpu2: 3284668 kHz
cpu3: 3286658 kHz
cpu4: 3279622 kHz
cpu5: 3286169 kHz
cpu6: 3276528 kHz
cpu7: 3309437 kHz
```

On a CPU with per-core DVFS (Intel(R) Xeon(R) W-2155), only two cores use a high frequency after the start of the loop (they are siblings SMT-wise):
```
bash# ./percoreDVFStester.sh
cpu0: 1393105 kHz
cpu1: 1337735 kHz
cpu2: 1298889 kHz
cpu3: 1299146 kHz
cpu4: 1362541 kHz
cpu5: 1667632 kHz
cpu6: 1209442 kHz
cpu7: 1462513 kHz
cpu8: 1977672 kHz
cpu9: 1475479 kHz
cpu10: 1471370 kHz
cpu11: 1304997 kHz
cpu12: 1417001 kHz
cpu13: 1399714 kHz
cpu14: 1537259 kHz
cpu15: 1426824 kHz
cpu16: 1271855 kHz
cpu17: 1418169 kHz
cpu18: 1509530 kHz
cpu19: 1502874 kHz


*********** START LOOPER **********
cpu0: 1388979 kHz
cpu1: 1620107 kHz
cpu2: 1500327 kHz
cpu3: 1499706 kHz
cpu4: 1200043 kHz
cpu5: 1616322 kHz
cpu6: 4170432 kHz               # High frequency
cpu7: 1451521 kHz
cpu8: 1711604 kHz
cpu9: 1556496 kHz
cpu10: 1667188 kHz
cpu11: 1574950 kHz
cpu12: 1502505 kHz
cpu13: 1589316 kHz
cpu14: 1200063 kHz
cpu15: 1374295 kHz
cpu16: 4207849 kHz              # High frequency
cpu17: 1348190 kHz
cpu18: 1601795 kHz
cpu19: 1433759 kHz
```
