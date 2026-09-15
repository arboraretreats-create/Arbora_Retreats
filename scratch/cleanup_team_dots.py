import os

def clean_leftover_teamdots(fpath):
    if not os.path.exists(fpath):
        return
    with open(fpath, "r", encoding="utf-8") as f:
        text = f.read()

    # Pattern for leftover teamDots wrapper
    leftover = """        
        

          <div class="flex items-center justify-center mt-4">
            <div id="teamDots" class="flex items-center gap-1.5">
              <span class="h-2 w-7 bg-[#12241C] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
            </div>
          </div>
        </div>"""

    if leftover in text:
        text = text.replace(leftover, "")
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(text)
        print(f"Cleaned leftover teamDots from {fpath}")

files_to_clean = [
    "generate_html.ps1",
    "public/index.html",
    "public/Arbora_Retreats_Review.html",
    "public/team.html",
    "public/Arbora_Team_Review.html"
]

for f in files_to_clean:
    clean_leftover_teamdots(f)

