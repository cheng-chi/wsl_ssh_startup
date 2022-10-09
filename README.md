# Launch WSL2 at startup and setup SSH port forwarding
## Setup
1. In [run_wsl2-at_startup.ps1](./run_wsl2-at_startup.ps1), replace `Ubuntu-20.04` with your distribution name.
2. In [run_wsl2-at_startup.ps1](./run_wsl2-at_startup.ps1), replace `$windows_port = 6022` with your desired port for exposing ssh server from wsl2
3. In [runner.vbs](./runner.vbs), replace `C:\Users\cchi\dev\wsl_network\PsExec.exe` and `C:\Users\cchi\dev\wsl_network\run_wsl2_at_startup.ps1` with the actualy path to your copy of this repo.
4. In task scheduler, setup a task following [this tutorial](https://medium.com/swlh/how-to-run-ubuntu-in-wsl2-at-startup-on-windows-10-c4567d6c48f1), but action to execute their `run_wsl2_at_startup.vbs` with the path to `runner.vbs` in this repo.
5. Run the task manually in task scheduler and check the content of [stderr.txt](./stderr.txt) and [stdout.txt](./stdout.txt) (created by the `run_wsl2_at_startup.ps1`) for error. Ideally, both of these files should be empty.
