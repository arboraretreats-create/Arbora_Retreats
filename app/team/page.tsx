import React from "react";
import { TEAM_HTML_BODY } from "@/lib/htmlContent";

export default function TeamPage() {
  return (
    <div
      dangerouslySetInnerHTML={{ __html: TEAM_HTML_BODY }}
      className="w-full min-h-screen bg-[#0B1712] text-[#F1F5F2]"
    />
  );
}
