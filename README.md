# BroGlow Homebrew tap

Homebrew formula for [BroGlow](https://github.com/broglow/broglow), a desk
traffic light and menu bar monitor for local coding-agent sessions.

```bash
brew install broglow/tap/broglow
broglow install
```

Run `broglow install` once after installing and after every `brew upgrade broglow`.

Every release also stays installable as `broglow@VERSION`, for example
`brew install broglow/tap/broglow@1.0.0`. These are keg-only: brew prints how to
put that version first on your `PATH`.

`Formula/broglow.rb` is generated for each release by the
[Homebrew tap workflow](https://github.com/broglow/broglow/actions/workflows/homebrew-tap.yaml);
do not edit it here. Guide: https://broglow.github.io/broglow/docs/
