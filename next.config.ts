import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  async rewrites() {
    return [
      {
        source: "/",
        destination: "/index.html",
      },
      {
        source: "/cohorts",
        destination: "/cohorts.html",
      },
      {
        source: "/team",
        destination: "/team.html",
      },
      {
        source: "/checkout",
        destination: "/checkout.html",
      },
      {
        source: "/terms",
        destination: "/terms.html",
      },
      {
        source: "/policies",
        destination: "/terms.html",
      },
    ];
  },
};

export default nextConfig;
