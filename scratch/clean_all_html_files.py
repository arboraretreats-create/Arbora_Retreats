import os
import re

replacements_by_alt = [
    (r'alt=["\']Arbora Icon Mark["\']', r'alt="Arbora Icon Mark" src="/images/logo-transparent.png"'),
    (r'alt=["\']Adithya Manjunath["\']', r'alt="Adithya Manjunath" src="/images/team/aditya-manjunath.png"'),
    (r'alt=["\']Sumana Sarkar["\']', r'alt="Sumana Sarkar" src="/images/team/sumana-sarkar.png"'),
    (r'alt=["\']Shashank Madhu["\']', r'alt="Shashank Madhu" src="/images/team/shashank.png"'),
    (r'alt=["\']Harsha Janardhana Giri["\']', r'alt="Harsha Janardhana Giri" src="/images/team/harsha-janardhana-giri.png"'),
    (r'alt=["\']Kavya M["\']', r'alt="Kavya M" src="/images/team/kavya-m.png"'),
    (r'alt=["\']Chukki Talkies Logo["\']', r'alt="Chukki Talkies Logo" src="/images/chukki-talkies.png"'),
]

# Regex pattern to replace src="data:image...base64..." inside img tags with specific alt
def clean_file(fpath):
    if not os.path.exists(fpath):
        return
    with open(fpath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()

    # Pattern to match img tag with base64 src
    def replace_img_src(match):
        img_tag = match.group(0)
        if 'Adithya Manjunath' in img_tag:
            return re.sub(r'src=["\']data:image\/[^\'"]+["\']', 'src="/images/team/aditya-manjunath.png"', img_tag)
        elif 'Sumana Sarkar' in img_tag:
            return re.sub(r'src=["\']data:image\/[^\'"]+["\']', 'src="/images/team/sumana-sarkar.png"', img_tag)
        elif 'Shashank' in img_tag:
            return re.sub(r'src=["\']data:image\/[^\'"]+["\']', 'src="/images/team/shashank.png"', img_tag)
        elif 'Harsha' in img_tag:
            return re.sub(r'src=["\']data:image\/[^\'"]+["\']', 'src="/images/team/harsha-janardhana-giri.png"', img_tag)
        elif 'Kavya' in img_tag:
            return re.sub(r'src=["\']data:image\/[^\'"]+["\']', 'src="/images/team/kavya-m.png"', img_tag)
        elif 'Chukki Talkies' in img_tag:
            return re.sub(r'src=["\']data:image\/[^\'"]+["\']', 'src="/images/chukki-talkies.png"', img_tag)
        elif 'Arbora Icon Mark' in img_tag or 'Logo' in img_tag:
            return re.sub(r'src=["\']data:image\/[^\'"]+["\']', 'src="/images/logo-transparent.png"', img_tag)
        else:
            # General fallback to static logo if unmatched base64 image
            return re.sub(r'src=["\']data:image\/[^\'"]+["\']', 'src="/images/logo-transparent.png"', img_tag)

    cleaned = re.sub(r'<img[^>]+src=["\']data:image\/[^\'"]+["\'][^>]*>', replace_img_src, content)
    
    with open(fpath, "w", encoding="utf-8") as f:
        f.write(cleaned)

    print(f"Cleaned {fpath}: {os.path.getsize(fpath)} bytes")

files_to_clean = [
    "public/team.html",
    "public/Arbora_Team_Review.html",
    "public/cohorts.html",
    "public/Arbora_Cohorts_Review.html",
    "public/index.html",
    "public/Arbora_Retreats_Review.html"
]

for fpath in files_to_clean:
    clean_file(fpath)

