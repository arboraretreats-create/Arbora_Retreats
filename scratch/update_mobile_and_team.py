import re
import os

ps1_path = r"c:\Users\DELL\.gemini\antigravity\scratch\myaiartmaker\generate_html.ps1"

with open(ps1_path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Fix openDestinationModal calls in generate_html.ps1 for both desktop grid and mobile carousel
replacements = {
    "openDestinationModal('The Estate Veranda', 'SETTING', '$verandaB64'": "openDestinationModal('The Estate Veranda', 'SETTING', '/images/properties/varenda.jpeg'",
    "openDestinationModal('Lakeside Reflection Zone', 'SETTING', '$lakeViewB64'": "openDestinationModal('Lakeside Reflection Zone', 'SETTING', '/images/properties/lake-view.jpeg'",
    "openDestinationModal('Long-Table Courtyard', 'SETTING', '$diningB64'": "openDestinationModal('Long-Table Courtyard', 'SETTING', '/images/properties/dining.jpeg'",
    "openDestinationModal('Starlit Campfire Circle', 'SETTING', '$campfireB64'": "openDestinationModal('Starlit Campfire Circle', 'SETTING', '/images/properties/campfire.jpeg'",
    "openDestinationModal('Rest Spaces', 'SETTING', '$privateRoomB64'": "openDestinationModal('Rest Spaces', 'SETTING', '/images/properties/private-room.jpeg'",
    "openDestinationModal('Dorm Quarters', 'SETTING', '$dormB64'": "openDestinationModal('Dorm Quarters', 'SETTING', '/images/properties/dormitary-room.jpeg'",
    
    "openDestinationModal('The Estate Veranda', 'SETTING', '$verandaUrl'": "openDestinationModal('The Estate Veranda', 'SETTING', '/images/properties/varenda.jpeg'",
    "openDestinationModal('Lakeside Reflection Zone', 'SETTING', '$lakeViewUrl'": "openDestinationModal('Lakeside Reflection Zone', 'SETTING', '/images/properties/lake-view.jpeg'",
    "openDestinationModal('Long-Table Courtyard', 'SETTING', '$diningUrl'": "openDestinationModal('Long-Table Courtyard', 'SETTING', '/images/properties/dining.jpeg'",
    "openDestinationModal('Starlit Campfire Circle', 'SETTING', '$campfireUrl'": "openDestinationModal('Starlit Campfire Circle', 'SETTING', '/images/properties/campfire.jpeg'",
    "openDestinationModal('Rest Spaces', 'SETTING', '$privateRoomUrl'": "openDestinationModal('Rest Spaces', 'SETTING', '/images/properties/private-room.jpeg'",
    "openDestinationModal('Dorm Quarters', 'SETTING', '$dormUrl'": "openDestinationModal('Dorm Quarters', 'SETTING', '/images/properties/dormitary-room.jpeg'",
}

for old_str, new_str in replacements.items():
    content = content.replace(old_str, new_str)

# 2. Add Mobile Carousel to Founders & Leadership Team Section in generate_html.ps1
# We search for the grid start and add desktop-only-grid class, and add mobile-only-carousel right below
old_founders_grid = '<div class="grid grid-cols-1 md:grid-cols-3 gap-8 items-stretch">'
new_founders_grid = '<div class="desktop-only-grid grid-cols-1 md:grid-cols-3 gap-8 items-stretch">'

content = content.replace(old_founders_grid, new_founders_grid)

old_platform_grid = '<div class="grid grid-cols-1 md:grid-cols-2 gap-6 items-stretch max-w-2xl mx-auto">'
new_platform_grid = '<div class="desktop-only-grid grid-cols-1 md:grid-cols-2 gap-6 items-stretch max-w-2xl mx-auto">'

content = content.replace(old_platform_grid, new_platform_grid)

# Insert full mobile carousel for Team Section right after the platform grid end div (before Section 3 INVESTORS)
mobile_team_carousel = """
        <!-- Mobile Touch Carousel for All Team Members -->
        <div class="mobile-only-carousel flex-col text-left mb-16">
          <div class="flex overflow-x-auto snap-x snap-mandatory gap-5 pb-6 -mx-6 px-6 no-scrollbar" onscroll="updateSectionDots(this, 'teamDots', 5)">
            
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

            <!-- Harsha Janardhana Giri -->
            <div class="snap-center shrink-0 w-[85vw] max-w-[320px] team-card-subtle p-5 flex flex-col justify-between">
              <div>
                <div class="relative w-full aspect-[4/5] rounded-2xl overflow-hidden mb-4 bg-[#EADBC8]/20">
                  <img src="$harshaUrl" alt="Harsha Janardhana Giri" class="w-full h-full object-cover object-top" />
                  <span class="absolute top-3 right-3 badge-overlay-dark">LEAD TECH ARCHITECT</span>
                </div>
                <h4 class="font-montserrat text-xl font-bold text-[#111111] mb-0.5">Harsha Janardhana Giri</h4>
                <p class="font-montserrat text-[10px] text-[#3D5A45] font-bold uppercase mb-2">TECHNOLOGY &amp; BACKEND LEAD</p>
                <p class="font-sans text-xs text-[#222222] leading-relaxed mb-3">Architected and maintains Arbora's digital infrastructure and community platform technology.</p>
              </div>
              <div class="philosophy-box space-y-1 font-sans text-xs text-[#222222]">
                <p><span class="font-bold text-[#111111]">&bull; Belief:</span> <span class="italic">&quot;Seamless tech that gets out of the way of real life.&quot;</span></p>
              </div>
            </div>

            <!-- Kavya M -->
            <div class="snap-center shrink-0 w-[85vw] max-w-[320px] team-card-subtle p-5 flex flex-col justify-between">
              <div>
                <div class="relative w-full aspect-[4/5] rounded-2xl overflow-hidden mb-4 bg-[#EADBC8]/20">
                  <img src="$kavyaUrl" alt="Kavya M" class="w-full h-full object-cover object-top" />
                  <span class="absolute top-3 right-3 badge-overlay-dark">JAM ARTIST</span>
                </div>
                <h4 class="font-montserrat text-xl font-bold text-[#111111] mb-0.5">Kavya M</h4>
                <p class="font-montserrat text-[10px] text-[#3D5A45] font-bold uppercase mb-2">SINGER &middot; JAM ARTIST</p>
                <p class="font-sans text-xs text-[#222222] leading-relaxed mb-3">Soulful vocals that bring people together across fireside sessions and acoustic evening circles.</p>
              </div>
              <div class="philosophy-box space-y-1 font-sans text-xs text-[#222222]">
                <p><span class="font-bold text-[#111111]">&bull; Belief:</span> <span class="italic">&quot;Music creates the unscripted magic where strangers become family.&quot;</span></p>
              </div>
            </div>

          </div>

          <div class="flex items-center justify-center mt-4">
            <div id="teamDots" class="flex items-center gap-1.5">
              <span class="h-2 w-7 bg-[#12241C] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
              <span class="h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300"></span>
            </div>
          </div>
        </div>
"""

# Insert mobile_team_carousel right before "<!-- 3. SUBSECTION: STRATEGIC BACKERS & INVESTORS -->"
target_sec = "<!-- 3. SUBSECTION: STRATEGIC BACKERS & INVESTORS -->"
if target_sec in content and "id=\"teamDots\"" not in content:
    content = content.replace(target_sec, mobile_team_carousel + "\n      " + target_sec)

with open(ps1_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Updated generate_html.ps1 successfully!")
