import os

def main():
    os.makedirs("lib", exist_ok=True)
    
    with open("public/index.html", "r", encoding="utf-8") as f:
        index_html = f.read()
        
    with open("public/cohorts.html", "r", encoding="utf-8") as f:
        cohorts_html = f.read()
        
    with open("public/team.html", "r", encoding="utf-8") as f:
        team_html = f.read()
        
    # Extract inner body content if present
    import re
    m_index = re.search(r'<body[^>]*>([\s\S]*)<\/body>', index_html, re.I)
    index_body = m_index.group(1) if m_index else index_html

    m_cohorts = re.search(r'<body[^>]*>([\s\S]*)<\/body>', cohorts_html, re.I)
    cohorts_body = m_cohorts.group(1) if m_cohorts else cohorts_html

    m_team = re.search(r'<body[^>]*>([\s\S]*)<\/body>', team_html, re.I)
    team_body = m_team.group(1) if m_team else team_html

    ts_content = f'''// Auto-generated Arbora HTML Content for Server Components
export const INDEX_HTML_BODY = {repr(index_body)};
export const COHORTS_HTML_BODY = {repr(cohorts_body)};
export const TEAM_HTML_BODY = {repr(team_body)};
'''

    with open("lib/htmlContent.ts", "w", encoding="utf-8") as f:
        f.write(ts_content)

    print("Successfully generated lib/htmlContent.ts!")

if __name__ == "__main__":
    main()
