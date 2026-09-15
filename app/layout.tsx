import type { Metadata } from "next";
import Script from "next/script";
import "./globals.css";
import ArboraInitializer from "@/components/ArboraInitializer";

export const metadata: Metadata = {
  metadataBase: new URL("https://arbora-retreats.vercel.app"),
  title: {
    default: "Arbora | Where People Find Their People",
    template: "%s | Arbora",
  },
  description: "Arbora creates intentional spaces for people to slow down, meet openly, make things, and return home with people who feel familiar.",
  keywords: [
    "Arbora",
    "Arbora Retreats",
    "Community & Experiences",
    "Where People Find Their People",
    "Sura Stays Mudigere",
    "Coffee Estate Gatherings",
    "Western Ghats Retreats"
  ],
  authors: [{ name: "Arbora Experience Brand" }],
  creator: "Arbora",
  publisher: "Arbora",
  openGraph: {
    title: "Arbora | Where People Find Their People",
    description: "Arbora creates intentional spaces for people to slow down, meet openly, make things, and return home with people who feel familiar.",
    url: "https://arbora-retreats.vercel.app",
    siteName: "Arbora",
    locale: "en_US",
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "Arbora | Where People Find Their People",
    description: "Arbora creates intentional spaces for people to slow down, meet openly, make things, and return home with people who feel familiar.",
  },
  robots: {
    index: true,
    follow: true,
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="scroll-smooth bg-[#0B1712] text-[#F1F5F2]">
      <head>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link
          href="https://fonts.googleapis.com/css2?family=Anton&family=Montserrat:wght@300;400;500;600;700;800&family=Inter:wght@300;400;500;600;700&display=swap"
          rel="stylesheet"
        />
        <script src="https://cdn.tailwindcss.com"></script>
        <script
          dangerouslySetInnerHTML={{
            __html: `
              tailwind.config = {
                theme: {
                  extend: {
                    colors: {
                      deepCanopy: '#0B1712',
                      midPine: '#12241C',
                      warmCream: '#EADBC8',
                      softOat: '#D8C4B6',
                      silkIvory: '#F4F0EA',
                      sandstoneGold: '#C5A880',
                      mutedForest: '#3D5A45',
                      lightMistSage: '#E8EFEA',
                      softEucalyptus: '#D8E3DB',
                      warmSage: '#E2EAE5',
                      birchCream: '#F8F6F0',
                      arboraCream: '#F4F0EA',
                      crispLinen: '#F1F5F2',
                      charcoalGreen: '#0D1C13',
                      mutedSage: '#A3B8AD'
                    },
                    fontFamily: {
                      heading: ['Anton', 'Bebas Neue', 'Impact', 'sans-serif'],
                      montserrat: ['Montserrat', 'sans-serif'],
                      sans: ['Arial', 'Inter', 'sans-serif']
                    }
                  }
                }
              }
            `,
          }}
        />
      </head>
      <body className="bg-[#0B1712] text-[#F1F5F2] antialiased selection:bg-[#EADBC8] selection:text-[#0B1712] m-0 p-0 overflow-x-hidden">
        <ArboraInitializer />
        {children}
      </body>
    </html>
  );
}
