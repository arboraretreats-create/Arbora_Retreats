import os

files_to_clean = [
    "generate_html.ps1",
    "public/index.html",
    "public/Arbora_Retreats_Review.html",
    "public/team.html",
    "public/Arbora_Team_Review.html"
]

target_sub = """<div id="teamDots" class="flex items-center gap-1.5">
              <span class="h-2 w-7 bg-[#12241C] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
            </div>
          </div>
        </div>"""

for fpath in files_to_clean:
    if os.path.exists(fpath):
        with open(fpath, "r", encoding="utf-8") as f:
            text = f.read()
        if target_sub in text:
            # find start of parent div container
            pos = text.find(target_sub)
            start_p = text.rfind('<div class="flex items-center justify-center mt-4">', 0, pos)
            end_p = pos + len(target_sub)
            text = text[:start_p] + text[end_p:]
            with open(fpath, "w", encoding="utf-8") as f:
                f.write(text)
            print(f"Removed leftover teamDots from {fpath}")
