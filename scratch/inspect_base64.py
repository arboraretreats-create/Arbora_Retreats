import os
import re

base64_img_pattern = re.compile(r'data:image\/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+')

# Image mapping dictionary based on image alt or context
# Or we can map specific base64 strings or signatures
files_to_clean = [
    "public/team.html",
    "public/Arbora_Team_Review.html",
    "public/cohorts.html",
    "public/Arbora_Cohorts_Review.html",
    "public/index.html",
    "public/Arbora_Retreats_Review.html"
]

# Let's see what base64 images exist in public/team.html and public/cohorts.html
for fpath in files_to_clean:
    if os.path.exists(fpath):
        size = os.path.getsize(fpath)
        with open(fpath, "r", encoding="utf-8", errors="ignore") as f:
            text = f.read()
        matches = base64_img_pattern.findall(text)
        print(f"{fpath} (size: {size} bytes) contains {len(matches)} Base64 image tags.")
