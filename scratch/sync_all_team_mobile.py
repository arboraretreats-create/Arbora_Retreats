import shutil

# Copy index.html content to Arbora_Retreats_Review.html
shutil.copy2("public/index.html", "public/Arbora_Retreats_Review.html")

# Also ensure team.html and Arbora_Team_Review.html have the mobile carousel
with open("public/index.html", "r", encoding="utf-8") as f:
    index_text = f.read()

# Extract Team Section from index.html
start_marker = '<section id="why-we-exist"'
end_marker = '</section>'

pos_start = index_text.find(start_marker)
if pos_start != -1:
    pos_end = index_text.find(end_marker, pos_start) + len(end_marker)
    team_sec_html = index_text[pos_start:pos_end]

    for team_file in ["public/team.html", "public/Arbora_Team_Review.html"]:
        with open(team_file, "r", encoding="utf-8") as tf:
            ttext = tf.read()
        
        t_start = ttext.find(start_marker)
        if t_start != -1:
            t_end = ttext.find(end_marker, t_start) + len(end_marker)
            new_ttext = ttext[:t_start] + team_sec_html + ttext[t_end:]
            with open(team_file, "w", encoding="utf-8") as tf:
                tf.write(new_ttext)
            print(f"Synced team section to {team_file}")

print("All HTML files synced successfully!")
