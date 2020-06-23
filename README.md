# Bash Parallel Sample

bash で並列処理を実施する。バックグラウンドプロセスのエラーハンドリングも考慮する。

# How to use

```
$ ./main.sh
print_data.sh alice (PID=4272)
print_data.sh bob (PID=4273)
print_data.sh chris (PID=4274)
print_data.sh xxxxxx (PID=4275)
Wait PID=4272
Wait PID=4273
Wait PID=4274
Wait PID=4275
#####################################
# Print xxxxxx.log
#####################################
[INFO] Start Script.
[INFO] Running...
[ERROR]: profile is an incorrect value.

#####################################
# Print bob.log
#####################################
[INFO] Start Script.
[INFO] Running...
=================================
NAME  : bob
AGE   : 32
SEX   : man
HEIGHT: 187
WEIGHT: 80
=================================

#####################################
# Print alice.log
#####################################
[INFO] Start Script.
[INFO] Running...
=================================
NAME  : alice
AGE   : 21
SEX   : woman
HEIGHT: 160
WEIGHT: 50
=================================

#####################################
# Print chris.log
#####################################
[INFO] Start Script.
[INFO] Running...
=================================
NAME  : chris
AGE   : 25
SEX   : man
HEIGHT: 172
WEIGHT: 65
=================================

```
