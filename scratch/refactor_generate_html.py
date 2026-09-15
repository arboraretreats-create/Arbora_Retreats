import re

ps1_path = r"c:\Users\DELL\.gemini\antigravity\scratch\myaiartmaker\generate_html.ps1"

with open(ps1_path, "r", encoding="utf-8") as f:
    content = f.read()

# Replace Base64 loading logic with static URL declarations
old_header_pattern = re.compile(
    r"# Convert all image assets to Base64.*?# HERO BACKGROUND VIDEOS",
    re.DOTALL
)

new_header = """# Static Image Asset URLs for Vercel Optimization
$logoUrl = "/images/logo-transparent.png"
$logoMarkUrl = "/images/pure-arch-tree-mark.png"
$chukkiUrl = "/images/chukki-talkies.png"
$adithyaMUrl = "/images/team/aditya-manjunath.png"
$sumanaUrl = "/images/team/sumana-sarkar.png"
$shashankUrl = "/images/team/shashank.png"
$harshaUrl = "/images/team/harsha-janardhana-giri.png"
$kavyaUrl = "/images/team/kavya-m.png"

$verandaUrl = "/images/properties/varenda.jpeg"
$lakeViewUrl = "/images/properties/lake-view.jpeg"
$diningUrl = "/images/properties/dining.jpeg"
$campfireUrl = "/images/properties/campfire.jpeg"
$privateRoomUrl = "/images/properties/private-room.jpeg"
$dormUrl = "/images/properties/dormitary-room.jpeg"

# HERO BACKGROUND VIDEOS"""

content = old_header_pattern.sub(new_header, content)

# Map data:image... placeholders to URL variables
replacements = {
    'data:image/png;base64,$logoB64': '$logoUrl',
    'data:image/png;base64,$logoMarkB64': '$logoMarkUrl',
    'data:image/png;base64,$chukkiB64': '$chukkiUrl',
    'data:image/png;base64,$adithyaMB64': '$adithyaMUrl',
    'data:image/png;base64,$sumanaB64': '$sumanaUrl',
    'data:image/png;base64,$shashankB64': '$shashankUrl',
    'data:image/png;base64,$harshaB64': '$harshaUrl',
    'data:image/png;base64,$kavyaB64': '$kavyaUrl',
    'data:image/jpeg;base64,$verandaB64': '$verandaUrl',
    'data:image/jpeg;base64,$lakeViewB64': '$lakeViewUrl',
    'data:image/jpeg;base64,$diningB64': '$diningUrl',
    'data:image/jpeg;base64,$campfireB64': '$campfireUrl',
    'data:image/jpeg;base64,$privateRoomB64': '$privateRoomUrl',
    'data:image/jpeg;base64,$dormB64': '$dormUrl',
}

# Also handle any direct variable usages
var_replacements = {
    '$logoB64': '$logoUrl',
    '$logoMarkB64': '$logoMarkUrl',
    '$chukkiB64': '$chukkiUrl',
    '$adithyaMB64': '$adithyaMUrl',
    '$sumanaB64': '$sumanaUrl',
    '$shashankB64': '$shashankUrl',
    '$harshaB64': '$harshaUrl',
    '$kavyaB64': '$kavyaUrl',
    '$verandaB64': '$verandaUrl',
    '$lakeViewB64': '$lakeViewUrl',
    '$diningB64': '$diningUrl',
    '$campfireB64': '$campfireUrl',
    '$privateRoomB64': '$privateRoomUrl',
    '$dormB64': '$dormUrl',
}

for k, v in replacements.items():
    content = content.replace(k, v)

# Update chukkiLogoHtml check if present
content = content.replace("if ($chukkiB64 -ne \"\")", "if ($chukkiUrl -ne \"\")")
content = content.replace("if ($chukkiB64 -eq \"\")", "if ($chukkiUrl -eq \"\")")

with open(ps1_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Updated generate_html.ps1 successfully!")
