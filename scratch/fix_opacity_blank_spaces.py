import os
import re

files_to_fix = [
    "generate_html.ps1",
    "public/index.html",
    "public/Arbora_Retreats_Review.html",
    "public/team.html",
    "public/Arbora_Team_Review.html",
    "public/cohorts.html",
    "public/Arbora_Cohorts_Review.html"
]

def fix_opacity(fpath):
    if not os.path.exists(fpath):
        return
    with open(fpath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()

    # Make hero-fade-init and reveal-on-scroll visible by default (opacity: 1, translateY: 0)
    old_hero = r'\.hero-fade-init\s*\{\s*opacity:\s*0;\s*transform:\s*translateY\(12px\);'
    new_hero = '.hero-fade-init { opacity: 1; transform: translateY(0);'
    content = re.sub(old_hero, new_hero, content)

    old_reveal = r'\.reveal-on-scroll\s*\{\s*opacity:\s*0;\s*transform:\s*translateY\(20px\);'
    new_reveal = '.reveal-on-scroll { opacity: 1; transform: translateY(0);'
    content = re.sub(old_reveal, new_reveal, content)

    # Also handle literal string replacements
    content = content.replace('.hero-fade-init { opacity: 0;', '.hero-fade-init { opacity: 1;')
    content = content.replace('.reveal-on-scroll { opacity: 0;', '.reveal-on-scroll { opacity: 1;')

    with open(fpath, "w", encoding="utf-8") as f:
        f.write(content)

    print(f"Fixed default opacity in {fpath}")

for f in files_to_fix:
    fix_opacity(f)

