# SimFarm — Native Windows 11 Launcher

Play the original 1993 DOS SimFarm on Windows 11 by double-clicking a
desktop shortcut, no browser and no manual setup after the first run.

## Why this still uses DOSBox under the hood

`SIMFARM.EXE` is a 16-bit real-mode DOS program that talks to VGA and the
sound card directly. 64-bit Windows (all of Windows 11) runs the CPU in a
mode that cannot execute 16-bit real-mode code at all, and it doesn't give
programs raw hardware access the way DOS did — this is a CPU/OS-level
restriction, not a missing setting. There is no compatibility-mode
checkbox that gets around it.

So something has to stand in for the original hardware. This launcher
uses [DOSBox](https://www.dosbox.com/) for that — the same approach GOG
and Steam use to sell 30-year-old DOS games as ordinary double-click
Windows apps. You never see DOSBox directly: it's just the plumbing
behind the "SimFarm" shortcut.

## Setup (one time)

1. Copy this repository onto the Windows 11 PC you want to play on.
2. Open the `windows` folder, right-click **Setup.ps1**, and choose
   **Run with PowerShell**.
   - If that option isn't available, open PowerShell in this folder and run:
     ```powershell
     powershell -ExecutionPolicy Bypass -File .\Setup.ps1
     ```
3. The script finds an existing DOSBox install, or installs one via
   `winget` if needed, then creates a **SimFarm** shortcut on your Desktop.
   - If neither DOSBox nor `winget` is available, it will print a link to
     install DOSBox manually (<https://www.dosbox.com/download.php> or
     the actively maintained fork <https://dosbox-staging.github.io/>) —
     just re-run `Setup.ps1` afterward.

## Playing

Double-click the **SimFarm** shortcut on your Desktop any time. That's it.

(You can also run `Play SimFarm.bat` directly from this folder without
using the Desktop shortcut.)

## Files

- `simfarm.conf` — DOSBox configuration: Sound Blaster Pro 2 audio to
  match the repo's `SIMFARM.CFG`, and an autoexec that mounts the repo
  root as the emulated C: drive and launches `SIMFARM.EXE`.
- `Play SimFarm.bat` — locates `dosbox.exe` and launches it with
  `simfarm.conf`.
- `Setup.ps1` — one-time installer/shortcut creator described above.

## Troubleshooting

- **"DOSBox was not found"** — install it manually (see links above),
  then re-run `Setup.ps1` or `Play SimFarm.bat`.
- **Choppy sound/video or running too fast** — edit `cycles=auto` under
  `[cpu]` in `simfarm.conf` to a fixed number (e.g. `cycles=15000`) and
  adjust up or down.
- **Script won't run ("running scripts is disabled")** — use the
  `powershell -ExecutionPolicy Bypass -File .\Setup.ps1` command above
  instead of double-clicking the `.ps1` file.
