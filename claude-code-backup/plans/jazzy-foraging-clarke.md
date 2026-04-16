# Plan: Connect Claude Desktop ke NotebookLM via MCP Server

## Context
Pengguna ingin menghubungkan **Claude Desktop App** ke **Google NotebookLM** menggunakan **MCP (Model Context Protocol) Server**.  
NotebookLM tidak memiliki public API resmi, namun komunitas telah membangun MCP server yang menggunakan browser automation / unofficial API untuk menjembatani keduanya.

Tujuan: Claude bisa query notebook, menambah sumber, dan berinteraksi dengan NotebookLM langsung dari chat di Claude Desktop.

---

## MCP Server yang Digunakan

**`julianoczkowski/notebooklm-mcp-2026`** — direkomendasikan karena:
- Kompatibel dengan Claude Desktop, Claude Code, Cursor, VS Code
- Aktif diperbarui (2026)
- Persistent authentication (tidak perlu login ulang tiap sesi)

Alternatif: `PleasePrompto/notebooklm-mcp` (juga stabil, fitur serupa)

---

## Prerequisites
- Node.js v18+ sudah terinstall (`node --version`)
- npx tersedia (otomatis dengan Node.js)
- Akun Google yang bisa akses NotebookLM
- Claude Desktop App sudah terinstall

---

## Langkah Implementasi

### Step 1 — Cek & Install Node.js
```bash
node --version   # Harus v18+
npx --version
```
Jika belum ada: download dari https://nodejs.org

### Step 2 — Install MCP Server NotebookLM
```bash
npx notebooklm-mcp-2026 --version
# atau
npm install -g notebooklm-mcp-2026
```

### Step 3 — Temukan File Config Claude Desktop
Lokasi di Windows:
```
C:\Users\tyu\AppData\Roaming\Claude\claude_desktop_config.json
```

### Step 4 — Edit `claude_desktop_config.json`
Tambahkan konfigurasi MCP server berikut:

```json
{
  "mcpServers": {
    "notebooklm": {
      "command": "npx",
      "args": ["-y", "notebooklm-mcp-2026"],
      "env": {
        "GOOGLE_ACCOUNT_EMAIL": "email-google-kamu@gmail.com"
      }
    }
  }
}
```

> Jika file sudah ada dengan config lain, tambahkan key `"notebooklm"` ke dalam objek `"mcpServers"` yang sudah ada.

### Step 5 — Autentikasi Google
Saat pertama kali dijalankan, MCP server akan membuka browser untuk login Google:
```bash
# Jalankan manual pertama kali untuk save token
npx notebooklm-mcp-2026 --auth
```
Setelah login, token disimpan lokal sehingga tidak perlu login ulang.

### Step 6 — Restart Claude Desktop
Tutup dan buka ulang Claude Desktop agar config MCP terbaca.

### Step 7 — Verifikasi di Claude Desktop
Di chat Claude Desktop, ketik:
```
List semua notebook NotebookLM saya
```
Jika berhasil, Claude akan menampilkan daftar notebook dari akun Google kamu.

---

## Contoh Penggunaan Setelah Terhubung

```
"Tampilkan semua notebook saya"
"Query notebook [nama] tentang topik X"
"Tambahkan URL ini sebagai sumber ke notebook [nama]: https://..."
"Buat ringkasan dari notebook [nama]"
```

---

## File yang Akan Dibuat/Dimodifikasi
- `C:\Users\tyu\AppData\Roaming\Claude\claude_desktop_config.json` — ditambah config MCP server

---

## Verifikasi & Testing
1. Restart Claude Desktop setelah edit config
2. Buka Settings → MCP Servers — pastikan `notebooklm` muncul dengan status connected
3. Chat: "List semua notebook saya" — harus mengembalikan data dari NotebookLM
4. Chat: "Query notebook X tentang Y" — harus mengembalikan jawaban berbasis sumber di notebook

---

## Troubleshooting Umum
| Masalah | Solusi |
|---|---|
| MCP server tidak muncul | Cek path config JSON sudah benar, restart Claude |
| Auth error | Jalankan `npx notebooklm-mcp-2026 --auth` manual di terminal |
| Node not found | Install Node.js v18+ dari nodejs.org |
| JSON parse error | Validasi JSON di jsonlint.com sebelum disimpan |
