# Convert all image assets to Base64
$logoPath = "C:\Users\DELL\Downloads\logo-transparent.png"
if (-not (Test-Path $logoPath)) {
  $logoPath = "public\logo-mark-transparent.png"
}
$logoB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes($logoPath));

$logoMarkPath = "C:\Users\DELL\Downloads\pure-arch-tree-mark.png"
if (-not (Test-Path $logoMarkPath)) {
  $logoMarkPath = "public\logo-mark-transparent.png"
}
$logoMarkB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes($logoMarkPath));

# Load Chukki Talkies Investor Logo Base64
$chukkiPath = "C:\Users\DELL\Downloads\Chukki Talkies.png"
if (-not (Test-Path $chukkiPath)) {
  $chukkiPath = "public\logo-mark-transparent.png"
}
$chukkiB64 = ""
if (Test-Path $chukkiPath) {
  $chukkiB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes($chukkiPath));
}

$adithyaMB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\DELL\Downloads\Aditya Manjunath.png"));
$sumanaB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\DELL\Downloads\Sumana Sarkar.png"));
$shashankB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\DELL\Downloads\Shashank.png"));
$harshaB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\DELL\Downloads\Mobile Devices\HarshaJanardhanaGiri.png"));

$kavyaPath = "C:\Users\DELL\Downloads\Kavya M.png"
if (-not (Test-Path $kavyaPath)) {
  $kavyaPath = "c:\Users\DELL\.gemini\antigravity\scratch\myaiartmaker\public\logo-mark-transparent.png"
}
$kavyaB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes($kavyaPath));

# Sura Stays Property Photos Base64 (ALL 6 PROPERTIES)
$verandaB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\DELL\Downloads\TribeAway\Varenda.png.jpeg"));
$lakeViewB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\DELL\Downloads\lake view .jpeg"));
$diningB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\DELL\Downloads\TribeAway\Dinning.png.jpeg"));
$campfireB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\DELL\Downloads\TribeAway\Camp Fire.png.jpeg"));
$privateRoomB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\DELL\Downloads\TribeAway\Private Room.png.jpeg"));
$dormB64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\DELL\Downloads\TribeAway\Dormitary Room.png.jpeg"));

# HERO BACKGROUND VIDEOS: OPTIMIZED FOR VERCEL HOSTING (STATIC FILES)
Write-Host "Configuring Hero Desktop and Mobile video URLs for Vercel deployment..."

# Chukki Talkies PROMINENT LOGO BOX snippet (Dark Inset Box #0B1712)
$chukkiLogoHtml = ""
if ($chukkiB64 -ne "") {
  $chukkiLogoHtml = "<div class='w-full h-44 rounded-2xl bg-[#0B1712] border border-white/15 p-4 mb-4 flex items-center justify-center shadow-inner overflow-hidden'><img src='data:image/png;base64,$chukkiB64' alt='Chukki Talkies Logo' class='w-full h-full object-contain brightness-110 filter drop-shadow-md' /></div>"
}

