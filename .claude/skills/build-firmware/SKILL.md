---
name: build-firmware
description: Build the ergoalex ZMK firmware locally and put the UF2 file(s) on the Desktop. Use when asked to build, compile or make the keyboard firmware or a UF2, or to try a keymap change on the keyboard before pushing.
argument-hint: "[right|left|both|reset]"
allowed-tools: Bash(.claude/skills/build-firmware/build.sh:*)
---

# Build firmware to the Desktop

Arguments: $ARGUMENTS

`build.sh` (next to this file) builds with the local ZMK workspace in `~/zmk-ws`. That workspace holds the ZMK and Zephyr checkouts, a Python venv with west, and Zephyr SDK 0.16.3. This is the only way this repo's firmware gets built; there is no CI. The script runs the same `west build` as ZMK's user-config CI workflow and reads this repo's `config/` directly, so uncommitted keymap edits are included.

1. Pick the shields from the arguments or the request:
   - `right`, or nothing given: `ergoalex_right` (the central half, which holds the keymap)
   - `left`: `ergoalex_left`
   - `both`: `ergoalex_right ergoalex_left`
   - `reset`: `settings_reset` (clears split pairing and BLE bonds)
2. From the repo root, run `.claude/skills/build-firmware/build.sh <shields...>`. It takes about a minute per half. If `config/west.yml` changed since the last build, the script runs `west update` first, which adds a few minutes.
3. Check that each `~/Desktop/<shield>.uf2` the script printed exists and has a fresh timestamp (`ls -la`). Each build overwrites the older copy.
4. Report:
   - the UF2 path(s)
   - the FLASH and RAM usage lines
   - any `warning:` line that names a `ZMK_` symbol or a file in this repo

   Ignore these known warnings:
   - deprecated `NRF_STORE_REBOOT_TYPE_GPREGRET`, which comes from ZMK itself
   - "The `config/boards` folder is deprecated", because the shield still lives under `config/boards/shields/`
   - on `ergoalex_left` only: `ZMK_USB`, `ZMK_SPLIT_BLE_CENTRAL_BATTERY_LEVEL_FETCHING` and `..._PROXY` "assigned the value 'y' but got 'n'". These are central-only settings, and the left half is the peripheral.

   If the build fails, show the first compiler or devicetree error, not the whole log.
5. Remind the user how to flash: double-tap reset on the nice!nano, then drag the UF2 onto the `NICENANO` drive. Keymap and combo changes only need the right half. Changes to `.conf` files or ZMK versions need both halves.

## If `~/zmk-ws` is missing or broken

Tell the user, and offer to set it up again. Don't improvise.

1. Make a venv at `~/zmk-ws/.venv` and `pip install west`.
2. Copy `config/west.yml` to `~/zmk-ws/config/west.yml`. Then, in `~/zmk-ws`, run `west init -l config`, `west update --fetch-opt=--filter=tree:0` and `west zephyr-export`.
3. Install the Python deps: `pip install -r ~/zmk-ws/zephyr/scripts/requirements-base.txt`.
4. Download Zephyr SDK 0.16.3. Use `zephyr-sdk-0.16.3_macos-x86_64_minimal.tar.xz` plus `toolchain_macos-x86_64_arm-zephyr-eabi.tar.xz` from the zephyrproject-rtos/sdk-ng releases, and check them against the release's `sha256.sum`. Extract both to `~/zmk-ws/zephyr-sdk-0.16.3`.

If ZMK's version is ever bumped past Zephyr 3.5, the SDK version must change too. Use the version that zmkfirmware/zmk-docker pins for that Zephyr branch, and update `ZEPHYR_SDK_INSTALL_DIR` in `build.sh`.
