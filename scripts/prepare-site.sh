#!/usr/bin/env bash
# آماده‌سازی منبع سایت: لینک‌های نسبی فایل‌های docs به templates و README
# (بیرون از پوشه docs) باید در ساختار ساخت هم معتبر بمانند.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf .site-src
mkdir -p .site-src
cp -r docs templates .site-src/
cp README.md CONTRIBUTING.md CODE_OF_CONDUCT.md CHANGELOG.md ROADMAP.md LICENSE .site-src/
# لینک‌های .github فقط روی گیت‌هاب معتبرند؛ در سایت به نشانی مطلق تبدیل می‌شوند
sed -i 's#](\.github/#](https://github.com/idmdakhi/questions-during-courtship-sessions/blob/main/.github/#g' .site-src/CONTRIBUTING.md
echo "منبع سایت در .site-src آماده شد. برای ساخت: mkdocs build"
