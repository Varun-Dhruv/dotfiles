# Custom Snippets

This folder contains user-defined snippets for Neovim (powered by LuaSnip).

## Directory Structure

```text
snippets/
├── package.json   # VSCode snippet manifest mapping languages to JSON files
├── cpp.json       # C++ snippets (including Competitive Programming boilerplate)
└── README.md
```

## Available C++ Snippets

| Trigger / Prefix | Description |
|---|---|
| `cp` or `cptemplate` | Standard Competitive Programming boilerplate (Fast I/O, `ll`, `solve()`, multi-testcase loop) |
| `cpdbg` or `cpdebug` | CP boilerplate with `#ifdef LOCAL` debug macro (`dbg(x)`) |
| `pbds` or `ordered_set` | GNU Policy-Based Data Structure (ordered_set) |
| `dsu` or `unionfind` | Disjoint Set Union (Union-Find) with path compression and union by size |
| `binpow` or `modexp` | Binary exponentiation with modulo |
| `segtree` | Segment tree template (point update, range query) |

## How to Use

1. Open or create a `.cpp` file.
2. In Insert mode, type `cp` (or any prefix above).
3. The completion menu will appear showing `[Snippet]`.
4. Press `<Tab>` or arrow keys to select, and `<CR>` (Enter) to expand the boilerplate.
5. Navigation between snippet placeholders:
   - `<Tab>` / `<S-Tab>`: Jump to next / previous placeholder (when cmp popup is not visible)
   - `<C-l>` / `<C-h>`: Dedicated jump forward / backward (always works, even when cmp popup is visible)

## How to Add or Modify Snippets

### Modifying existing C++ snippets
Edit `snippets/cpp.json`. You can modify the `body`, change the `prefix`, or add new snippets.

Format:
```json
"Snippet Name": {
  "prefix": ["trigger1", "trigger2"],
  "body": [
    "line 1",
    "line 2 with cursor placeholder: $0",
    "line 3 with tabstop: ${1:default_value}"
  ],
  "description": "Short explanation"
}
```

- `$0`: Final cursor position after filling in placeholders.
- `$1`, `$2`, etc.: Tabstops jumped between using `<Tab>` or `<C-l>`.
- `${1:default_value}`: Tabstop with pre-filled default text.

### Adding snippets for other languages
1. Create a `<lang>.json` file in this folder (e.g. `snippets/python.json`).
2. Register it in `snippets/package.json`:
   ```json
   {
     "language": "python",
     "path": "./python.json"
   }
   ```
3. Alternatively, you can drop SnipMate format files (`snippets/<lang>.snippets`) or LuaSnip Lua files (`snippets/<lang>.lua`) directly into this folder without needing to edit `package.json`.
