# Cara Restore Claude Code di Device Lain

## File yang ada di folder ini:
```
.claude-sync/
├── .claude.json          ← Settings & memory utama Claude Code
├── backups/              ← Backup otomatis settings
├── plans/                ← File plan dari sesi sebelumnya
├── projects/             ← History percakapan per project
└── shell-snapshots/      ← Snapshot shell
```

---

## Langkah restore di device/komputer baru:

### 1. Install Claude Code dulu
```
https://claude.ai/download
```

### 2. Copy file settings utama
```
Dari: G:\My Drive\CloudeCode\.claude-sync\.claude.json
Ke:   C:\Users\[USERNAME]\   (letakkan sebagai .claude.json)
```

### 3. Copy folder .claude
```
Dari: G:\My Drive\CloudeCode\.claude-sync\plans\
Ke:   C:\Users\[USERNAME]\.claude\plans\

Dari: G:\My Drive\CloudeCode\.claude-sync\projects\
Ke:   C:\Users\[USERNAME]\.claude\projects\
```

### 4. Buka Claude Code, arahkan ke folder project:
```
G:\My Drive\CloudeCode
```

---

## Update sync (jalankan ini tiap selesai kerja):
Copy ulang file-file di atas dari C:\Users\[USERNAME]\ ke folder sync ini
agar selalu up-to-date di Google Drive.

---
Terakhir sync: 2026-04-16
