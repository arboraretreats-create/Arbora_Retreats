import os

files_to_fix = [
    "generate_html.ps1",
    "public/index.html",
    "public/Arbora_Retreats_Review.html",
    "public/team.html",
    "public/Arbora_Team_Review.html",
    "public/cohorts.html",
    "public/Arbora_Cohorts_Review.html"
]

clean_func_str = """    function openGmailCompose(name, phone) {
      var nameStr = name || 'Arboran';
      var phoneStr = phone || '';
      var subject = encodeURIComponent("Arbora Community Registration - " + nameStr);
      var bodyText = "Full Name: " + nameStr + " | WhatsApp: " + phoneStr + " | Hi Arbora Team, I would like to join the Arbora community.";
      var gmailUrl = "https://mail.google.com/mail/?view=cm&fs=1&to=arboraretreats@gmail.com&su=" + subject + "&body=" + encodeURIComponent(bodyText);
      window.open(gmailUrl, '_blank');
    }"""

import re
pattern = re.compile(r'function openGmailCompose[\s\S]*?window\.open\(gmailUrl, \'_blank\'\);\s*\}')

for fpath in files_to_fix:
    if os.path.exists(fpath):
        with open(fpath, "r", encoding="utf-8", errors="ignore") as f:
            text = f.read()

        text = pattern.sub(clean_func_str, text)

        with open(fpath, "w", encoding="utf-8") as f:
            f.write(text)

        print(f"Fixed raw newlines cleanly in {fpath}")

