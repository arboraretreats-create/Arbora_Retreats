import os
import re

def fix_all_js_syntax():
    files = [
        "generate_html.ps1",
        "public/index.html",
        "public/Arbora_Retreats_Review.html",
        "public/team.html",
        "public/Arbora_Team_Review.html",
        "public/cohorts.html",
        "public/Arbora_Cohorts_Review.html"
    ]

    clean_script = """    function toggleMobileMenu() {
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
      var body = encodeURIComponent("Full Name: " + nameStr + "\\nWhatsApp / Phone: " + phoneStr + "\\n\\nHi Arbora Team,\\nI would like to join the Arbora community.");
      var gmailUrl = "https://mail.google.com/mail/?view=cm&fs=1&to=arboraretreats@gmail.com&su=" + subject + "&body=" + body;
      window.open(gmailUrl, '_blank');
    }
    function handleFormSubmit(e) {
      e.preventDefault();
      var name = document.getElementById('modalName') ? document.getElementById('modalName').value : 'Arboran';
      var phone = document.getElementById('modalPhone') ? document.getElementById('modalPhone').value : '';
      openGmailCompose(name, phone);
      alert('Thank you ' + name + '! Redirecting to Gmail Compose for arboraretreats@gmail.com. We will also reach out to ' + (phone || '+91 81238 17058') + ' via WhatsApp.');
      closeModal();
    }"""

    for fpath in files:
        if not os.path.exists(fpath):
            continue
        with open(fpath, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()

        # Fix broken handleFormSubmit multiline syntax error
        old_pattern = r'function toggleMobileMenu\(\)[\s\S]*?function handleFormSubmit\(e\) \{[\s\S]*?closeModal\(\);\s*\}'
        content = re.sub(old_pattern, clean_script, content)

        # Direct Gmail Compose button links for Email Us buttons
        content = content.replace(
            'href="mailto:arboraretreats@gmail.com?subject=Arbora%20Community%20Inquiry"',
            'href="https://mail.google.com/mail/?view=cm&fs=1&to=arboraretreats@gmail.com&su=Arbora%20Community%20Inquiry" target="_blank"'
        )
        content = content.replace(
            'href="mailto:arboraretreats@gmail.com"',
            'href="https://mail.google.com/mail/?view=cm&fs=1&to=arboraretreats@gmail.com&su=Arbora%20Community%20Inquiry" target="_blank"'
        )

        with open(fpath, "w", encoding="utf-8") as f:
            f.write(content)

        print(f"Fixed JS syntax & Gmail redirect in {fpath}")

if __name__ == "__main__":
    fix_all_js_syntax()
