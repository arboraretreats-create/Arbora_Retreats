import React from "react";
import { COHORTS_HTML_BODY } from "@/lib/htmlContent";

export default function CohortsPage() {
  return (
    <div
      dangerouslySetInnerHTML={{ __html: COHORTS_HTML_BODY }}
      className="w-full min-h-screen bg-[#0B1712] text-[#F1F5F2]"
    />
  );
}
