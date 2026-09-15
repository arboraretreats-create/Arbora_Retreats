import re

ps1_path = r"c:\Users\DELL\.gemini\antigravity\scratch\myaiartmaker\generate_html.ps1"

with open(ps1_path, "r", encoding="utf-8") as f:
    content = f.read()

# Replace the single merged mobile team carousel with separate carousels for Founders and Leads
founders_mobile_carousel = """
        <!-- Mobile Touch Carousel for Founders (3 Cards) -->
        <div class="mobile-only-carousel flex-col text-left">
          <div class="flex overflow-x-auto snap-x snap-mandatory gap-5 pb-6 -mx-6 px-6 no-scrollbar" onscroll="updateSectionDots(this, 'founderDots', 3)">
            
            <!-- Adithya Manjunath -->
            <div class="snap-center shrink-0 w-[85vw] max-w-[320px] team-card-subtle p-5 flex flex-col justify-between">
              <div>
                <div class="relative w-full aspect-[4/5] rounded-2xl overflow-hidden mb-4">
                  <img src="$adithyaMUrl" alt="Adithya Manjunath" class="w-full h-full object-cover object-top" />
                  <span class="absolute top-3 right-3 badge-overlay-dark">FOUNDER &amp; CEO</span>
                </div>
                <h4 class="font-montserrat text-xl font-bold text-[#111111] mb-0.5">Adithya Manjunath</h4>
                <p class="font-montserrat text-[10px] text-[#3D5A45] font-bold uppercase mb-2">FOUNDER &amp; CEO</p>
                <p class="font-sans text-xs text-[#222222] leading-relaxed mb-3">Leads Arbora's community vision, brand strategy, estate partnerships, and expansion.</p>
              </div>
              <div class="philosophy-box space-y-1 font-sans text-xs text-[#222222]">
                <p><span class="font-bold text-[#111111]">&bull; Belief:</span> <span class="italic">&quot;Travel is meaningless without genuine human presence.&quot;</span></p>
              </div>
            </div>

            <!-- Sumana Sarkar -->
            <div class="snap-center shrink-0 w-[85vw] max-w-[320px] team-card-subtle p-5 flex flex-col justify-between">
              <div>
                <div class="relative w-full aspect-[4/5] rounded-2xl overflow-hidden mb-4">
                  <img src="$sumanaUrl" alt="Sumana Sarkar" class="w-full h-full object-cover object-top" />
                  <span class="absolute top-3 right-3 badge-overlay-dark">CO-FOUNDER</span>
                </div>
                <h4 class="font-montserrat text-xl font-bold text-[#111111] mb-0.5">Sumana Sarkar</h4>
                <p class="font-montserrat text-[10px] text-[#3D5A45] font-bold uppercase mb-2">CO-FOUNDER &middot; STRATEGY &amp; MARKETING</p>
                <p class="font-sans text-xs text-[#222222] leading-relaxed mb-3">Shapes the strategic vision, audience engagement, positioning, and storytelling for Arbora.</p>
              </div>
              <div class="philosophy-box space-y-1 font-sans text-xs text-[#222222]">
                <p><span class="font-bold text-[#111111]">&bull; Belief:</span> <span class="italic">&quot;Creating spaces where strangers transform into lifelong friends.&quot;</span></p>
              </div>
            </div>

            <!-- Shashank Madhu -->
            <div class="snap-center shrink-0 w-[85vw] max-w-[320px] team-card-subtle p-5 flex flex-col justify-between">
              <div>
                <div class="relative w-full aspect-[4/5] rounded-2xl overflow-hidden mb-4">
                  <img src="$shashankUrl" alt="Shashank Madhu" class="w-full h-full object-cover object-top" />
                  <span class="absolute top-3 right-3 badge-overlay-dark">EXECUTIVE</span>
                </div>
                <h4 class="font-montserrat text-xl font-bold text-[#111111] mb-0.5">Shashank Madhu</h4>
                <p class="font-montserrat text-[10px] text-[#3D5A45] font-bold uppercase mb-2">OPERATIONS &amp; RETREAT EXPERIENCE</p>
                <p class="font-sans text-xs text-[#222222] leading-relaxed mb-3">Manages retreat operations, hospitality standards, on-site logistics, and Arboran experiences.</p>
              </div>
              <div class="philosophy-box space-y-1 font-sans text-xs text-[#222222]">
                <p><span class="font-bold text-[#111111]">&bull; Belief:</span> <span class="italic">&quot;Flawless execution unlocks effortless community connection.&quot;</span></p>
              </div>
            </div>

          </div>

          <div class="flex items-center justify-center mt-3">
            <div id="founderDots" class="flex items-center gap-1.5">
              <span class="h-2 w-7 bg-[#12241C] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
            </div>
          </div>
        </div>"""

