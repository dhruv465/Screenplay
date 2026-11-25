# Privacy

Screenplay runs on your Mac. It has no account, no analytics, no telemetry
reporting, and no server of its own.

## What stays on your Mac

- **Captures and recordings.** Screenshots, videos, their cursor and key tracks,
  and the capture history are written to the folder you choose in Settings and
  to Screenplay's own application-support folder. They are never uploaded.
- **Keystrokes.** Recording them is off by default and requires you to grant
  Input Monitoring. When on, keys typed during a recording are written next to
  that recording as `keys.jsonl` so the editor can draw them. They are not sent
  anywhere. Leave it off while typing anything private.
- **Text recognition.** OCR runs on-device with Apple's Vision framework.
- **Settings.** Stored in macOS user defaults.

## The only network request

When you choose **Check for Updates…**, Screenplay makes one unauthenticated
`GET` to

```
https://api.github.com/repos/dhruv465/Screenplay/releases/latest
```

and, if you then choose to install, downloads that release's ZIP from GitHub. The
request carries a `User-Agent` of `Screenplay/<version>` and nothing else — no
identifier, no account, no information about your captures. GitHub will see the
IP address the request came from, as it would for any download.

Screenplay makes no other network request. It does not phone home on launch, on
capture, or on export.

## Permissions it asks for

- **Screen Recording** — required to capture anything at all.
- **Input Monitoring** — only if you turn keystroke recording on.
- **Microphone** — only if you turn microphone recording on.

Each is requested by macOS, granted by you, and revocable in System Settings ›
Privacy & Security.

## Contact

Open an issue at <https://github.com/dhruv465/Screenplay/issues>.
