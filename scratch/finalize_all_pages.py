import os
import shutil

# Finalize script to verify and polish all HTML files

def finalize():
    # 1. Check index.html & Arbora_Retreats_Review.html
    with open("public/index.html", "r", encoding="utf-8") as f:
        idx_content = f.read()

    # Ensure Home Page navbar links point to team
    if '<a href="team"' not in idx_content and '<a href="team.html"' not in idx_content:
        idx_content = idx_content.replace(
            '<a href="cohorts" class="text-sandstoneGold font-bold hover:text-white transition-colors">Gatherings &rarr;</a>',
            '<a href="team" class="hover:text-warmCream transition-colors">Team</a>\n        <a href="cohorts" class="text-sandstoneGold font-bold hover:text-white transition-colors">Gatherings &rarr;</a>'
        )
        idx_content = idx_content.replace(
            '<a href="cohorts" onclick="toggleMobileMenu()" class="font-montserrat text-sm uppercase font-bold tracking-wider text-sandstoneGold">Gatherings &rarr;</a>',
            '<a href="team" onclick="toggleMobileMenu()" class="font-montserrat text-sm uppercase font-semibold tracking-wider text-crispLinen hover:text-warmCream">Meet The Team</a>\n    <a href="cohorts" onclick="toggleMobileMenu()" class="font-montserrat text-sm uppercase font-bold tracking-wider text-sandstoneGold">Gatherings &rarr;</a>'
        )

    # Save to index.html and Arbora_Retreats_Review.html
    with open("public/index.html", "w", encoding="utf-8") as f:
        f.write(idx_content)
    with open("public/Arbora_Retreats_Review.html", "w", encoding="utf-8") as f:
        f.write(idx_content)

    print(f"Finalized index.html ({len(idx_content)} bytes)")

    # 2. Check team.html & Arbora_Team_Review.html
    with open("public/team.html", "r", encoding="utf-8") as f:
        team_content = f.read()

    # Ensure team.html navbar has Home link
    if '<a href="/"' not in team_content and '<a href="index.html"' not in team_content:
        team_content = team_content.replace(
            '<nav class="hidden lg:flex items-center gap-5 lg:gap-7 xl:gap-9 font-montserrat text-xs tracking-[0.15em] uppercase font-semibold my-auto whitespace-nowrap text-[#F1F5F2]">',
            '<nav class="hidden lg:flex items-center gap-5 lg:gap-7 xl:gap-9 font-montserrat text-xs tracking-[0.15em] uppercase font-semibold my-auto whitespace-nowrap text-[#F1F5F2]">\n        <a href="/" class="hover:text-warmCream transition-colors">&larr; Home</a>'
        )

    # Save to team.html and Arbora_Team_Review.html
    with open("public/team.html", "w", encoding="utf-8") as f:
        f.write(team_content)
    with open("public/Arbora_Team_Review.html", "w", encoding="utf-8") as f:
        f.write(team_content)

    print(f"Finalized team.html ({len(team_content)} bytes)")

    # 3. Check cohorts.html & Arbora_Cohorts_Review.html
    with open("public/cohorts.html", "r", encoding="utf-8") as f:
        cohorts_content = f.read()

    if '<a href="/"' not in cohorts_content and '<a href="index.html"' not in cohorts_content:
        cohorts_content = cohorts_content.replace(
            '<nav class="hidden lg:flex items-center gap-5 lg:gap-7 xl:gap-9 font-montserrat text-xs tracking-[0.15em] uppercase font-semibold my-auto whitespace-nowrap text-[#F1F5F2]">',
            '<nav class="hidden lg:flex items-center gap-5 lg:gap-7 xl:gap-9 font-montserrat text-xs tracking-[0.15em] uppercase font-semibold my-auto whitespace-nowrap text-[#F1F5F2]">\n        <a href="/" class="hover:text-warmCream transition-colors">&larr; Home</a>'
        )

    with open("public/cohorts.html", "w", encoding="utf-8") as f:
        f.write(cohorts_content)
    with open("public/Arbora_Cohorts_Review.html", "w", encoding="utf-8") as f:
        f.write(cohorts_content)

    print(f"Finalized cohorts.html ({len(cohorts_content)} bytes)")

if __name__ == "__main__":
    finalize()
