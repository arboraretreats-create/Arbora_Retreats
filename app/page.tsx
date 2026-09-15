import React from "react";
import { INDEX_HTML_BODY } from "@/lib/htmlContent";

export default function HomePage() {
  return (
    <div
      dangerouslySetInnerHTML={{ __html: INDEX_HTML_BODY }}
      className="w-full min-h-screen bg-[#0B1712] text-[#F1F5F2]"
    />
  );
}
