# Screenplay

**A screen recording is a script, not a video.**

Screenplay records the pixels *and* a description of what happened on them, then
renders the video once, at export. The cursor is never in the recorded pixels —
it is drawn at render time from a track logged on every take. So after you stop
recording you can still change the pointer's size, smooth its path, swap the
click effect, add a zoom, or take one away. Nothing is baked in.

<!-- Add a screenshot here: docs/screenshot.png -->

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/dhruv465/Screenplay/main/install.sh | bash
```

Or download `Screenplay-arm64.dmg` from the
[latest release](https://github.com/dhruv465/Screenplay/releases/latest) and drag
Screenplay into Applications.

Apple Silicon, macOS 13 or later. Screenplay lives in the menu bar. The first
capture asks for Screen Recording. Keystroke overlays additionally need Input
Monitoring, and are optional — without it a recording simply has no key layer.

If a build is not notarized its release notes say so, and macOS will block the
first open until you click **Open Anyway** in System Settings › Privacy &
Security. The install command above handles that for you.

## What it does

**Capture** an area, a window, the whole screen, a scrolling page, or text with
OCR. **Record** the screen with system audio, a microphone on its own track, and
an optional keystroke log.

**Edit the description, not the footage.** Zooms are proposed automatically from
where the pointer dwelled, and every one of them is a declaration you can move,
resize or delete. Cuts and trims drop spans from the export without touching the
recording.

**Annotate** with arrows, text, redaction, spotlight, counters, a highlighter and
a background tool. **Quick Access overlays, pins and a capture history** hold on
to everything you take.

**A command line and an MCP server share the same engine**, so a script or an
agent can edit a recording exactly the way the app does — both are only writing
to the same JSON document.

| Shortcut | Action |
|---|---|
| ⇧⌘1 | All-In-One |
| ⇧⌘2 | Capture Area |
| ⇧⌘6 | Record Screen (again to stop) |
| ⇧⌘7 | Capture Text (OCR) |
| ⇧⌘8 | Capture History |

Every action can be rebound in Settings › Shortcuts, and triggered by URL:

```bash
open "screenplay://capture-area?action=copy"
```

## Updates

Screenplay checks this repository's latest release when you choose **Check for
Updates…** from its menu. That is one unauthenticated request to GitHub's public
API; see [PRIVACY.md](PRIVACY.md).

## Issues

Bug reports and feature requests are welcome in
[Issues](https://github.com/dhruv465/Screenplay/issues). This repository holds the
documentation and the released installers; development happens privately.
