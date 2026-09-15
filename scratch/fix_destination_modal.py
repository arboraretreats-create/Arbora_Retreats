import os
import re

def fix_destination_modal(fpath):
    if not os.path.exists(fpath):
        return
    with open(fpath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()

    # 1. Update openDestinationModal function in script
    old_func = r"document\.getElementById\('destModalImg'\)\.src = 'data:image/jpeg;base64,' \+ imgB64;"
    new_func = """var modalImg = document.getElementById('destModalImg');
      if (imgB64.startsWith('/') || imgB64.startsWith('http')) {
        modalImg.src = imgB64;
      } else {
        modalImg.src = 'data:image/jpeg;base64,' + imgB64;
      }"""
    
    content = re.sub(old_func, new_func, content)

    # 2. Update button onclick calls to use static image URLs
    url_map = {
        "verandaB64": "/images/properties/varenda.jpeg",
        "lakeViewB64": "/images/properties/lake-view.jpeg",
        "diningB64": "/images/properties/dining.jpeg",
        "campfireB64": "/images/properties/campfire.jpeg",
        "privateRoomB64": "/images/properties/private-room.jpeg",
        "dormB64": "/images/properties/dormitary-room.jpeg",
        "$verandaB64": "/images/properties/varenda.jpeg",
        "$lakeViewB64": "/images/properties/lake-view.jpeg",
        "$diningB64": "/images/properties/dining.jpeg",
        "$campfireB64": "/images/properties/campfire.jpeg",
        "$privateRoomB64": "/images/properties/private-room.jpeg",
        "$dormB64": "/images/properties/dormitary-room.jpeg",
        "$verandaUrl": "/images/properties/varenda.jpeg",
        "$lakeViewUrl": "/images/properties/lake-view.jpeg",
        "$diningUrl": "/images/properties/dining.jpeg",
        "$campfireUrl": "/images/properties/campfire.jpeg",
        "$privateRoomUrl": "/images/properties/private-room.jpeg",
        "$dormUrl": "/images/properties/dormitary-room.jpeg",
    }

    for k, v in url_map.items():
        content = content.replace(f"'{k}'", f"'{v}'")

    with open(fpath, "w", encoding="utf-8") as f:
        f.write(content)

    print(f"Fixed destination modal in {fpath}")

files_to_fix = [
    "generate_html.ps1",
    "public/index.html",
    "public/Arbora_Retreats_Review.html"
]

for f in files_to_fix:
    fix_destination_modal(f)

