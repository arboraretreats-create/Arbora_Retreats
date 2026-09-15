import os
import re

ps1_path = r"c:\Users\DELL\.gemini\antigravity\scratch\myaiartmaker\generate_html.ps1"

with open(ps1_path, "r", encoding="utf-8") as f:
    ps1_content = f.read()

# Define the clean Home Page Section 09 (Arbora Story + MEET THE TEAM CTA button)
home_section_09 = """  <!-- 09 — WHY ARBORA EXISTS & OUR COMMUNITY STORY -->
  <section id="why-we-exist" class="py-24 px-6 bg-warmSage text-charcoalGreen scroll-mt-16">
    <div class="max-w-7xl mx-auto">
      
      <!-- HERO BANNER -->
      <div class="text-center max-w-4xl mx-auto mb-16 reveal-on-scroll">
        <div class="inline-flex items-center gap-2 mb-4 px-4 py-1 rounded-full bg-[#1A3327] border border-[#C5A880]/40 font-montserrat text-xs text-[#C5A880] font-bold uppercase tracking-widest">
          <span>&#9733; The Belief Behind Arbora</span>
        </div>
        <h2 class="font-heading text-4xl md:text-6xl font-normal uppercase tracking-wide text-[#0D1C13] leading-tight mb-4">
          WHY ARBORA EXISTS <br />
          <span class="text-[#3D5A45] font-heading tracking-wide">&amp; OUR COMMUNITY STORY</span>
        </h2>
        <p class="font-sans text-sm md:text-base text-[#2C3E33] max-w-2xl mx-auto leading-relaxed font-medium">
          The story, culture, and team bringing real human connection back into travel.
        </p>
      </div>

      <!-- THE ARBORA STORY & MEET THE TEAM CTA -->
      <div class="investor-outer-card p-10 md:p-14 max-w-5xl mx-auto shadow-2xl">
        <span class="font-montserrat text-xs font-bold text-[#C5A880] uppercase tracking-widest block mb-2">ORIGIN &amp; VISION</span>
        <h3 class="font-heading text-3xl md:text-5xl uppercase tracking-wider text-[#EADBC8] mb-6">THE ARBORA STORY</h3>
        
        <div class="space-y-4 font-sans text-xs md:text-sm text-[#A3B8AD] leading-relaxed font-medium mb-10">
          <p>
            Arbora was founded in 2026 out of a simple observation: conventional travel platforms treat accommodation as a transactional line item. Guests book rooms, check in, stay isolated, and check out without ever experiencing true human connection or regional immersion.
          </p>
          <p>
            We set out to build something radically different — a community brand centered on experiences that partners directly with premium estate owners like Sura Stays in Mudigere. By introducing The Arbora Way and our 30-Experience Directory, Arbora creates unscripted stories shared with kindred souls.
          </p>
          <p>
            Supported by Chukki Talkies as our strategic media and investment partner, Arbora is scaling across Chikmagalur, Coorg, Gokarna, and the Western Ghats.
          </p>
        </div>

        <!-- CTA TO TEAM PAGE -->
        <div class="pt-6 border-t border-white/10 text-center flex flex-col sm:flex-row items-center justify-between gap-4">
          <div class="text-left">
            <h4 class="font-montserrat text-base font-bold text-crispLinen">Meet The Builders Of Arbora</h4>
            <p class="font-sans text-xs text-mutedSage">Discover the founders, technology architects, artists, and investors shaping Arbora.</p>
          </div>
          <a href="team" class="shrink-0 inline-flex items-center gap-2.5 btn-shine-clean font-montserrat text-xs font-bold uppercase tracking-widest px-8 py-3.5 rounded-full shadow-2xl hover:scale-105 transition-transform">
            <span>MEET THE TEAM &rarr;</span>
          </a>
        </div>
      </div>

    </div>
  </section>"""

# Replace Section 09 in generate_html.ps1 with home_section_09
old_sec_09_pattern = re.compile(r'<!-- 09 — WHY ARBORA EXISTS[\s\S]*?<!-- 10 — COMMUNITY MEMBERSHIP CTA -->', re.MULTILINE)

ps1_updated = old_sec_09_pattern.sub(home_section_09 + "\n\n  <!-- 10 — COMMUNITY MEMBERSHIP CTA -->", ps1_content)

with open(ps1_path, "w", encoding="utf-8") as f:
    f.write(ps1_updated)

print("Updated generate_html.ps1 for clean Home Page Section 09!")
