import os
import shutil

ps1_path = r"c:\Users\DELL\.gemini\antigravity\scratch\myaiartmaker\generate_html.ps1"

with open(ps1_path, "r", encoding="utf-8") as f:
    content = f.read()

# Replace any $founderDots or $leadDots with literal founderDots and leadDots
content = content.replace("$founderDots", "founderDots")
content = content.replace("$leadDots", "leadDots")

with open(ps1_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Updated generate_html.ps1 with literal founderDots and leadDots!")