# -----------------------------------------------------------------------------
# 1. MAIN LANDING PAGE HTML (OPTIMIZED FOR VERCEL ISR LIMITS)
# -----------------------------------------------------------------------------
$mainHtmlContent = @"
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <title>Arbora | Where People Find Their People</title>
  
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Anton&family=Montserrat:wght@300;400;500;600;700;800&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  
  <script>
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
  </script>
  
  <style>
    * { -webkit-tap-highlight-color: transparent !important; }
    body { background-color: #0B1712; color: #F1F5F2; font-family: 'Arial', 'Inter', sans-serif; overflow-x: hidden; }
    .font-heading { font-family: 'Anton', 'Bebas Neue', 'Impact', sans-serif !important; }
    .glass-nav { background: rgba(11, 23, 18, 0.96); backdrop-filter: blur(12px); -webkit-backdrop-filter: blur(12px); border-bottom: 1px solid rgba(255, 255, 255, 0.08); }
    .glass-card-light { background: #F8F6F0; color: #0D1C13; border: 1px solid #C4D3C9; }
    
    .team-card-subtle {
      background-color: #F4F0EA !important;
      color: #111111 !important;
      border: 1px solid #C4D3C9 !important;
      border-radius: 1.75rem !important;
      box-shadow: 0 20px 40px rgba(0,0,0,0.4) !important;
      transition: transform 300ms ease, box-shadow 300ms ease;
    }
    .team-card-subtle:hover {
      transform: translateY(-4px);
      box-shadow: 0 25px 50px rgba(0,0,0,0.5) !important;
    }

    .team-card-compact {
      background-color: #F4F0EA !important;
      color: #111111 !important;
      border: 1px solid #C4D3C9 !important;
      border-radius: 1.5rem !important;
      box-shadow: 0 15px 30px rgba(0,0,0,0.35) !important;
      transition: transform 300ms ease, box-shadow 300ms ease;
    }
    .team-card-compact:hover {
      transform: translateY(-3px);
      box-shadow: 0 20px 40px rgba(0,0,0,0.45) !important;
    }

    .badge-overlay-dark {
      background-color: #1A3327 !important;
      color: #EADBC8 !important;
      border: 1px solid #C5A880 !important;
      padding: 5px 14px !important;
      border-radius: 9999px !important;
      font-size: 10px !important;
      font-weight: 800 !important;
      letter-spacing: 0.1em !important;
      text-transform: uppercase !important;
    }

    .badge-overlay-sm {
      background-color: #1A3327 !important;
      color: #EADBC8 !important;
      border: 1px solid #C5A880 !important;
      padding: 4px 11px !important;
      border-radius: 9999px !important;
      font-size: 9.5px !important;
      font-weight: 800 !important;
      letter-spacing: 0.1em !important;
      text-transform: uppercase !important;
    }

    .philosophy-box {
      background-color: #FFFFFF !important;
      border: 1px solid #E2EAE5 !important;
      border-radius: 0.85rem !important;
      padding: 12px 14px !important;
    }

    .philosophy-box-sm {
      background-color: #FFFFFF !important;
      border: 1px solid #E2EAE5 !important;
      border-radius: 0.75rem !important;
      padding: 10px 12px !important;
    }

    .investor-outer-card {
      background-color: #12241C !important;
      border: 1.5px solid rgba(234, 219, 200, 0.35) !important;
      border-radius: 1.75rem !important;
    }

    .btn-shine-clean {
      background-color: #EADBC8 !important;
      color: #0B1712 !important;
      border: 1px solid transparent;
      box-shadow: none !important;
      transition: background-color 100ms ease-out, color 100ms ease-out, transform 100ms ease-out !important;
      cursor: pointer;
      user-select: none;
      -webkit-user-select: none;
      display: inline-flex;
      align-items: center;
      justify-content: center;
    }
    .btn-shine-clean:hover, 
    .btn-shine-clean:focus, 
    .btn-shine-clean:active, 
    .btn-shine-clean.touch-active,
    .touch-active {
      background-color: #FFFFFF !important;
      color: #0B1712 !important;
      box-shadow: none !important;
      transform: scale(0.96) !important;
    }

    .badge-oat { background: rgba(216, 196, 182, 0.15); color: #D8C4B6; border: 1px solid rgba(216, 196, 182, 0.3); }
    .badge-gold { background: rgba(197, 168, 128, 0.15); color: #C5A880; border: 1px solid rgba(197, 168, 128, 0.3); }
    .no-scrollbar::-webkit-scrollbar { display: none; }
    .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
    
    .hero-fade-init { opacity: 0; transform: translateY(12px); transition: opacity 1200ms ease-out, transform 1200ms ease-out; }
    .hero-fade-active { opacity: 1; transform: translateY(0); }

    .reveal-on-scroll { opacity: 0; transform: translateY(20px); transition: opacity 600ms ease-out, transform 600ms ease-out; }
    .reveal-on-scroll.is-visible { opacity: 1; transform: translateY(0); }

    @media (max-width: 767px) {
      .desktop-only-grid { display: none !important; }
      .mobile-only-carousel { display: flex !important; }
    }
    @media (min-width: 768px) {
      .desktop-only-grid { display: grid !important; }
      .mobile-only-carousel { display: none !important; }
    }
  </style>
</head>
<body class="selection:bg-warmCream selection:text-deepCanopy">

  <!-- TOP SCROLL PROGRESS BAR -->
  <div id="scrollProgressBar" class="fixed top-0 left-0 h-[2.5px] bg-sandstoneGold z-[60] transition-all duration-150 ease-out" style="width: 0%;"></div>

  <!-- NAVIGATION HEADER -->
  <header id="mainHeader" class="fixed top-0 left-0 w-full z-50 glass-nav py-3 transition-all duration-500 hero-fade-init">
    <div class="max-w-[1400px] mx-auto px-4 md:px-8 flex justify-between items-center h-14 md:h-16">
      
      <!-- LOGO BRAND -->
      <a href="#" class="flex items-center gap-3 shrink-0 group my-auto">
        <img id="headerLogo" src="data:image/png;base64,$logoMarkB64" alt="Arbora Icon Mark" class="h-9 md:h-11 w-auto object-contain transition-all duration-300 group-hover:scale-105 my-auto self-center shrink-0" />
        
        <div class="flex flex-col justify-center items-start my-auto">
          <span id="headerBrandText" class="font-sans text-base md:text-lg font-medium tracking-[0.24em] pl-[0.24em] text-[#EADBC8] leading-none uppercase group-hover:text-white transition-colors">A R B O R A</span>
          <span class="font-sans text-[8px] md:text-[9px] font-normal tracking-[0.16em] pl-[0.16em] text-[#EADBC8]/80 leading-none uppercase mt-1 flex items-center gap-1 whitespace-nowrap">
            COMMUNITY &amp; EXPERIENCES
          </span>
        </div>
      </a>

      <!-- DESKTOP NAV LINKS -->
      <nav class="hidden lg:flex items-center gap-5 lg:gap-7 xl:gap-9 font-montserrat text-xs tracking-[0.15em] uppercase font-semibold my-auto whitespace-nowrap text-[#F1F5F2]">
        <a href="#philosophy" class="hover:text-warmCream transition-colors">Philosophy</a>
        <a href="#pillars" class="hover:text-warmCream transition-colors">The Arbora Way</a>
        <a href="#community" class="hover:text-warmCream transition-colors">Arborans</a>
        <a href="cohorts" class="text-sandstoneGold font-bold hover:text-white transition-colors">Gatherings &rarr;</a>
        <a href="#why-we-exist" class="hover:text-warmCream transition-colors">Why We Exist</a>
      </nav>

      <!-- CTA BUTTON -->
      <div class="flex items-center gap-3 my-auto shrink-0">
        <button onclick="openModal()" class="hidden sm:inline-flex btn-shine-clean font-montserrat text-xs tracking-widest uppercase font-bold px-5 py-2.5 rounded-full shrink-0 whitespace-nowrap">
          JOIN THE COMMUNITY &rarr;
        </button>
        
        <button onclick="toggleMobileMenu()" class="lg:hidden text-crispLinen p-2 bg-white/5 hover:bg-white/10 rounded-full border border-white/10 transition-colors focus:outline-none shrink-0" aria-label="Toggle Menu">
          <svg id="menuIconSvg" class="w-5 h-5 text-crispLinen" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
        </button>
      </div>
    </div>

    <div id="mobileDropdown" class="hidden lg:hidden bg-deepCanopy border-b border-white/15 px-6 py-6 flex flex-col gap-4 shadow-2xl">
      <nav class="flex flex-col gap-3 font-montserrat text-xs tracking-widest uppercase font-semibold">
        <a href="#philosophy" onclick="toggleMobileMenu()" class="text-crispLinen/90 hover:text-warmCream py-2 border-b border-white/5 flex justify-between"><span>Philosophy</span> <span>&rarr;</span></a>
        <a href="#pillars" onclick="toggleMobileMenu()" class="text-crispLinen/90 hover:text-warmCream py-2 border-b border-white/5 flex justify-between"><span>The Arbora Way</span> <span>&rarr;</span></a>
        <a href="#community" onclick="toggleMobileMenu()" class="text-crispLinen/90 hover:text-warmCream py-2 border-b border-white/5 flex justify-between"><span>Meet the Arborans</span> <span>&rarr;</span></a>
        <a href="#next-experience" onclick="toggleMobileMenu()" class="text-crispLinen/90 hover:text-warmCream py-2 border-b border-white/5 flex justify-between"><span>Next Gathering</span> <span>&rarr;</span></a>
        <a href="#after-arbora" onclick="toggleMobileMenu()" class="text-crispLinen/90 hover:text-warmCream py-2 border-b border-white/5 flex justify-between"><span>After Arbora</span> <span>&rarr;</span></a>
        <a href="cohorts" class="text-sandstoneGold py-2 border-b border-white/5 flex justify-between"><span>30-Experience Directory</span> <span>&rarr;</span></a>
        <a href="#why-we-exist" onclick="toggleMobileMenu()" class="text-crispLinen/90 hover:text-warmCream py-2 border-b border-white/5 flex justify-between"><span>Why Arbora Exists</span> <span>&rarr;</span></a>
      </nav>
      <button onclick="toggleMobileMenu(); openModal();" class="w-full btn-shine-clean font-montserrat text-xs tracking-widest uppercase font-bold py-3.5 rounded-full text-center mt-2">
        JOIN THE COMMUNITY &rarr;
      </button>
    </div>
  </header>

  <!-- 01 — HERO (STREAMED VIDEO FILES - ZERO BUNDLE OVERHEAD) -->
  <section id="heroSection" class="relative min-h-[88vh] flex items-center justify-center pt-32 pb-24 px-6 overflow-hidden bg-deepCanopy">
    <div class="absolute inset-0 z-0 w-full h-full overflow-hidden">
      <video id="heroVideoDesktop" autoplay muted loop playsinline class="hidden md:block w-full h-full object-cover scale-105">
        <source src="/videos/hero-desktop.mp4" type="video/mp4" />
      </video>
      <video id="heroVideoMobile" autoplay muted loop playsinline class="block md:hidden w-full h-full object-cover scale-105">
        <source src="/videos/hero-mobile.mp4" type="video/mp4" />
      </video>
      <div class="absolute inset-0 bg-gradient-to-b from-black/60 via-black/25 to-transparent opacity-60"></div>
    </div>
    <div class="absolute inset-0 pointer-events-none z-10" style="background: radial-gradient(circle at 50% 25%, rgba(234, 219, 200, 0.15) 0%, transparent 65%);"></div>
    <div class="absolute bottom-0 left-0 w-full h-10 md:h-12 z-10 pointer-events-none bg-gradient-to-b from-transparent to-[#0B1712] opacity-75"></div>

    <div id="heroContent" class="relative z-20 max-w-5xl mx-auto text-center flex flex-col items-center hero-fade-init">
      <div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full badge-oat mb-6 font-montserrat text-xs font-semibold tracking-widest uppercase bg-[#0b1712]/80 backdrop-blur-md">
        <span>PEOPLE &bull; MUSIC &bull; NATURE &bull; COMMUNITY</span>
      </div>

      <h1 class="font-heading text-5xl md:text-7xl lg:text-8xl font-normal text-white uppercase tracking-wide leading-none mb-6">
        WHERE PEOPLE FIND THEIR PEOPLE.
      </h1>

      <p class="font-sans text-base md:text-xl text-[#e2eae5] max-w-3xl leading-relaxed mb-10 font-medium">
        Arbora creates intentional spaces for people to slow down, meet openly, make things, and return home with people who feel familiar.
      </p>

      <div class="flex flex-col sm:flex-row items-center justify-center gap-4 w-full sm:w-auto">
        <button onclick="openModal()" class="w-full sm:w-auto btn-shine-clean font-montserrat px-9 py-4 rounded-full font-bold text-xs tracking-widest uppercase">JOIN THE COMMUNITY &rarr;</button>
        <a href="#experiences" class="w-full sm:w-auto font-montserrat text-xs font-bold tracking-widest uppercase px-8 py-4 rounded-full bg-white/10 hover:bg-white/20 text-white border border-white/20 transition-all text-center">Explore Gatherings &darr;</a>
      </div>
    </div>
  </section>

  <!-- 02 — PHILOSOPHY -->
  <section id="philosophy" class="relative py-24 px-6 bg-gradient-to-b from-[#0B1712] via-deepCanopy to-[#12241C]">
    <div class="max-w-7xl mx-auto">
      <div class="text-center max-w-3xl mx-auto mb-12 reveal-on-scroll">
        <span class="badge-oat font-montserrat text-xs uppercase tracking-widest font-semibold px-4 py-1.5 rounded-full">The Arbora Manifesto</span>
        <h2 class="font-heading text-4xl md:text-5xl uppercase tracking-wider text-crispLinen mt-4 mb-6">INTENTIONAL SPACES &bull; FAMILIAR FACES</h2>
        <p class="font-sans text-crispLinen text-lg md:text-xl leading-relaxed max-w-3xl mx-auto font-medium">
          Arbora creates intentional spaces for people to slow down, meet openly, make things, and return home with people who feel familiar.
        </p>
      </div>

      <!-- COMMUNITY MATCHER -->
      <div class="my-12 p-8 md:p-10 rounded-3xl bg-[#12241C] border-2 border-warmCream/40 flex flex-col md:flex-row items-center justify-between gap-6 reveal-on-scroll">
        <div>
          <span class="badge-gold font-montserrat text-xs uppercase font-bold px-3.5 py-1 rounded-full inline-block mb-2">&star; Community Matcher</span>
          <h3 class="font-montserrat text-2xl md:text-3xl font-bold text-crispLinen mb-2">What are you looking to find in Arbora?</h3>
          <p class="font-sans text-xs md:text-sm text-mutedSage">Take our 10-second micro-quiz to find your circle in upcoming gatherings.</p>
        </div>
        <button onclick="startQuiz()" class="w-full md:w-auto shrink-0 btn-shine-clean font-montserrat px-8 py-4 rounded-full font-bold text-xs uppercase tracking-widest">Find My Circle &rarr;</button>
      </div>

      <div class="glass-card-light rounded-3xl p-10 md:p-14 text-center reveal-on-scroll">
        <blockquote class="font-montserrat text-xl md:text-3xl font-bold italic text-charcoalGreen leading-relaxed mb-6">
          &quot;People rarely remember a hotel room. They remember the conversations around the campfire, the laughter during a trek, and the strangers who became friends.&quot;
        </blockquote>
        <span class="font-montserrat text-xs uppercase tracking-widest text-sandstoneGold font-bold">&bull; The Belief Behind Arbora &bull;</span>
      </div>
    </div>
  </section>

  <!-- 03 — COMMUNITY -->
  <section id="community" class="py-24 px-6 bg-[#0B1712] text-crispLinen border-t border-white/10">
    <div class="max-w-7xl mx-auto">
      <div class="text-center max-w-3xl mx-auto mb-16 reveal-on-scroll">
        <span class="badge-gold font-montserrat text-xs uppercase tracking-widest font-bold px-4 py-1.5 rounded-full">REAL ATTENDEES &bull; REAL STORIES</span>
        <h2 class="font-heading text-4xl md:text-5xl uppercase tracking-wider text-crispLinen mt-4 mb-4">MEET THE ARBORANS</h2>
        <p class="font-sans text-mutedSage text-base">Who belongs to Arbora? Real people — creators, dreamers, music lovers, solo travelers, and friend circles who come for the getaway and stay for the community.</p>
      </div>

      <!-- Community Grid -->
      <div class="desktop-only-grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
        <div class="p-7 rounded-3xl bg-[#12241C] border border-white/15 flex flex-col justify-between hover:border-warmCream transition-all">
          <div>
            <span class="font-montserrat text-xs font-bold text-sandstoneGold uppercase tracking-widest block mb-2">ARBORAN #01 &bull; BENGALURU</span>
            <blockquote class="font-montserrat text-lg font-bold text-crispLinen italic mb-4">&quot;I wanted to get out of the city and meet open-minded people.&quot;</blockquote>
            <p class="font-sans text-xs text-mutedSage">Ananya K. &bull; Product Designer</p>
          </div>
        </div>

        <div class="p-7 rounded-3xl bg-[#12241C] border border-white/15 flex flex-col justify-between hover:border-warmCream transition-all">
          <div>
            <span class="font-montserrat text-xs font-bold text-sandstoneGold uppercase tracking-widest block mb-2">ARBORAN #02 &bull; MUSIC CIRCLE</span>
            <blockquote class="font-montserrat text-lg font-bold text-crispLinen italic mb-4">&quot;The acoustic campfires under the stars were unlike anything I'd experienced.&quot;</blockquote>
            <p class="font-sans text-xs text-mutedSage">Rohan M. &bull; Acoustic Guitarist</p>
          </div>
        </div>

        <div class="p-7 rounded-3xl bg-[#12241C] border border-white/15 flex flex-col justify-between hover:border-warmCream transition-all">
          <div>
            <span class="font-montserrat text-xs font-bold text-sandstoneGold uppercase tracking-widest block mb-2">ARBORAN #03 &bull; SOLO ATTENDEE</span>
            <blockquote class="font-montserrat text-lg font-bold text-crispLinen italic mb-4">&quot;My friends cancelled last minute. I came solo and left with 12 familiar faces.&quot;</blockquote>
            <p class="font-sans text-xs text-mutedSage">Priya S. &bull; Brand Strategist</p>
          </div>
        </div>
      </div>

      <!-- Mobile Touch Carousel -->
      <div class="mobile-only-carousel flex-col">
        <div class="flex overflow-x-auto snap-x snap-mandatory gap-5 pb-6 -mx-6 px-6 no-scrollbar" onscroll="updateSectionDots(this, 'arbDots', 3)">
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-montserrat text-xs font-bold text-sandstoneGold uppercase tracking-widest block mb-2">ARBORAN #01</span>
            <blockquote class="font-montserrat text-base font-bold text-crispLinen italic mb-3">&quot;I wanted to get out of the city and meet open-minded people.&quot;</blockquote>
            <p class="font-sans text-xs text-mutedSage">Ananya K. &bull; Bengaluru</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-montserrat text-xs font-bold text-sandstoneGold uppercase tracking-widest block mb-2">ARBORAN #02</span>
            <blockquote class="font-montserrat text-base font-bold text-crispLinen italic mb-3">&quot;The acoustic campfires were unlike anything else.&quot;</blockquote>
            <p class="font-sans text-xs text-mutedSage">Rohan M. &bull; Musician</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-montserrat text-xs font-bold text-sandstoneGold uppercase tracking-widest block mb-2">ARBORAN #03</span>
            <blockquote class="font-montserrat text-base font-bold text-crispLinen italic mb-3">&quot;I came solo and left with 12 familiar faces.&quot;</blockquote>
            <p class="font-sans text-xs text-mutedSage">Priya S. &bull; Strategist</p>
          </div>
        </div>

        <div class="flex items-center justify-center mt-3">
          <div id="arbDots" class="flex items-center gap-1.5">
            <span class="h-2 w-7 bg-sandstoneGold rounded-full"></span>
            <span class="h-2 w-2 bg-white/20 rounded-full"></span>
            <span class="h-2 w-2 bg-white/20 rounded-full"></span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 04 — THE ARBORA WAY -->
  <section id="pillars" class="py-24 px-6 bg-[#0B1712] text-[#F1F5F2]">
    <div class="max-w-7xl mx-auto">
      <div class="text-center max-w-3xl mx-auto mb-16 reveal-on-scroll">
        <span class="badge-oat font-montserrat text-xs uppercase tracking-widest font-semibold px-4 py-1.5 rounded-full">Culture &amp; Beliefs</span>
        <h2 class="font-heading text-4xl md:text-5xl uppercase tracking-wider text-crispLinen mt-4 mb-4">THE ARBORA WAY</h2>
        <p class="font-sans text-mutedSage text-base">These aren't package features or logistics line items. They are the 7 core beliefs that define every Arbora experience.</p>
      </div>

      <!-- Desktop Grid -->
      <div class="desktop-only-grid grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
        <div class="p-7 rounded-3xl bg-[#12241C] border border-white/10 hover:border-warmCream transition-all">
          <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 01 &bull; NATURE</span>
          <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Wild &amp; Sacred Spaces</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">Deep grounding in nature where misty forest hills replace city noise.</p>
        </div>
        <div class="p-7 rounded-3xl bg-[#12241C] border border-white/10 hover:border-warmCream transition-all">
          <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 02 &bull; PEOPLE</span>
          <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Human Presence First</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">People don't come for the resort — they come for who they share it with.</p>
        </div>
        <div class="p-7 rounded-3xl bg-[#12241C] border border-white/10 hover:border-warmCream transition-all">
          <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 03 &bull; MUSIC</span>
          <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Soulful Acoustic Vibes</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">Fireside acoustic jams, unplugged singing, and starlit evening rituals.</p>
        </div>
        <div class="p-7 rounded-3xl bg-[#12241C] border border-white/10 hover:border-warmCream transition-all">
          <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 04 &bull; ADVENTURE</span>
          <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Unscripted Exploration</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">Off-road trails, peak treks, and stream dips that spark childlike curiosity.</p>
        </div>
        <div class="p-7 rounded-3xl bg-[#12241C] border border-white/10 hover:border-warmCream transition-all">
          <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 05 &bull; CREATIVITY</span>
          <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Co-Creation &amp; Memory</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">Photojournalism, storytelling, and creative moments shared with kindred souls.</p>
        </div>
        <div class="p-7 rounded-3xl bg-[#12241C] border border-white/10 hover:border-warmCream transition-all">
          <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 06 &bull; CONVERSATION</span>
          <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Long-Table Gatherings</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">Communal feasts and midnight reflection circles where real conversations happen.</p>
        </div>
        <div class="p-7 rounded-3xl bg-[#12241C] border border-white/10 hover:border-warmCream transition-all">
          <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 07 &bull; BELONGING</span>
          <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Strangers to Belonging</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">Creating an inclusive space where everyone moves from strangers to familiar faces.</p>
        </div>
      </div>

      <!-- Mobile Touch Scroll Carousel -->
      <div class="mobile-only-carousel flex-col">
        <div class="flex overflow-x-auto snap-x snap-mandatory gap-5 pb-6 -mx-6 px-6 no-scrollbar" onscroll="updateSectionDots(this, 'pillarsDots', 7)">
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 01 &bull; NATURE</span>
            <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Wild &amp; Sacred Spaces</h3>
            <p class="font-sans text-xs text-mutedSage leading-relaxed">Deep grounding in nature where forest hills replace city noise.</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 02 &bull; PEOPLE</span>
            <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Human Presence First</h3>
            <p class="font-sans text-xs text-mutedSage leading-relaxed">People don't come for the resort — they come for the people.</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 03 &bull; MUSIC</span>
            <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Soulful Acoustic Vibes</h3>
            <p class="font-sans text-xs text-mutedSage leading-relaxed">Fireside acoustic jams, unplugged singing, and starlit rituals.</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 04 &bull; ADVENTURE</span>
            <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Unscripted Exploration</h3>
            <p class="font-sans text-xs text-mutedSage leading-relaxed">Off-road trails, peak treks, and stream dips.</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 05 &bull; CREATIVITY</span>
            <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Co-Creation &amp; Memory</h3>
            <p class="font-sans text-xs text-mutedSage leading-relaxed">Photojournalism and creative moments shared together.</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 06 &bull; CONVERSATION</span>
            <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Long-Table Gatherings</h3>
            <p class="font-sans text-xs text-[#A3B8AD] leading-relaxed">Communal feasts and midnight reflection circles.</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-heading text-xs uppercase tracking-widest text-sandstoneGold block mb-1">BELIEF 07 &bull; BELONGING</span>
            <h3 class="font-montserrat text-xl font-bold text-crispLinen mb-2">Strangers to Belonging</h3>
            <p class="font-sans text-xs text-mutedSage leading-relaxed">Moving from strangers to familiar faces.</p>
          </div>
        </div>

        <div class="flex items-center justify-center mt-3">
          <div id="pillarsDots" class="flex items-center gap-1.5">
            <span class="h-2 w-7 bg-sandstoneGold rounded-full"></span>
            <span class="h-2 w-2 bg-white/20 rounded-full"></span>
            <span class="h-2 w-2 bg-white/20 rounded-full"></span>
            <span class="h-2 w-2 bg-white/20 rounded-full"></span>
            <span class="h-2 w-2 bg-white/20 rounded-full"></span>
            <span class="h-2 w-2 bg-white/20 rounded-full"></span>
            <span class="h-2 w-2 bg-white/20 rounded-full"></span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 05 — THE NEXT ARBORA & THIS TIME WE GATHER AT -->
  <section id="next-experience" class="py-24 px-6 bg-[#E8EFEA] text-[#0A1F14]">
    <div class="max-w-7xl mx-auto">
      <div class="text-center max-w-3xl mx-auto mb-16 reveal-on-scroll">
        <span class="bg-[#D8C4B6]/25 text-[#0A1F14] border border-[#D8C4B6] font-montserrat text-xs uppercase tracking-widest font-semibold px-4 py-1.5 rounded-full">Community Escape &bull; Mudigere</span>
        <h2 class="font-heading text-4xl md:text-5xl uppercase tracking-wider text-[#0A1F14] mt-4 mb-3">THE NEXT ARBORA</h2>
        <p class="font-montserrat text-xl md:text-2xl italic text-[#3D5A45] mb-4 fall-text">&quot;Short, intentional gatherings in nature.&quot;</p>
        <p class="font-sans text-[#2C3E33] text-base max-w-2xl mx-auto leading-relaxed font-medium mb-8">Our upcoming escape gathers 30 Arborans for an unscripted weekend of acoustic campfires, stream treks, and long-table Malnad dining.</p>

        <div class="p-6 rounded-2xl bg-white border border-[#D1DDD5] max-w-xl mx-auto text-left shadow-lg">
          <span class="font-heading text-xs uppercase tracking-widest text-[#3D5A45] block mb-1">THIS TIME, WE GATHER AT</span>
          <h3 class="font-montserrat text-2xl font-bold text-[#0A1F14] mb-2">Sura Stays, Mudigere</h3>
          <p class="font-sans text-xs text-[#2C3E33] leading-relaxed">A coffee-estate sanctuary that serves as our setting. Sura Stays is the backdrop — the people, music, and shared moments are the experience.</p>
        </div>
      </div>

      <!-- Desktop Grid -->
      <div class="desktop-only-grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-16">
        <div class="rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden hover:border-sandstoneGold transition-all flex flex-col justify-between group">
          <div class="relative h-60 w-full bg-[#D8E3DB] overflow-hidden">
            <img src="data:image/jpeg;base64,$verandaB64" alt="The Estate Veranda" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
            <span class="absolute top-3 right-3 bg-[#12241C] text-warmCream font-montserrat text-[10px] uppercase font-bold tracking-widest px-3 py-1 rounded-full">Setting</span>
          </div>
          <div class="p-6 flex-1 flex flex-col justify-between">
            <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-1">The Estate Veranda</h3>
            <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">A sun-dappled balcony overlooking coffee plantations for morning conversations.</p>
            <button onclick="openDestinationModal('The Estate Veranda', 'SETTING', '$verandaB64', 'A sun-dappled balcony overlooking coffee plantations.')" class="font-montserrat text-xs font-bold text-[#12241C] hover:text-[#C5A880] uppercase">See the setting &rarr;</button>
          </div>
        </div>

        <div class="rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden hover:border-sandstoneGold transition-all flex flex-col justify-between group">
          <div class="relative h-60 w-full bg-[#D8E3DB] overflow-hidden">
            <img src="data:image/jpeg;base64,$lakeViewB64" alt="Serene Estate Lakeside View" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
            <span class="absolute top-3 right-3 bg-[#12241C] text-warmCream font-montserrat text-[10px] uppercase font-bold tracking-widest px-3 py-1 rounded-full">Setting</span>
          </div>
          <div class="p-6 flex-1 flex flex-col justify-between">
            <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-1">Lakeside Reflection Zone</h3>
            <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Tranquil waterside spot for acoustic music circles and reflection.</p>
            <button onclick="openDestinationModal('Lakeside Reflection Zone', 'SETTING', '$lakeViewB64', 'A tranquil lakeside spot surrounded by foliage.')" class="font-montserrat text-xs font-bold text-[#12241C] hover:text-[#C5A880] uppercase">See the setting &rarr;</button>
          </div>
        </div>

        <div class="rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden hover:border-sandstoneGold transition-all flex flex-col justify-between group">
          <div class="relative h-60 w-full bg-[#D8E3DB] overflow-hidden">
            <img src="data:image/jpeg;base64,$diningB64" alt="Communal Estate Dining" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
            <span class="absolute top-3 right-3 bg-[#12241C] text-warmCream font-montserrat text-[10px] uppercase font-bold tracking-widest px-3 py-1 rounded-full">Setting</span>
          </div>
          <div class="p-6 flex-1 flex flex-col justify-between">
            <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-1">Long-Table Courtyard</h3>
            <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Open courtyard where Arborans share authentic regional meals together.</p>
            <button onclick="openDestinationModal('Long-Table Courtyard', 'SETTING', '$diningB64', 'Warm open courtyard for long-table meals.')" class="font-montserrat text-xs font-bold text-[#12241C] hover:text-[#C5A880] uppercase">See the setting &rarr;</button>
          </div>
        </div>

        <div class="rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden hover:border-sandstoneGold transition-all flex flex-col justify-between group">
          <div class="relative h-60 w-full bg-[#D8E3DB] overflow-hidden">
            <img src="data:image/jpeg;base64,$campfireB64" alt="Starlit Campfire Grounds" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
            <span class="absolute top-3 right-3 bg-[#12241C] text-warmCream font-montserrat text-[10px] uppercase font-bold tracking-widest px-3 py-1 rounded-full">Setting</span>
          </div>
          <div class="p-6 flex-1 flex flex-col justify-between">
            <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-1">Starlit Campfire Circle</h3>
            <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Fireside grounds for acoustic singalongs and late-night storytelling.</p>
            <button onclick="openDestinationModal('Starlit Campfire Circle', 'SETTING', '$campfireB64', 'Fireside grounds under starlit skies.')" class="font-montserrat text-xs font-bold text-[#12241C] hover:text-[#C5A880] uppercase">See the setting &rarr;</button>
          </div>
        </div>

        <div class="rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden hover:border-sandstoneGold transition-all flex flex-col justify-between group">
          <div class="relative h-60 w-full bg-[#D8E3DB] overflow-hidden">
            <img src="data:image/jpeg;base64,$privateRoomB64" alt="Cozy Private Rooms" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
            <span class="absolute top-3 right-3 bg-[#12241C] text-warmCream font-montserrat text-[10px] uppercase font-bold tracking-widest px-3 py-1 rounded-full">Setting</span>
          </div>
          <div class="p-6 flex-1 flex flex-col justify-between">
            <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-1">Rest Spaces</h3>
            <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Comfortable spaces designed for peaceful rest after full days outdoors.</p>
            <button onclick="openDestinationModal('Rest Spaces', 'SETTING', '$privateRoomB64', 'Comfortable spaces designed for peaceful rest.')" class="font-montserrat text-xs font-bold text-[#12241C] hover:text-[#C5A880] uppercase">See the setting &rarr;</button>
          </div>
        </div>

        <div class="rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden hover:border-sandstoneGold transition-all flex flex-col justify-between group">
          <div class="relative h-60 w-full bg-[#D8E3DB] overflow-hidden">
            <img src="data:image/jpeg;base64,$dormB64" alt="Retreat Community Dorms" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
            <span class="absolute top-3 right-3 bg-[#12241C] text-warmCream font-montserrat text-[10px] uppercase font-bold tracking-widest px-3 py-1 rounded-full">Setting</span>
          </div>
          <div class="p-6 flex-1 flex flex-col justify-between">
            <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-1">Dorm Quarters</h3>
            <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Dormitories for friends and solo travelers to connect.</p>
            <button onclick="openDestinationModal('Dorm Quarters', 'SETTING', '$dormB64', 'Dormitories for friends and solo travelers.')" class="font-montserrat text-xs font-bold text-[#12241C] hover:text-[#C5A880] uppercase">See the setting &rarr;</button>
          </div>
        </div>
      </div>

      <!-- Mobile Touch Carousel -->
      <div class="mobile-only-carousel flex-col">
        <div class="flex overflow-x-auto snap-x snap-mandatory gap-5 pb-6 -mx-6 px-6 no-scrollbar" onscroll="updateSectionDots(this, 'destDots', 6)">
          <div class="snap-center shrink-0 w-[85vw] max-w-[320px] rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden flex flex-col">
            <div class="relative h-56 w-full bg-[#D8E3DB]">
              <img src="data:image/jpeg;base64,$verandaB64" alt="The Estate Veranda" class="w-full h-full object-cover" />
            </div>
            <div class="p-5 flex-1 flex flex-col justify-between">
              <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-2">The Estate Veranda</h3>
              <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Balcony overlooking coffee plantations.</p>
              <button onclick="openDestinationModal('The Estate Veranda', 'SETTING', '$verandaB64', 'Balcony overlooking coffee plantations.')" class="w-full btn-shine-clean font-montserrat py-3 rounded-xl text-xs uppercase font-bold tracking-widest">See the setting &rarr;</button>
            </div>
          </div>

          <div class="snap-center shrink-0 w-[85vw] max-w-[320px] rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden flex flex-col">
            <div class="relative h-56 w-full bg-[#D8E3DB]">
              <img src="data:image/jpeg;base64,$lakeViewB64" alt="Lakeside Reflection Zone" class="w-full h-full object-cover" />
            </div>
            <div class="p-5 flex-1 flex flex-col justify-between">
              <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-2">Lakeside Reflection Zone</h3>
              <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Tranquil waterside spot.</p>
              <button onclick="openDestinationModal('Lakeside Reflection Zone', 'SETTING', '$lakeViewB64', 'Tranquil waterside spot.')" class="w-full btn-shine-clean font-montserrat py-3 rounded-xl text-xs uppercase font-bold tracking-widest">See the setting &rarr;</button>
            </div>
          </div>

          <div class="snap-center shrink-0 w-[85vw] max-w-[320px] rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden flex flex-col">
            <div class="relative h-56 w-full bg-[#D8E3DB]">
              <img src="data:image/jpeg;base64,$diningB64" alt="Long-Table Courtyard" class="w-full h-full object-cover" />
            </div>
            <div class="p-5 flex-1 flex flex-col justify-between">
              <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-2">Long-Table Courtyard</h3>
              <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Open courtyard for long-table meals.</p>
              <button onclick="openDestinationModal('Long-Table Courtyard', 'SETTING', '$diningB64', 'Open courtyard for long-table meals.')" class="w-full btn-shine-clean font-montserrat py-3 rounded-xl text-xs uppercase font-bold tracking-widest">See the setting &rarr;</button>
            </div>
          </div>

          <div class="snap-center shrink-0 w-[85vw] max-w-[320px] rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden flex flex-col">
            <div class="relative h-56 w-full bg-[#D8E3DB]">
              <img src="data:image/jpeg;base64,$campfireB64" alt="Starlit Campfire Circle" class="w-full h-full object-cover" />
            </div>
            <div class="p-5 flex-1 flex flex-col justify-between">
              <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-2">Starlit Campfire Circle</h3>
              <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Fireside grounds for acoustic singalongs.</p>
              <button onclick="openDestinationModal('Starlit Campfire Circle', 'SETTING', '$campfireB64', 'Fireside grounds under starlit skies.')" class="w-full btn-shine-clean font-montserrat py-3 rounded-xl text-xs uppercase font-bold tracking-widest">See the setting &rarr;</button>
            </div>
          </div>

          <div class="snap-center shrink-0 w-[85vw] max-w-[320px] rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden flex flex-col">
            <div class="relative h-56 w-full bg-[#D8E3DB]">
              <img src="data:image/jpeg;base64,$privateRoomB64" alt="Rest Spaces" class="w-full h-full object-cover" />
            </div>
            <div class="p-5 flex-1 flex flex-col justify-between">
              <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-2">Rest Spaces</h3>
              <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Comfortable spaces for peaceful rest.</p>
              <button onclick="openDestinationModal('Rest Spaces', 'SETTING', '$privateRoomB64', 'Comfortable spaces for peaceful rest.')" class="w-full btn-shine-clean font-montserrat py-3 rounded-xl text-xs uppercase font-bold tracking-widest">See the setting &rarr;</button>
            </div>
          </div>

          <div class="snap-center shrink-0 w-[85vw] max-w-[320px] rounded-3xl bg-white border border-[#D1DDD5] overflow-hidden flex flex-col">
            <div class="relative h-56 w-full bg-[#D8E3DB]">
              <img src="data:image/jpeg;base64,$dormB64" alt="Dorm Quarters" class="w-full h-full object-cover" />
            </div>
            <div class="p-5 flex-1 flex flex-col justify-between">
              <h3 class="font-montserrat text-xl font-bold text-[#0A1F14] mb-2">Dorm Quarters</h3>
              <p class="font-sans text-xs text-[#2C3E33] leading-relaxed mb-4">Dormitories for friends &amp; solo travelers.</p>
              <button onclick="openDestinationModal('Dorm Quarters', 'SETTING', '$dormB64', 'Dormitories for friends & solo travelers.')" class="w-full btn-shine-clean font-montserrat py-3 rounded-xl text-xs uppercase font-bold tracking-widest">See the setting &rarr;</button>
            </div>
          </div>
        </div>

        <div class="flex items-center justify-center mt-3">
          <div id="destDots" class="flex items-center gap-1.5">
            <span class="h-2 w-7 bg-[#12241C] rounded-full"></span>
            <span class="h-2 w-2 bg-[#D1DDD5] rounded-full"></span>
            <span class="h-2 w-2 bg-[#D1DDD5] rounded-full"></span>
            <span class="h-2 w-2 bg-[#D1DDD5] rounded-full"></span>
            <span class="h-2 w-2 bg-[#D1DDD5] rounded-full"></span>
            <span class="h-2 w-2 bg-[#D1DDD5] rounded-full"></span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 06 — EVERY ARBORA EXPERIENCE HAS -->
  <section id="inclusions" class="py-24 px-6 bg-[#D8E3DB] text-[#0A2116]">
    <div class="max-w-7xl mx-auto text-center">
      <span class="badge-oat font-montserrat text-xs uppercase tracking-widest font-semibold px-4 py-1.5 rounded-full inline-block mb-3 bg-white/60">Logistics Follow Culture</span>
      <h2 class="font-heading text-4xl md:text-5xl uppercase tracking-wider mb-12 text-[#0A2116]">EVERY ARBORA EXPERIENCE HAS</h2>

      <!-- Desktop Grid -->
      <div class="desktop-only-grid grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="p-6 rounded-3xl bg-white border border-[#C4D3C8] flex flex-col justify-between text-left">
          <h3 class="font-montserrat text-xl font-bold mb-2 text-[#0A2116]">People &amp; Community</h3>
          <p class="font-sans text-xs text-[#2C3E33]">Facilitated icebreakers, curated group dynamics, and lifelong connections built over 48 hours.</p>
        </div>
        <div class="p-6 rounded-3xl bg-white border border-[#C4D3C8] flex flex-col justify-between text-left">
          <h3 class="font-montserrat text-xl font-bold mb-2 text-[#0A2116]">Music &amp; Stories</h3>
          <p class="font-sans text-xs text-[#2C3E33]">Acoustic campfire circles, starlit jam sessions, and unscripted evening rituals.</p>
        </div>
        <div class="p-6 rounded-3xl bg-white border border-[#C4D3C8] flex flex-col justify-between text-left">
          <h3 class="font-montserrat text-xl font-bold mb-2 text-[#0A2116]">Nature &amp; Adventure</h3>
          <p class="font-sans text-xs text-[#2C3E33]">Guided coffee estate treks, stream dip walks, and wilderness exploration.</p>
        </div>
        <div class="p-6 rounded-3xl bg-white border border-[#C4D3C8] flex flex-col justify-between text-left">
          <h3 class="font-montserrat text-xl font-bold mb-2 text-[#0A2116]">Communal Dining</h3>
          <p class="font-sans text-xs text-[#2C3E33]">Authentic farm-to-table regional Malnad feasts shared across long open tables.</p>
        </div>
      </div>

      <!-- Mobile Touch Carousel -->
      <div class="mobile-only-carousel flex-col text-left">
        <div class="flex overflow-x-auto snap-x snap-mandatory gap-5 pb-6 -mx-6 px-6 no-scrollbar" onscroll="updateSectionDots(this, 'incDots', 4)">
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-white border border-[#C4D3C8]">
            <h3 class="font-montserrat text-xl font-bold text-[#0A2116] mb-2">People &amp; Community</h3>
            <p class="font-sans text-xs text-[#2C3E33] leading-relaxed">Facilitated icebreakers and lifelong connections built over 48 hours.</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-white border border-[#C4D3C8]">
            <h3 class="font-montserrat text-xl font-bold text-[#0A2116] mb-2">Music &amp; Stories</h3>
            <p class="font-sans text-xs text-[#2C3E33] leading-relaxed">Acoustic campfire circles, starlit jam sessions, and unscripted rituals.</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-white border border-[#C4D3C8]">
            <h3 class="font-montserrat text-xl font-bold text-[#0A2116] mb-2">Nature &amp; Adventure</h3>
            <p class="font-sans text-xs text-[#2C3E33] leading-relaxed">Guided coffee estate treks, stream dip walks, and wilderness exploration.</p>
          </div>
          <div class="snap-center shrink-0 w-[82vw] max-w-[300px] p-6 rounded-3xl bg-white border border-[#C4D3C8]">
            <h3 class="font-montserrat text-xl font-bold text-[#0A2116] mb-2">Communal Dining</h3>
            <p class="font-sans text-xs text-[#2C3E33] leading-relaxed">Authentic farm-to-table regional Malnad feasts shared across long tables.</p>
          </div>
        </div>

        <div class="flex items-center justify-center mt-3">
          <div id="incDots" class="flex items-center gap-1.5">
            <span class="h-2 w-7 bg-[#0A2116] rounded-full"></span>
            <span class="h-2 w-2 bg-[#C4D3C8] rounded-full"></span>
            <span class="h-2 w-2 bg-[#C4D3C8] rounded-full"></span>
            <span class="h-2 w-2 bg-[#C4D3C8] rounded-full"></span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 07 — FIND YOUR WAY INTO ARBORA -->
  <section id="experiences" class="py-20 px-6 bg-[#0B1712] text-crispLinen border-t border-b border-white/10">
    <div class="max-w-6xl mx-auto text-center">
      <span class="badge-oat font-montserrat text-xs uppercase tracking-widest font-semibold px-4 py-1.5 rounded-full inline-block mb-4">Community Formats</span>
      <h2 class="font-heading text-4xl md:text-6xl uppercase tracking-wider text-crispLinen mb-4">FIND YOUR WAY INTO ARBORA</h2>
      <p class="font-sans text-base text-mutedSage max-w-2xl mx-auto leading-relaxed mb-12">
        Explore recurring community formats designed for how we gather.
      </p>

      <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-5 gap-4 mb-10 text-left">
        <div class="p-6 rounded-2xl bg-[#12241C] border border-white/15 hover:border-sandstoneGold transition-all">
          <span class="font-heading text-xl text-sandstoneGold block mb-1">01 &bull; ESCAPES</span>
          <h3 class="font-montserrat text-base font-bold text-crispLinen mb-2">Community Escapes</h3>
          <p class="font-sans text-xs text-mutedSage">Short, intentional gatherings in nature with curated group dynamics.</p>
        </div>
        <div class="p-6 rounded-2xl bg-[#12241C] border border-white/15 hover:border-sandstoneGold transition-all">
          <span class="font-heading text-xl text-sandstoneGold block mb-1">02 &bull; SESSIONS</span>
          <h3 class="font-montserrat text-base font-bold text-crispLinen mb-2">Music &amp; Acoustic</h3>
          <p class="font-sans text-xs text-mutedSage">Intimate fireside acoustic jam sessions and artist circles.</p>
        </div>
        <div class="p-6 rounded-2xl bg-[#12241C] border border-white/15 hover:border-sandstoneGold transition-all">
          <span class="font-heading text-xl text-sandstoneGold block mb-1">03 &bull; TRAILS</span>
          <h3 class="font-montserrat text-base font-bold text-crispLinen mb-2">Wilderness Treks</h3>
          <p class="font-sans text-xs text-mutedSage">Peak treks, off-road exploration, and stream dip adventures.</p>
        </div>
        <div class="p-6 rounded-2xl bg-[#12241C] border border-white/15 hover:border-sandstoneGold transition-all">
          <span class="font-heading text-xl text-sandstoneGold block mb-1">04 &bull; AFTER DARK</span>
          <h3 class="font-montserrat text-base font-bold text-crispLinen mb-2">Night Rituals</h3>
          <p class="font-sans text-xs text-mutedSage">Stargazing circles, campfire storytelling, and midnight conversations.</p>
        </div>
        <div class="p-6 rounded-2xl bg-[#12241C] border border-white/15 hover:border-sandstoneGold transition-all">
          <span class="font-heading text-xl text-sandstoneGold block mb-1">05 &bull; SPECIALS</span>
          <h3 class="font-montserrat text-base font-bold text-crispLinen mb-2">Limited Gatherings</h3>
          <p class="font-sans text-xs text-mutedSage">Unique cohort gatherings for bachelorettes, creators &amp; milestones.</p>
        </div>
      </div>

      <a href="cohorts" class="inline-flex items-center gap-2 btn-shine-clean font-montserrat text-xs font-bold uppercase tracking-widest px-9 py-4 rounded-full">
        <span>Explore the Arbora calendar &rarr;</span>
      </a>
    </div>
  </section>

  <!-- 08 — WHAT HAPPENS AFTER YOUR FIRST ARBORA? -->
  <section id="after-arbora" class="py-24 px-6 bg-[#0D1C13] text-crispLinen border-b border-white/10">
    <div class="max-w-7xl mx-auto">
      <div class="text-center max-w-3xl mx-auto mb-16">
        <span class="badge-gold font-montserrat text-xs uppercase tracking-widest font-bold px-4 py-1.5 rounded-full">ONGOING COMMUNITY LIFE</span>
        <h2 class="font-heading text-4xl md:text-5xl uppercase tracking-wider text-crispLinen mt-4 mb-4">WHAT HAPPENS AFTER YOUR FIRST ARBORA?</h2>
        <p class="font-sans text-mutedSage text-base">An Arbora weekend is just the beginning. The community continues across cities, meetups, playlists, and shared moments long after returning home.</p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-20">
        <div class="p-6 rounded-3xl bg-[#12241C] border border-white/15 hover:border-warmCream transition-all">
          <span class="font-heading text-xl text-sandstoneGold block mb-2">01 &bull; CITY CIRCLES</span>
          <h3 class="font-montserrat text-lg font-bold text-crispLinen mb-2">Regional WhatsApp Groups</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">Active Arboran circles in Bengaluru, Mumbai, and Hyderabad for local hangouts.</p>
        </div>

        <div class="p-6 rounded-3xl bg-[#12241C] border border-white/15 hover:border-warmCream transition-all">
          <span class="font-heading text-xl text-sandstoneGold block mb-2">02 &bull; CITY MEETUPS</span>
          <h3 class="font-montserrat text-lg font-bold text-crispLinen mb-2">Member-Led Hangouts</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">Urban coffee hangs, rooftop acoustic jam sessions, and weekend pop-ups.</p>
        </div>

        <div class="p-6 rounded-3xl bg-[#12241C] border border-white/15 hover:border-warmCream transition-all">
          <span class="font-heading text-xl text-sandstoneGold block mb-2">03 &bull; LIVING ARCHIVES</span>
          <h3 class="font-montserrat text-lg font-bold text-crispLinen mb-2">Shared Playlists &amp; Media</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">Community photo journals, Spotify acoustic playlists, and retreat films.</p>
        </div>

        <div class="p-6 rounded-3xl bg-[#12241C] border border-white/15 hover:border-warmCream transition-all">
          <span class="font-heading text-xl text-sandstoneGold block mb-2">04 &bull; PRIORITY ACCESS</span>
          <h3 class="font-montserrat text-lg font-bold text-crispLinen mb-2">First Access to Escapes</h3>
          <p class="font-sans text-xs text-mutedSage leading-relaxed">Arborans receive first invites to limited-capacity upcoming nature gatherings.</p>
        </div>
      </div>

      <!-- FROM ARBORA -->
      <div class="border-t border-white/10 pt-16">
        <div class="text-center max-w-3xl mx-auto mb-12">
          <span class="badge-oat font-montserrat text-xs uppercase tracking-widest font-semibold px-4 py-1.5 rounded-full">Living Brand Content</span>
          <h2 class="font-heading text-3xl md:text-5xl uppercase tracking-wider text-crispLinen mt-4 mb-3">FROM ARBORA</h2>
          <p class="font-sans text-xs md:text-sm text-mutedSage">Stories, photographs, films, playlists, and interviews from our community.</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div class="p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-montserrat text-[10px] font-bold text-sandstoneGold uppercase tracking-widest block mb-2">📸 PHOTO JOURNAL &bull; 2026</span>
            <h3 class="font-montserrat text-lg font-bold text-crispLinen mb-2">48 Hours in the Western Ghats</h3>
            <p class="font-sans text-xs text-mutedSage leading-relaxed">Visual storytelling from our recent coffee-estate retreat in Mudigere.</p>
          </div>
          <div class="p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-montserrat text-[10px] font-bold text-sandstoneGold uppercase tracking-widest block mb-2">🎵 COMMUNITY PLAYLIST</span>
            <h3 class="font-montserrat text-lg font-bold text-crispLinen mb-2">Campfire Acoustic Sessions</h3>
            <p class="font-sans text-xs text-mutedSage leading-relaxed">Curated songs and live acoustic jams recorded under starlit skies.</p>
          </div>
          <div class="p-6 rounded-3xl bg-[#12241C] border border-white/15">
            <span class="font-montserrat text-[10px] font-bold text-sandstoneGold uppercase tracking-widest block mb-2">🎬 BRAND FILM</span>
            <h3 class="font-montserrat text-lg font-bold text-crispLinen mb-2">Where People Find Their People</h3>
            <p class="font-sans text-xs text-mutedSage leading-relaxed">A short film exploring how strangers become familiar faces around open fires.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 09 — WHY ARBORA EXISTS & COMPLETE MERGED TEAM EXPERIENCE -->
  <section id="why-we-exist" class="py-24 px-6 bg-warmSage text-charcoalGreen scroll-mt-16">
    <div class="max-w-7xl mx-auto">
      
      <!-- HERO BANNER -->
      <div class="text-center max-w-4xl mx-auto mb-16 reveal-on-scroll">
        <div class="inline-flex items-center gap-2 mb-4 px-4 py-1 rounded-full bg-[#1A3327] border border-[#C5A880]/40 font-montserrat text-xs text-[#C5A880] font-bold uppercase tracking-widest">
          <span>&#9733; The Belief Behind Arbora</span>
        </div>
        <h2 class="font-heading text-4xl md:text-6xl font-normal uppercase tracking-wide text-[#0D1C13] leading-tight mb-4">
          WHY ARBORA EXISTS <br />
          <span class="text-[#3D5A45] font-heading tracking-wide">&amp; OUR COMMUNITY STORY</span>
        </h2>
        <p class="font-sans text-sm md:text-base text-[#2C3E33] max-w-2xl mx-auto leading-relaxed font-medium">
          The story, culture, and team bringing real human connection back into travel.
        </p>
      </div>

      <!-- 1. SUBSECTION: FOUNDERS & LEADERSHIP -->
      <div class="mb-20">
        <div class="text-center max-w-2xl mx-auto mb-12">
          <span class="font-montserrat text-xs font-bold text-[#3D5A45] uppercase tracking-widest block mb-1">FOUNDER BELIEF</span>
          <h3 class="font-heading text-3xl md:text-5xl uppercase tracking-wider text-[#0D1C13]">THE BUILDERS OF ARBORA</h3>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 items-stretch">
          
          <!-- Adithya Manjunath -->
          <div class="team-card-subtle p-5 flex flex-col justify-between">
            <div>
              <div class="relative w-full aspect-[4/5] rounded-2xl overflow-hidden mb-5">
                <img src="data:image/png;base64,$adithyaMB64" alt="Adithya Manjunath" class="w-full h-full object-cover object-top" />
                <span class="absolute top-3 right-3 badge-overlay-dark">FOUNDER &amp; CEO</span>
              </div>
              
              <h4 class="font-montserrat text-2xl font-bold text-[#111111] mb-0.5">Adithya Manjunath</h4>
              <p class="font-montserrat text-[11px] text-[#3D5A45] font-bold uppercase mb-3">FOUNDER &amp; CEO</p>
              <p class="font-sans text-xs text-[#222222] leading-relaxed mb-4">Leads Arbora's community vision, brand strategy, estate partnerships, and expansion.</p>
            </div>

            <div class="philosophy-box space-y-1.5 font-sans text-xs text-[#222222]">
              <p><span class="font-bold text-[#111111]">&bull; Personal Belief:</span> <br /><span class="italic">&quot;Travel is meaningless without genuine human presence.&quot;</span></p>
              <p><span class="font-bold text-[#111111]">&bull; Favorite Experience:</span> <br /><span>Campfire Acoustic Jams, Western Ghats</span></p>
            </div>
          </div>

          <!-- Sumana Sarkar -->
          <div class="team-card-subtle p-5 flex flex-col justify-between">
            <div>
              <div class="relative w-full aspect-[4/5] rounded-2xl overflow-hidden mb-5">
                <img src="data:image/png;base64,$sumanaB64" alt="Sumana Sarkar" class="w-full h-full object-cover object-top" />
                <span class="absolute top-3 right-3 badge-overlay-dark">CO-FOUNDER</span>
              </div>
              
              <h4 class="font-montserrat text-2xl font-bold text-[#111111] mb-0.5">Sumana Sarkar</h4>
              <p class="font-montserrat text-[11px] text-[#3D5A45] font-bold uppercase mb-3">CO-FOUNDER - STRATEGY &amp; MARKETING</p>
              <p class="font-sans text-xs text-[#222222] leading-relaxed mb-4">Shapes the strategic vision, audience engagement, positioning, and storytelling for Arbora.</p>
            </div>

            <div class="philosophy-box space-y-1.5 font-sans text-xs text-[#222222]">
              <p><span class="font-bold text-[#111111]">&bull; Personal Belief:</span> <br /><span class="italic">&quot;Creating spaces where strangers transform into lifelong friends.&quot;</span></p>
              <p><span class="font-bold text-[#111111]">&bull; Favorite Experience:</span> <br /><span>Coffee Canopy Hikes, Chikmagalur</span></p>
            </div>
          </div>

          <!-- Shashank Madhu -->
          <div class="team-card-subtle p-5 flex flex-col justify-between">
            <div>
              <div class="relative w-full aspect-[4/5] rounded-2xl overflow-hidden mb-5">
                <img src="data:image/png;base64,$shashankB64" alt="Shashank Madhu" class="w-full h-full object-cover object-top" />
                <span class="absolute top-3 right-3 badge-overlay-dark">EXECUTIVE</span>
              </div>
              
              <h4 class="font-montserrat text-2xl font-bold text-[#111111] mb-0.5">Shashank Madhu</h4>
              <p class="font-montserrat text-[11px] text-[#3D5A45] font-bold uppercase mb-3">EXECUTIVE - EXPERIENCE &amp; OPERATIONS</p>
              <p class="font-sans text-xs text-[#222222] leading-relaxed mb-4">Coordinates on-ground logistics, local host integrations, and event execution for seamless experiences.</p>
            </div>

            <div class="philosophy-box space-y-1.5 font-sans text-xs text-[#222222]">
              <p><span class="font-bold text-[#111111]">&bull; Personal Belief:</span> <br /><span class="italic">&quot;Flawless execution unlocks effortless community connection.&quot;</span></p>
              <p><span class="font-bold text-[#111111]">&bull; Favorite Experience:</span> <br /><span>Stream Dip Trails, Mudigere</span></p>
            </div>
          </div>

        </div>
      </div>

      <!-- 2. SUBSECTION: TECHNICAL & CREATIVE EXECUTION -->
      <div class="mb-24">
        <div class="text-center max-w-2xl mx-auto mb-8">
          <span class="font-montserrat text-[11px] font-bold text-[#3D5A45] uppercase tracking-widest block mb-1">TECHNICAL &amp; CREATIVE EXECUTION</span>
          <h3 class="font-heading text-2xl md:text-4xl uppercase tracking-wider text-[#0D1C13]">PLATFORM &amp; ARTIST LEADS</h3>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 items-stretch max-w-2xl mx-auto">
          
          <!-- Harsha Janardhana Giri -->
          <div class="team-card-compact p-4 flex flex-col justify-between">
            <div>
              <div class="relative w-full aspect-[4/5] rounded-xl overflow-hidden mb-4 bg-[#EADBC8]/20">
                <img src="data:image/png;base64,$harshaB64" alt="Harsha Janardhana Giri" class="w-full h-full object-cover object-top" />
                <span class="absolute top-2.5 right-2.5 badge-overlay-sm">LEAD TECH ARCHITECT</span>
              </div>

              <h4 class="font-montserrat text-lg font-bold text-[#111111] mb-0.5">Harsha Janardhana Giri</h4>
              <p class="font-montserrat text-[10px] text-[#3D5A45] font-bold uppercase mb-2">TECHNOLOGY &amp; BACKEND LEAD</p>
              <p class="font-sans text-[11px] text-[#222222] leading-relaxed mb-3">Architected and maintains Arbora's digital infrastructure and community platform technology.</p>
            </div>

            <div class="philosophy-box-sm space-y-1 font-sans text-[11px] text-[#222222]">
              <p><span class="font-bold text-[#111111]">&bull; Personal Belief:</span> <br /><span class="italic">&quot;Seamless tech that gets out of the way of real life.&quot;</span></p>
            </div>
          </div>

          <!-- Kavya M -->
          <div class="team-card-compact p-4 flex flex-col justify-between">
            <div>
              <div class="relative w-full aspect-[4/5] rounded-xl overflow-hidden mb-4 bg-[#EADBC8]/20">
                <img src="data:image/png;base64,$kavyaB64" alt="Kavya M" class="w-full h-full object-cover object-top" />
                <span class="absolute top-2.5 right-2.5 badge-overlay-sm">JAM ARTIST</span>
              </div>

              <h4 class="font-montserrat text-lg font-bold text-[#111111] mb-0.5">Kavya M</h4>
              <p class="font-montserrat text-[10px] text-[#3D5A45] font-bold uppercase mb-2">SINGER &middot; JAM ARTIST</p>
              <p class="font-sans text-[11px] text-[#222222] leading-relaxed mb-3">Soulful vocals that bring people together across fireside sessions and acoustic evening circles.</p>
            </div>

            <div class="philosophy-box-sm space-y-1 font-sans text-[11px] text-[#222222]">
              <p><span class="font-bold text-[#111111]">&bull; Personal Belief:</span> <br /><span class="italic">&quot;Music creates the unscripted magic where strangers become family.&quot;</span></p>
            </div>
          </div>

        </div>
      </div>

      <!-- 3. SUBSECTION: STRATEGIC BACKERS & INVESTORS -->
      <div class="mb-24">
        <div class="text-center max-w-2xl mx-auto mb-10">
          <span class="font-montserrat text-xs font-bold text-[#3D5A45] uppercase tracking-widest block mb-1">STRATEGIC BACKERS</span>
          <h3 class="font-heading text-4xl md:text-5xl uppercase tracking-wider text-[#0D1C13]">INVESTORS</h3>
        </div>

        <div class="investor-outer-card p-8 md:p-12 relative overflow-hidden shadow-2xl">
          <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 items-center">
            
            <!-- Featured Partner Card -->
            <div class="lg:col-span-2">
              <span class="inline-block bg-[#1A3327] border border-[#C5A880]/40 text-[#EADBC8] text-[10px] font-extrabold uppercase tracking-widest px-3.5 py-1 rounded-full mb-5">
                &#9733; STRATEGIC INVESTOR
              </span>
              
              $chukkiLogoHtml

              <h4 class="font-heading text-3xl md:text-5xl uppercase tracking-wider text-[#EADBC8] mb-2">CHUKKI TALKIES</h4>
              <p class="font-montserrat text-xs text-[#C5A880] font-bold uppercase mb-4">MEDIA &amp; VENTURE CAPITAL PARTNER</p>
              <p class="font-sans text-xs md:text-sm text-[#A3B8AD] leading-relaxed font-medium max-w-2xl mb-6">
                Chukki Talkies is Arbora's lead strategic investor and media distribution partner. Backing Arbora with venture capital, production excellence, and cultural reach across South India, Chukki Talkies empowers our long-term vision of building a community brand across the Western Ghats.
              </p>

              <div class="p-4 rounded-2xl bg-[#0B1712] border border-white/15 font-sans text-xs space-y-2 text-[#A3B8AD] max-w-lg">
                <div class="flex items-center gap-2">
                  <span class="text-[#C5A880] font-bold">&#10004;</span>
                  <span>Lead Media Distribution &amp; Cultural Reach Partner</span>
                </div>
                <div class="flex items-center gap-2">
                  <span class="text-[#C5A880] font-bold">&#10004;</span>
                  <span>Venture Capital &amp; Regional Growth Backer</span>
                </div>
              </div>
            </div>

            <!-- Side Highlight Card -->
            <div class="lg:col-span-1 h-full flex flex-col justify-center">
              <div class="bg-[#0B1712] border border-[#C5A880]/30 rounded-3xl p-8 text-center flex flex-col items-center justify-center min-h-[220px] shadow-2xl">
                <span class="font-heading text-3xl text-[#C5A880] uppercase tracking-wider block mb-2">VENTURE PARTNER</span>
                <span class="font-montserrat text-xs text-[#EADBC8]/90 uppercase tracking-widest font-bold">CHUKKI TALKIES &bull; MEDIA &amp; CAPITAL</span>
              </div>
            </div>

          </div>
        </div>
      </div>

      <!-- 4. SUBSECTION: THE ARBORA STORY -->
      <div class="investor-outer-card p-10 md:p-14 mb-10 max-w-5xl mx-auto shadow-2xl">
        <span class="font-montserrat text-xs font-bold text-[#C5A880] uppercase tracking-widest block mb-2">ORIGIN &amp; VISION</span>
        <h3 class="font-heading text-3xl md:text-5xl uppercase tracking-wider text-[#EADBC8] mb-6">THE ARBORA STORY</h3>
        
        <div class="space-y-4 font-sans text-xs md:text-sm text-[#A3B8AD] leading-relaxed font-medium">
          <p>
            Arbora was founded in 2026 out of a simple observation: conventional travel platforms treat accommodation as a transactional line item. Guests book rooms, check in, stay isolated, and check out without ever experiencing true human connection or regional immersion.
          </p>
          <p>
            We set out to build something radically different — a community brand centered on experiences that partners directly with premium estate owners like Sura Stays in Mudigere. By introducing The Arbora Way and our 30-Experience Directory, Arbora creates unscripted stories shared with kindred souls.
          </p>
          <p>
            Supported by Chukki Talkies as our strategic media and investment partner, Arbora is scaling across Chikmagalur, Coorg, Gokarna, and the Western Ghats.
          </p>
        </div>
      </div>

    </div>
  </section>

  <!-- 10 — COMMUNITY MEMBERSHIP CTA -->
  <section class="py-24 px-6 bg-[#0B1712] text-crispLinen text-center border-t border-white/10 relative overflow-hidden">
    <div class="max-w-6xl mx-auto relative z-10">
      <span class="badge-gold font-montserrat text-xs uppercase tracking-widest font-bold px-4 py-1.5 rounded-full inline-block mb-4">BECOME AN ARBORAN</span>
      
      <h2 class="font-heading text-3xl sm:text-4xl md:text-5xl lg:text-6xl uppercase tracking-wider text-crispLinen mb-4 whitespace-normal lg:whitespace-nowrap">
        DON'T JUST FOLLOW ARBORA. JOIN IT.
      </h2>

      <p class="font-sans text-base md:text-lg text-mutedSage max-w-2xl mx-auto leading-relaxed mb-8 font-medium">
        Get first access to gatherings, member-led sessions, stories, playlists, and the people shaping what Arbora becomes next.
      </p>

      <button onclick="openModal()" class="btn-shine-clean font-montserrat text-xs font-bold uppercase tracking-widest px-10 py-4.5 rounded-full shadow-2xl">
        JOIN THE COMMUNITY &rarr;
      </button>
    </div>
  </section>

  <!-- FOOTER -->
  <footer class="py-14 px-6 bg-deepCanopy border-t border-white/10 text-center">
    <div class="max-w-4xl mx-auto flex flex-col items-center justify-center">
      <img src="data:image/png;base64,$logoMarkB64" alt="Arbora Icon Mark" class="h-14 md:h-16 w-auto mb-4 object-contain self-center mx-auto" />
      <div class="flex flex-col items-center justify-center text-center mb-6">
        <span class="font-sans text-xl md:text-2xl font-medium tracking-[0.28em] pl-[0.28em] text-[#EADBC8] uppercase">A R B O R A</span>
        <span class="font-sans text-xs md:text-sm font-normal tracking-[0.22em] pl-[0.22em] text-[#EADBC8]/90 uppercase mt-1 flex items-center justify-center gap-1.5">
          <span class="opacity-60">-</span> COMMUNITY &amp; EXPERIENCES <span class="opacity-60">-</span>
        </span>
      </div>
      <p class="font-sans text-xs text-mutedSage mb-6">Arborans &bull; Karnataka, India &bull; 2026 &bull; Where People Find Their People.</p>
      <p class="font-sans text-[11px] text-mutedSage/60">&copy; 2026 Arbora Experience Brand. All rights reserved.</p>
    </div>
  </footer>

  <!-- MODALS -->
  <div id="bookingModal" class="fixed inset-0 z-50 hidden flex items-center justify-center p-4 bg-black/80 backdrop-blur-md">
    <div class="bg-deepCanopy border-2 border-warmCream rounded-3xl p-8 max-w-lg w-full relative">
      <button onclick="closeModal()" class="absolute top-4 right-4 text-white/60 hover:text-white text-xl font-bold">&times;</button>
      <h3 class="font-montserrat text-2xl font-bold text-crispLinen mb-2">Become An Arboran</h3>
      <p class="font-montserrat text-xs text-sandstoneGold uppercase tracking-wider font-semibold mb-6">Get first access to gatherings, member-led sessions &amp; stories</p>

      <form onsubmit="handleFormSubmit(event)" class="space-y-4">
        <div>
          <label class="block font-montserrat text-xs uppercase font-semibold text-mutedSage mb-1">Full Name *</label>
          <input type="text" required placeholder="Rahul Sharma" class="w-full bg-midPine border border-white/15 rounded-xl px-4 py-2.5 font-sans text-sm text-crispLinen focus:outline-none focus:border-warmCream" />
        </div>
        <div>
          <label class="block font-montserrat text-xs uppercase font-semibold text-mutedSage mb-1">WhatsApp Number *</label>
          <input type="tel" required placeholder="+91 98765 43210" class="w-full bg-midPine border border-white/15 rounded-xl px-4 py-2.5 font-sans text-sm text-crispLinen focus:outline-none focus:border-warmCream" />
        </div>
        <button type="submit" class="w-full btn-shine-clean font-montserrat py-3 rounded-xl font-bold text-xs uppercase tracking-widest">Join the Community &rarr;</button>
      </form>
    </div>
  </div>

  <!-- COMMUNITY MATCHER QUIZ MODAL -->
  <div id="quizModal" class="fixed inset-0 z-50 hidden flex items-center justify-center p-4 bg-black/85 backdrop-blur-md">
    <div class="bg-deepCanopy border-2 border-warmCream rounded-3xl p-8 max-w-lg w-full relative">
      <button onclick="closeQuizModal()" class="absolute top-4 right-4 text-white/60 hover:text-white text-xl font-bold">&times;</button>
      <div id="quizStep1">
        <span class="font-montserrat text-xs font-bold text-sandstoneGold uppercase tracking-widest block mb-1">Community Matcher</span>
        <h3 class="font-montserrat text-2xl font-bold text-crispLinen mb-4">What are you looking to find in Arbora?</h3>
        <div class="space-y-3 mb-6">
          <button onclick="quizSelect('New People & Genuine Connections')" class="w-full p-4 rounded-2xl bg-midPine border border-white/10 hover:border-warmCream font-montserrat text-left font-semibold text-sm text-crispLinen">New people &amp; genuine connections &rarr;</button>
          <button onclick="quizSelect('Music & Creative Energy')" class="w-full p-4 rounded-2xl bg-midPine border border-white/10 hover:border-warmCream font-montserrat text-left font-semibold text-sm text-crispLinen">Music &amp; creative energy &rarr;</button>
          <button onclick="quizSelect('A Quiet Nature Reset')" class="w-full p-4 rounded-2xl bg-midPine border border-white/10 hover:border-warmCream font-montserrat text-left font-semibold text-sm text-crispLinen">A quiet nature reset &rarr;</button>
          <button onclick="quizSelect('An Unscripted Adventure Circle')" class="w-full p-4 rounded-2xl bg-midPine border border-white/10 hover:border-warmCream font-montserrat text-left font-semibold text-sm text-crispLinen">An unscripted adventure circle &rarr;</button>
        </div>
      </div>
      <div id="quizResult" class="hidden text-center">
        <span class="font-montserrat text-xs font-bold text-sandstoneGold uppercase tracking-widest block mb-1">Matched Arbora Circle Calculated!</span>
        <h3 id="quizMatchedTitle" class="font-montserrat text-3xl font-bold text-warmCream mb-2">Matched Experience</h3>
        <button onclick="closeQuizModal(); openModal();" class="w-full btn-shine-clean font-montserrat py-3.5 rounded-xl text-xs uppercase font-bold tracking-widest">Request an invite &rarr;</button>
      </div>
    </div>
  </div>

  <div id="destinationModal" class="fixed inset-0 z-50 hidden flex items-center justify-center p-4 bg-black/85 backdrop-blur-md">
    <div class="bg-deepCanopy border-2 border-warmCream rounded-3xl overflow-hidden max-w-lg w-full relative">
      <button onclick="closeDestinationModal()" class="absolute top-4 right-4 z-20 text-white bg-black/60 p-2 rounded-full border border-white/20 text-lg font-bold">&times;</button>
      <div class="relative h-60 w-full shrink-0">
        <img id="destModalImg" src="" alt="Property Space" class="w-full h-full object-cover" />
      </div>
      <div class="p-6">
        <h3 id="destModalTitle" class="font-montserrat text-2xl font-bold text-crispLinen mb-2">Title</h3>
        <p id="destModalDesc" class="font-sans text-xs text-crispLinen leading-relaxed font-medium mb-6">Description</p>
        <button onclick="closeDestinationModal(); openModal();" class="w-full btn-shine-clean font-montserrat text-xs font-bold uppercase tracking-widest py-3 rounded-full">JOIN THE COMMUNITY &rarr;</button>
      </div>
    </div>
  </div>

  <script>
    document.addEventListener("DOMContentLoaded", function() {
      document.body.addEventListener('touchstart', function() {}, { passive: true });

      document.addEventListener('touchstart', function(e) {
        var btn = e.target.closest('.btn-shine-clean, button, a, .cohort-filter-btn');
        if (btn) {
          btn.classList.add('touch-active');
        }
      }, { passive: true });

      document.addEventListener('touchend', function(e) {
        var btn = e.target.closest('.btn-shine-clean, button, a, .cohort-filter-btn');
        if (btn) {
          setTimeout(function() {
            btn.classList.remove('touch-active');
          }, 180);
        }
      }, { passive: true });

      document.addEventListener('touchcancel', function(e) {
        var btn = e.target.closest('.btn-shine-clean, button, a, .cohort-filter-btn');
        if (btn) {
          btn.classList.remove('touch-active');
        }
      }, { passive: true });

      var vDesk = document.getElementById("heroVideoDesktop");
      var vMob = document.getElementById("heroVideoMobile");
      if (vDesk) { vDesk.playbackRate = 0.75; vDesk.play().catch(function(){}); }
      if (vMob) { vMob.playbackRate = 0.75; vMob.play().catch(function(){}); }

      setTimeout(function() {
        document.getElementById("mainHeader").classList.add("hero-fade-active");
        document.getElementById("heroContent").classList.add("hero-fade-active");
      }, 100);

      if ('IntersectionObserver' in window) {
        var observer = new IntersectionObserver(function(entries) {
          entries.forEach(function(entry) {
            if (entry.isIntersecting) {
              entry.target.classList.add('is-visible');
              observer.unobserve(entry.target);
            }
          });
        }, { threshold: 0.15 });

        document.querySelectorAll('.reveal-on-scroll').forEach(function(el) {
          observer.observe(el);
        });
      }
    });

    window.addEventListener('scroll', function() {
      var bar = document.getElementById('scrollProgressBar');
      var totalH = document.documentElement.scrollHeight - window.innerHeight;
      if (totalH > 0 && bar) {
        bar.style.width = ((window.scrollY / totalH) * 100) + "%";
      }
    });

    function updateSectionDots(el, containerId, totalCount) {
      var cardW = el.clientWidth * 0.82;
      var idx = Math.round(el.scrollLeft / cardW);
      idx = Math.min(Math.max(idx, 0), totalCount - 1);
      
      var container = document.getElementById(containerId);
      if (!container) return;

      var dots = container.querySelectorAll('span');
      dots.forEach(function(dot, i) {
        if (i === idx) {
          dot.className = 'h-2 w-7 bg-sandstoneGold rounded-full transition-all duration-300';
          if (containerId === 'destDots') dot.className = 'h-2 w-7 bg-[#12241C] rounded-full transition-all duration-300';
          if (containerId === 'incDots') dot.className = 'h-2 w-7 bg-[#0B1712] rounded-full transition-all duration-300';
          if (containerId === 'teamDots') dot.className = 'h-2 w-7 bg-[#12241C] rounded-full transition-all duration-300';
        } else {
          dot.className = 'h-2 w-2 bg-white/20 rounded-full transition-all duration-300';
          if (containerId === 'destDots') dot.className = 'h-2 w-2 bg-[#D1DDD5] rounded-full transition-all duration-300';
          if (containerId === 'incDots') dot.className = 'h-2 w-2 bg-[#C4D3C8] rounded-full transition-all duration-300';
          if (containerId === 'teamDots') dot.className = 'h-2 w-2 bg-[#C4D3C9] rounded-full transition-all duration-300';
        }
      });
    }

    function startQuiz() {
      document.getElementById('quizStep1').classList.remove('hidden');
      document.getElementById('quizResult').classList.add('hidden');
      document.getElementById('quizModal').classList.remove('hidden');
    }
    function quizSelect(name) {
      document.getElementById('quizStep1').classList.add('hidden');
      document.getElementById('quizMatchedTitle').innerText = name + ' Circle';
      document.getElementById('quizResult').classList.remove('hidden');
    }
    function closeQuizModal() { document.getElementById('quizModal').classList.add('hidden'); }

    function openDestinationModal(title, tag, imgB64, desc) {
      document.getElementById('destModalTitle').innerText = title;
      document.getElementById('destModalImg').src = 'data:image/jpeg;base64,' + imgB64;
      document.getElementById('destModalDesc').innerText = desc;
      document.getElementById('destinationModal').classList.remove('hidden');
    }
    function closeDestinationModal() { document.getElementById('destinationModal').classList.add('hidden'); }

    function toggleMobileMenu() {
      var menu = document.getElementById('mobileDropdown');
      if (menu.classList.contains('hidden')) { menu.classList.remove('hidden'); }
      else { menu.classList.add('hidden'); }
    }
    function openModal() { document.getElementById('bookingModal').classList.remove('hidden'); }
    function closeModal() { document.getElementById('bookingModal').classList.add('hidden'); }
    function handleFormSubmit(e) {
      e.preventDefault();
      alert('Welcome to Arbora! You are now registered as an Arboran. Our team will reach out with upcoming community gathering invites.');
      closeModal();
    }
  </script>
</body>
</html>
"@;

# WRITE MAIN FILES
[System.IO.File]::WriteAllText("public\index.html", $mainHtmlContent, [System.Text.Encoding]::UTF8);
[System.IO.File]::WriteAllText("public\Arbora_Retreats_Review.html", $mainHtmlContent, [System.Text.Encoding]::UTF8);

Write-Host "Successfully generated lightweight index.html with static video URLs!";
