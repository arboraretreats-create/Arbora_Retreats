import re

with open("public/team.html", "r", encoding="utf-8", errors="ignore") as f:
    text = f.read()

# Find img tags or surrounding text for base64 strings
img_tags = re.findall(r'<img[^>]+src=[\'"](data:image\/[^\'"]+)[\'"][^>]*>', text)
for i, tag in enumerate(img_tags):
    # print context of tag
    pos = text.find(tag[:30])
    snippet = text[max(0, pos-100):min(len(text), pos+300)]
    print(f"--- TEAM IMG {i+1} ---")
    print(re.sub(r'data:image\/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+', '[BASE64_DATA]', snippet))
    print()

with open("public/cohorts.html", "r", encoding="utf-8", errors="ignore") as f:
    ctext = f.read()

c_img_tags = re.findall(r'<img[^>]+src=[\'"](data:image\/[^\'"]+)[\'"][^>]*>', ctext)
for i, tag in enumerate(c_img_tags):
    pos = ctext.find(tag[:30])
    snippet = ctext[max(0, pos-100):min(len(ctext), pos+300)]
    print(f"--- COHORTS IMG {i+1} ---")
    print(re.sub(r'data:image\/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+', '[BASE64_DATA]', snippet))
    print()
