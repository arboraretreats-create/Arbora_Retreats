import type { Metadata } from "next";
import "./globals.css";

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
      <body className="bg-[#0B1712] text-[#F1F5F2] antialiased selection:bg-[#EADBC8] selection:text-[#0B1712] m-0 p-0 overflow-x-hidden">
        {children}
      </body>
    </html>
  );
}
