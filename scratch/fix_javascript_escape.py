import os
import re

files_to_fix = [
    "generate_html.ps1",
    "public/index.html",
    "public/Arbora_Retreats_Review.html",
    "public/team.html",
    "public/Arbora_Team_Review.html",
    "public/cohorts.html",
    "public/Arbora_Cohorts_Review.html"
]

clean_js_block = """    function toggleMobileMenu() {
      var menu = document.getElementById('mobileDropdown');
      if (menu) {
        if (menu.classList.contains('hidden')) { menu.classList.remove('hidden'); }
        else { menu.classList.add('hidden'); }
      }
    }
    function openModal() {
      var modal = document.getElementById('bookingModal');
      if (modal) { modal.classList.remove('hidden'); }
    }
    function closeModal() {
      var modal = document.getElementById('bookingModal');
      if (modal) { modal.classList.add('hidden'); }
    }
    function openGmailCompose(name, phone) {
      var nameStr = name || 'Arboran';
      var phoneStr = phone || '';
      var subject = encodeURIComponent("Arbora Community Registration - " + nameStr);
      var bodyText = "Full Name: " + nameStr + "\\nWhatsApp: " + phoneStr + "\\n\\nHi Arbora Team,\\nI would like to join the Arbora community.";
      var gmailUrl = "https://mail.google.com/mail/?view=cm&fs=1&to=arboraretreats@gmail.com&su=" + subject + "&body=" + encodeURIComponent(bodyText);
      window.open(gmailUrl, '_blank');
    }
    function handleFormSubmit(e) {
      e.preventDefault();
      var name = document.getElementById('modalName') ? document.getElementById('modalName').value : 'Arboran';
      var phone = document.getElementById('modalPhone') ? document.getElementById('modalPhone').value : '';
      openGmailCompose(name, phone);
      alert('Thank you ' + name + '! Directing you to Gmail compose for arboraretreats@gmail.com. We will also contact you at ' + (phone || '+91 81238 17058') + ' via WhatsApp.');
      closeModal();
    }"""

for fpath in files_to_fix:
    if not os.path.exists(fpath):
        continue
    with open(fpath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()

    # Match from toggleMobileMenu to handleFormSubmit end
    pattern = re.compile(r'\s*function toggleMobileMenu\(\)[\s\S]*?function handleFormSubmit\(e\) \{[\s\S]*?closeModal\(\);\s*\}', re.MULTILINE)
    content = pattern.sub("\n" + clean_js_block, content)

    with open(fpath, "w", encoding="utf-8") as f:
        f.write(content)

    print(f"Cleaned JavaScript in {fpath}")

