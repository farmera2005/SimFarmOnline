# SimFarm — Browser Player (local use)

This folder wraps the original 1993 DOS release of SimFarm so it can be
played locally in a web browser, using [js-dos](https://js-dos.com) (a
DOSBox build compiled to WebAssembly). It runs entirely on your own
machine — no game files are uploaded anywhere.

This is intended for personal use with a copy of SimFarm you own. It is
not set up for public hosting/distribution.

## Run it

From the repository root:

```sh
cd web
python3 -m http.server 8080
```

Then open <http://localhost:8080/> in your browser and click **Start Game**.

(Any static file server works — `npx serve .` from inside `web/` is another
option. Opening `index.html` directly via `file://` will not work; js-dos
needs to fetch its WASM module and the game files over HTTP.)

## How it works

- `vendor/js-dos/` — the js-dos 6.22 runtime (DOSBox compiled to
  WebAssembly), vendored locally so the page works offline. ISC licensed,
  see <https://github.com/caiiiycuk/js-dos>.
- `game/simfarm.zip` — a copy of this repo's `Sim-Farm_DOS_EN.zip`, mounted
  as the emulated C: drive at startup.
- `index.html` boots js-dos, extracts the zip into the virtual filesystem,
  and runs `SIMFARM.EXE` (equivalent to `cd SimFarm` then `SIMFARM.EXE` at
  a DOS prompt).

The existing `SIMFARM.CFG` in the repo (VGA video, Sound Blaster Pro 2)
is used as-is and matches DOSBox's default Sound Blaster settings
(port 220, IRQ 7, DMA 1), so sound and music should work without changes.

## Controls

- Mouse and keyboard work as in the original DOS game.
- Click the canvas to capture mouse/keyboard input; the browser's normal
  pointer-lock escape key (usually Esc) releases it.
- If performance is choppy or too fast, DOSBox's CPU cycles can be tuned
  via the `cycles` option passed to `Dos()` in `index.html`.
