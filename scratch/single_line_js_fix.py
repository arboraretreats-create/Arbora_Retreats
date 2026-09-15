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

single_line_func = r"""    function openGmailCompose(name, phone) {
      var nameStr = name || 'Arboran';
      var phoneStr = phone || '';
      var subject = encodeURIComponent("Arbora Community Registration - " + nameStr);
      var bodyText = "Full Name: " + nameStr + "\nWhatsApp: " + phoneStr + "\n\nHi Arbora Team,\nI would like to join the Arbora community.";
      var gmailUrl = "https://mail.google.com/mail/?view=cm&fs=1&to=arboraretreats@gmail.com&su=" + subject + "&body=" + encodeURIComponent(bodyText);
      window.open(gmailUrl, '_blank');
    }"""

for fpath in files_to_fix:
    if not os.path.exists(fpath):
        continue
    with open(fpath, "r", encoding="utf-8", errors="ignore") as f:
        text = f.read()

    # Replace openGmailCompose function entirely
    import re
    text = re.sub(r'function openGmailCompose[\s\S]*?window\.open\(gmailUrl, \'_blank\'\);\s*\}', single_line_func, text)

    with open(fpath, "w", encoding="utf-8") as f:
        f.write(text)

    print(f"Fixed openGmailCompose in {fpath}")