leads_mobile_carousel = """
        <!-- Mobile Touch Carousel for Platform & Artist Leads (2 Cards) -->
        <div class="mobile-only-carousel flex-col text-left">
          <div class="flex overflow-x-auto snap-x snap-mandatory gap-5 pb-6 -mx-6 px-6 no-scrollbar" onscroll="updateSectionDots(this, 'leadDots', 2)">
            
            <!-- Harsha Janardhana Giri -->
            <div class="snap-center shrink-0 w-[85vw] max-w-[320px] team-card-compact p-4 flex flex-col justify-between">
              <div>
                <div class="relative w-full aspect-[4/5] rounded-xl overflow-hidden mb-4 bg-[#EADBC8]/20">
                  <img src="$harshaUrl" alt="Harsha Janardhana Giri" class="w-full h-full object-cover object-top" />
                  <span class="absolute top-2.5 right-2.5 badge-overlay-sm">LEAD TECH ARCHITECT</span>
                </div>
                <h4 class="font-montserrat text-lg font-bold text-[#111111] mb-0.5">Harsha Janardhana Giri</h4>
                <p class="font-montserrat text-[10px] text-[#3D5A45] font-bold uppercase mb-2">TECHNOLOGY &amp; BACKEND LEAD</p>
                <p class="font-sans text-[11px] text-[#222222] leading-relaxed mb-3">Architected and maintains Arbora's digital infrastructure and community platform technology.</p>
              </div>
              <div class="philosophy-box-sm space-y-1 font-sans text-[11px] text-[#222222]">
                <p><span class="font-bold text-[#111111]">&bull; Belief:</span> <span class="italic">&quot;Seamless tech that gets out of the way of real life.&quot;</span></p>
              </div>
            </div>

            <!-- Kavya M -->
            <div class="snap-center shrink-0 w-[85vw] max-w-[320px] team-card-compact p-4 flex flex-col justify-between">
              <div>
                <div class="relative w-full aspect-[4/5] rounded-xl overflow-hidden mb-4 bg-[#EADBC8]/20">
                  <img src="$kavyaUrl" alt="Kavya M" class="w-full h-full object-cover object-top" />
                  <span class="absolute top-2.5 right-2.5 badge-overlay-sm">JAM ARTIST</span>
                </div>
                <h4 class="font-montserrat text-lg font-bold text-[#111111] mb-0.5">Kavya M</h4>
                <p class="font-montserrat text-[10px] text-[#3D5A45] font-bold uppercase mb-2">SINGER &middot; JAM ARTIST</p>
                <p class="font-sans text-[11px] text-[#222222] leading-relaxed mb-3">Soulful vocals that bring people together across fireside sessions and acoustic evening circles.</p>
              </div>
              <div class="philosophy-box-sm space-y-1 font-sans text-[11px] text-[#222222]">
                <p><span class="font-bold text-[#111111]">&bull; Belief:</span> <span class="italic">&quot;Music creates the unscripted magic where strangers become family.&quot;</span></p>
              </div>
            </div>

          </div>

          <div class="flex items-center justify-center mt-3">
            <div id="leadDots" class="flex items-center gap-1.5">
              <span class="h-2 w-7 bg-[#12241C] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
            </div>
          </div>
        </div>"""

# Remove old single merged carousel block if present
old_merged_carousel_pattern = re.compile(r'<!-- Mobile Touch Carousel for All Team Members -->[\s\S]*?</div>\s*</div>\s*</div>', re.MULTILINE)
content = old_merged_carousel_pattern.sub('', content)

# Also remove any leftover teamDots block
content = re.sub(r'<!-- Mobile Touch Carousel for All Team Members -->[\s\S]*?id="teamDots"[\s\S]*?</div>\s*</div>\s*</div>', '', content)

# Now insert founders_mobile_carousel directly inside Subsection 1 (after founders desktop grid div)
target_founders_end = '<!-- Shashank Madhu -->[\s\S]*?</div>\s*</div>\s*</div>'
m_founders = re.search(r'(<!-- Shashank Madhu -->[\s\S]*?</div>\s*</div>\s*</div>)', content)
if m_founders:
    old_founders_block = m_founders.group(1)
    new_founders_block = old_founders_block + "\n" + founders_mobile_carousel
    content = content.replace(old_founders_block, new_founders_block, 1)

# Insert leads_mobile_carousel directly inside Subsection 2 (after leads desktop grid div)
m_leads = re.search(r'(<!-- Kavya M -->[\s\S]*?</div>\s*</div>\s*</div>)', content)
if m_leads:
    old_leads_block = m_leads.group(1)
    new_leads_block = old_leads_block + "\n" + leads_mobile_carousel
    content = content.replace(old_leads_block, new_leads_block, 1)

with open(ps1_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Updated generate_html.ps1 with separate team carousels!")
