import os
import shutil
import re

ps1_path = r"c:\Users\DELL\.gemini\antigravity\scratch\myaiartmaker\generate_html.ps1"

with open(ps1_path, "r", encoding="utf-8") as f:
    ps1_text = f.read()

# Extract mainHtmlContent heredoc from generate_html.ps1
m_html = re.search(r'\$mainHtmlContent = @"([\s\S]*?)"@', ps1_text)
if not m_html:
    print("ERROR: Could not find mainHtmlContent in generate_html.ps1")
    exit(1)

html_template = m_html.group(1)

# Variable replacements
url_replacements = {
    "$logoUrl": "/images/logo-transparent.png",
    "$logoMarkUrl": "/images/pure-arch-tree-mark.png",
    "$chukkiUrl": "/images/chukki-talkies.png",
    "$adithyaMUrl": "/images/team/aditya-manjunath.png",
    "$sumanaUrl": "/images/team/sumana-sarkar.png",
    "$shashankUrl": "/images/team/shashank.png",
    "$harshaUrl": "/images/team/harsha-janardhana-giri.png",
    "$kavyaUrl": "/images/team/kavya-m.png",
    "$verandaUrl": "/images/properties/varenda.jpeg",
    "$lakeViewUrl": "/images/properties/lake-view.jpeg",
    "$diningUrl": "/images/properties/dining.jpeg",
    "$campfireUrl": "/images/properties/campfire.jpeg",
    "$privateRoomUrl": "/images/properties/private-room.jpeg",
    "$dormUrl": "/images/properties/dormitary-room.jpeg",
}

for k, v in url_replacements.items():
    html_template = html_template.replace(k, v)

# Chukki talkies logo box
chukki_box = "<div class='w-full h-44 rounded-2xl bg-[#0B1712] border border-white/15 p-4 mb-4 flex items-center justify-center shadow-inner overflow-hidden'><img src='/images/chukki-talkies.png' alt='Chukki Talkies Logo' class='w-full h-full object-contain brightness-110 filter drop-shadow-md' /></div>"
html_template = html_template.replace("$chukkiLogoHtml", chukki_box)

# Write to public/index.html and public/Arbora_Retreats_Review.html
with open("public/index.html", "w", encoding="utf-8") as f:
    f.write(html_template)

with open("public/Arbora_Retreats_Review.html", "w", encoding="utf-8") as f:
    f.write(html_template)

print(f"Generated index.html ({len(html_template)} bytes)")

# Sync Team Section to team.html and Arbora_Team_Review.html
start_marker = '<section id="why-we-exist"'
end_marker = '</section>'

pos_start = html_template.find(start_marker)
if pos_start != -1:
    pos_end = html_template.find(end_marker, pos_start) + len(end_marker)
    team_sec_html = html_template[pos_start:pos_end]

    for team_file in ["public/team.html", "public/Arbora_Team_Review.html"]:
        if os.path.exists(team_file):
            with open(team_file, "r", encoding="utf-8") as tf:
                ttext = tf.read()
            
            t_start = ttext.find(start_marker)
            if t_start != -1:
                t_end = ttext.find(end_marker, t_start) + len(end_marker)
                new_ttext = ttext[:t_start] + team_sec_html + ttext[t_end:]
                with open(team_file, "w", encoding="utf-8") as tf:
                    tf.write(new_ttext)
                print(f"Synced team section to {team_file}")

