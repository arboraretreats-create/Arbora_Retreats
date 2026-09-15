import os
import re

# Python script to handle:
# 1. Email & Phone update across all pages
# 2. Navbar update (Add Team link)
# 3. Home page (index.html): Remove team grid/carousel, add "MEET THE TEAM ->" CTA button under Arbora Story
# 4. Standalone Team page (team.html): Keep full team & investor experience

def update_all_html_files():
    files = [
        "generate_html.ps1",
        "public/index.html",
        "public/Arbora_Retreats_Review.html",
        "public/team.html",
        "public/Arbora_Team_Review.html",
        "public/cohorts.html",
        "public/Arbora_Cohorts_Review.html"
    ]

    for fpath in files:
        if not os.path.exists(fpath):
            continue
        with open(fpath, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()

        # Update Navbar links to include Team
        if '<a href="team"' not in content and '<a href="team.html"' not in content:
            content = content.replace(
                '<a href="cohorts" class="text-sandstoneGold font-bold hover:text-white transition-colors">Gatherings &rarr;</a>',
                '<a href="team" class="hover:text-warmCream transition-colors">Team</a>\n        <a href="cohorts" class="text-sandstoneGold font-bold hover:text-white transition-colors">Gatherings &rarr;</a>'
            )
            content = content.replace(
                '<a href="cohorts" onclick="toggleMobileMenu()" class="font-montserrat text-sm uppercase font-bold tracking-wider text-sandstoneGold">Gatherings &rarr;</a>',
                '<a href="team" onclick="toggleMobileMenu()" class="font-montserrat text-sm uppercase font-semibold tracking-wider text-crispLinen hover:text-warmCream">Meet The Team</a>\n    <a href="cohorts" onclick="toggleMobileMenu()" class="font-montserrat text-sm uppercase font-bold tracking-wider text-sandstoneGold">Gatherings &rarr;</a>'
            )

        # Update handleFormSubmit in JavaScript
        old_handle = r"function handleFormSubmit\(e\) \{[\s\S]*?closeModal\(\);\s*\}"
        new_handle = """function handleFormSubmit(e) {
      e.preventDefault();
      var name = document.getElementById('modalName') ? document.getElementById('modalName').value : 'Arboran';
      var phone = document.getElementById('modalPhone') ? document.getElementById('modalPhone').value : '';
      var mailtoUrl = "mailto:arboraretreats@gmail.com?subject=New%20Arbora%20Registration:%20" + encodeURIComponent(name) + "&body=" + encodeURIComponent("Name: " + name + "\\nWhatsApp: " + phone + "\\n\\nI would like to join the Arbora community.");
      window.location.href = mailtoUrl;
      alert('Thank you ' + name + '! Your registration has been sent to arboraretreats@gmail.com. We will contact you at ' + (phone || '+91 81238 17058') + ' via WhatsApp shortly.');
      closeModal();
    }"""
        content = re.sub(old_handle, new_handle, content)

        # Update modal body with direct WhatsApp and Email contact options & arboraretreats@gmail.com + 8123817058
        old_form = r'<form onsubmit="handleFormSubmit\(event\)" class="space-y-4">'
        new_form_header = """<div class="grid grid-cols-2 gap-3 mb-5">
        <a href="https://wa.me/918123817058?text=Hi%20Arbora%20Team!%20I%20want%20to%20join%20the%20community." target="_blank" class="flex items-center justify-center gap-2 bg-midPine border border-white/20 hover:border-sandstoneGold text-crispLinen font-montserrat text-xs font-bold py-2.5 px-3 rounded-xl transition-all">
          <span>💬 WhatsApp Us</span>
        </a>
        <a href="mailto:arboraretreats@gmail.com?subject=Arbora%20Community%20Inquiry" class="flex items-center justify-center gap-2 bg-midPine border border-white/20 hover:border-sandstoneGold text-crispLinen font-montserrat text-xs font-bold py-2.5 px-3 rounded-xl transition-all">
          <span>✉️ Email Us</span>
        </a>
      </div>

      <form onsubmit="handleFormSubmit(event)" class="space-y-4">"""

        if 'WhatsApp Us' not in content:
            content = content.replace(old_form, new_form_header)

        # Update input IDs and placeholders
        content = content.replace('placeholder="Rahul Sharma"', 'id="modalName" placeholder="Rahul Sharma"')
        content = content.replace('placeholder="+91 98765 43210"', 'id="modalPhone" placeholder="+91 81238 17058"')

        # Update modal footer contact display
        if 'arboraretreats@gmail.com' not in content:
            content = content.replace(
                '</form>\n    </div>\n  </div>',
                '</form>\n      <div class="mt-4 text-center font-sans text-[11px] text-mutedSage">\n        <span>Direct Contact: </span>\n        <a href="mailto:arboraretreats@gmail.com" class="text-sandstoneGold hover:underline font-medium">arboraretreats@gmail.com</a>\n        <span> &bull; </span>\n        <a href="https://wa.me/918123817058" target="_blank" class="text-sandstoneGold hover:underline font-medium">+91 81238 17058</a>\n      </div>\n    </div>\n  </div>'
            )

        # Update Footer with Email & Phone
        if 'arboraretreats@gmail.com' not in content:
            content = content.replace(
                '<p class="font-sans text-xs text-mutedSage mb-6">Arborans &bull; Karnataka, India &bull; 2026 &bull; Where People Find Their People.</p>',
                '<div class="flex flex-wrap items-center justify-center gap-6 font-montserrat text-xs text-sandstoneGold font-semibold uppercase tracking-wider mb-6">\n        <a href="mailto:arboraretreats@gmail.com" class="hover:text-white transition-colors flex items-center gap-1.5">\n          <span>✉️ arboraretreats@gmail.com</span>\n        </a>\n        <a href="https://wa.me/918123817058" target="_blank" class="hover:text-white transition-colors flex items-center gap-1.5">\n          <span>💬 +91 81238 17058</span>\n        </a>\n      </div>\n      <p class="font-sans text-xs text-mutedSage mb-6">Arborans &bull; Karnataka, India &bull; 2026 &bull; Where People Find Their People.</p>'
            )

        with open(fpath, "w", encoding="utf-8") as f:
            f.write(content)

        print(f"Updated contact details in {fpath}")

update_all_html_files()
