import re

with open("public/team.html", "r", encoding="utf-8", errors="ignore") as f:
    text = f.read()

img_matches = re.finditer(r'<img[^>]+src=[\'"](data:image\/[^\'"]+)[\'"][^>]*>', text)
for i, m in enumerate(img_matches):
    start = max(0, m.start() - 200)
    end = min(len(text), m.end() + 200)
    snippet = text[start:end]
    clean_snippet = re.sub(r'data:image\/[a-zA-Z]+;base64,[A-Za-z0-9+/=]+', '[BASE64_DATA]', snippet)
    print(f"=== TEAM IMG {i+1} ===")
    print(clean_snippet)
    print("="*40)
