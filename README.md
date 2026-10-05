# maycuatroi1/homebrew-tap

Homebrew casks for my macOS apps.

```bash
brew install --cask maycuatroi1/tap/claude-profiles
```

| Cask | App |
| --- | --- |
| `claude-profiles` | [Claude Profiles](https://github.com/maycuatroi1/claude-profiles): run Claude Desktop under several accounts and switch between them from the menu bar |

Upgrade with `brew upgrade --cask claude-profiles`, remove with `brew uninstall --cask claude-profiles` (add `--zap` to also move its settings to the Trash).

## Notes

- Claude Profiles is ad-hoc signed, not notarized. Its cask clears the quarantine flag on `Claude Profiles.app` after install so that Gatekeeper does not block the first launch.
- A scheduled workflow points the cask at the newest release within about an hour of publishing. Run it by hand with `gh workflow run update-claude-profiles.yml --repo maycuatroi1/homebrew-tap`.
