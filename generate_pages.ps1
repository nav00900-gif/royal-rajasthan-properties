# generate_pages.ps1 - Generates all individual project pages, category pages, and projects index
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$baseDir = Get-Location
$projectsDir = Join-Path $baseDir 'projects'
if (-not (Test-Path $projectsDir)) {
    New-Item -ItemType Directory -Path $projectsDir -Force | Out-Null
}

# 9 Real Verified Properties Data
$propertiesJson = @'
[
  {
    "id": "prop-diggi-300-bigha",
    "slug": "300-bigha-mega-township",
    "title": "300 Bigha Mega Township — Diggi Road",
    "category": "Plots",
    "categorySlug": "residential-plots",
    "city": "Jaipur",
    "locality": "Opposite Knowledge City, Diggi Road",
    "config": "Residential (₹26,950/Gaj) & Commercial (₹46,000/Gaj)",
    "area": "300 Bigha Mega Township (100 - 1000+ Gaj)",
    "priceLabel": "From ₹26,950 / Gaj (Save ₹1,000/Gaj)",
    "image": "https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=1200&q=85",
    "gallery": [
      "https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=1200&q=85",
      "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?auto=format&fit=crop&w=1200&q=85",
      "https://images.unsplash.com/photo-1576013551627-0cc20b96c2a7?auto=format&fit=crop&w=1200&q=85",
      "https://images.unsplash.com/photo-1582510003544-4d00b7f74220?auto=format&fit=crop&w=1200&q=85",
      "https://images.unsplash.com/photo-1513694203232-719a280e022f?auto=format&fit=crop&w=1200&q=85",
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1200&q=85"
    ],
    "description": "300 Bigha Mega Township located on Diggi Road, Opposite Knowledge City, Jaipur. A Mega Investment Destination featuring 200 Ft. main road, 60 Ft. and 40 Ft. internal roads, swimming pool, grand club house, community hall, landscaped parks, mandir, and open green spaces. Plots available with flat ₹1,000/Gaj discount: Residential at ₹26,950/Gaj (Market ₹27,950) and Commercial at ₹46,000/Gaj (Market ₹47,000). Contact: Navratan Kumawat (+91 94618 12342).",
    "amenities": [
      "200 Ft. Main Boulevard",
      "60 & 40 Ft. Internal Tiles Roads",
      "Olympic Size Swimming Pool",
      "Grand Club House & Gymnasium",
      "Community Hall & Banquet",
      "Landscaped Green Parks (20+ Amenities)",
      "Dedicated Mandir (Grand Temple)",
      "Opposite Knowledge City Education Hub",
      "Residential: ₹26,950/Gaj",
      "Commercial: ₹46,000/Gaj",
      "Flat ₹1,000/Gaj Early Discount",
      "Immediate Registry & 80% Loan Approved"
    ],
    "reraStatus": "Government Approved & Planned Mega Township",
    "status": "Discount Active • Booking Open"
  },
  {
    "id": "prop-plot-res-26950",
    "slug": "residential-gated-plots",
    "title": "Residential Gated Township Plots",
    "category": "Plots",
    "categorySlug": "residential-plots",
    "city": "Jaipur",
    "locality": "Ajmer Express Highway Corridor",
    "config": "100, 111, 150 & 200+ Gaj Plots",
    "area": "900 – 2,250 sq.ft. (100 - 250 Gaj)",
    "priceLabel": "₹26,950 / Gaj (Was ₹27,950)",
    "image": "https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=1000&q=80",
    "gallery": [
      "https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1513694203232-719a280e022f?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1448375240586-882707db888b?auto=format&fit=crop&w=1000&q=80"
    ],
    "description": "Government-demarcated residential gated township plots with wide 30 & 40 ft roads, underground electrification, dedicated green park, immediate registry, and flat ₹1,000/Gaj discount (Market Rate: ₹27,950/Gaj, Final Rate: ₹26,950/Gaj).",
    "amenities": [
      "Rate: ₹26,950/Gaj",
      "Save ₹1,000/Gaj",
      "30 & 40 Ft Roads",
      "Immediate Registry",
      "JDA Standards",
      "80% Bank Loan"
    ],
    "reraStatus": "JDA & RERA Standards Compliant",
    "status": "Discount Active (₹26,950/Gaj)"
  },
  {
    "id": "prop-plot-com-46000",
    "slug": "commercial-boulevard-plots",
    "title": "Prime Commercial Boulevard Plots",
    "category": "Commercial",
    "categorySlug": "commercial",
    "city": "Jaipur",
    "locality": "Main Sector Express Corridor",
    "config": "150, 250, 500 & 1000+ Gaj Plots",
    "area": "1,350 – 9,000 sq.ft. (150 - 1000 Gaj)",
    "priceLabel": "₹46,000 / Gaj (Was ₹47,000)",
    "image": "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1000&q=80",
    "gallery": [
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1497366811353-6870744d04b2?auto=format&fit=crop&w=1000&q=80"
    ],
    "description": "Prime commercial avenue plots situated directly on 80, 100 & 160 ft wide arterial development corridors. Ideal for retail showrooms, corporate offices, and high-yield investments with ₹1,000/Gaj discount (Market Rate: ₹47,000/Gaj, Final Rate: ₹46,000/Gaj).",
    "amenities": [
      "Rate: ₹46,000/Gaj",
      "Save ₹1,000/Gaj",
      "100 Ft Frontage",
      "Commercial Clear Title",
      "High Footfall",
      "High ROI Yield"
    ],
    "reraStatus": "100% Commercial Demarcation",
    "status": "Discount Active (₹46,000/Gaj)"
  },
  {
    "id": "prop-1",
    "slug": "the-royal-haveli-enclave",
    "title": "The Royal Haveli Enclave",
    "category": "Villa",
    "categorySlug": "villas",
    "city": "Jaipur",
    "locality": "C-Scheme & Civil Lines Extension",
    "config": "4 & 5 BHK Heritage-Inspired Luxury Villas",
    "area": "4,850 – 6,200 sq.ft.",
    "priceLabel": "Price Available on Request",
    "image": "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1000&q=80",
    "gallery": [
      "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&w=1000&q=80"
    ],
    "description": "Exquisite signature villas fusing authentic Rajasthani Jharokha aesthetics with modern European smart-home engineering. Features double-height living courtyards, private plunge pools, and temperature-controlled wine cellars.",
    "amenities": [
      "Private Plunge Pool",
      "Double-Height Courtyard",
      "Vastu Compliant",
      "Clubhouse & Spa",
      "24/7 Concierge",
      "Italian Marble Flooring"
    ],
    "reraStatus": "Verified Luxury RERA Compliant",
    "status": "Exclusive Launch"
  },
  {
    "id": "prop-2",
    "slug": "jaipur-skyward-residences",
    "title": "Jaipur Skyward Residences",
    "category": "Residential",
    "categorySlug": "residential",
    "city": "Jaipur",
    "locality": "Jagatpura Corridor",
    "config": "3 & 4 BHK Luxury Sky Apartments",
    "area": "2,150 – 3,400 sq.ft.",
    "priceLabel": "Starting from ₹1.15 Cr*",
    "image": "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?auto=format&fit=crop&w=1000&q=80",
    "gallery": [
      "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?auto=format&fit=crop&w=1000&q=80"
    ],
    "description": "Ultra-contemporary high-rise towers overlooking Jaipur’s greenest southern vistas. Designed with expansive wrap-around sundecks, imported German kitchen fittings, and infinity terrace lounges.",
    "amenities": [
      "Rooftop Infinity Pool",
      "EV Charging Bays",
      "Smart Access Control",
      "Squash & Tennis Courts",
      "Lush Zen Gardens",
      "Designer Lobby"
    ],
    "reraStatus": "Verified RERA Schedule on Request",
    "status": "Under Construction"
  },
  {
    "id": "prop-3",
    "slug": "aravalli-greens-township",
    "title": "Aravalli Greens Township",
    "category": "Plots",
    "categorySlug": "residential-plots",
    "city": "Jaipur",
    "locality": "Ajmer Express Highway Corridor",
    "config": "250 to 500 Sq. Yard Villa Plots",
    "area": "2,250 – 4,500 sq.ft.",
    "priceLabel": "Starting from ₹42 Lakh*",
    "image": "https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=1000&q=80",
    "gallery": [
      "https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1000&q=80"
    ],
    "description": "Gated, boutique residential development framed by scenic Aravalli foothills. Fully developed with underground electrical lines, wide asphalt avenues, solar street lighting, and 24-hour guarded security.",
    "amenities": [
      "100% Gated Township",
      "Underground Utilities",
      "Clubhouse Membership",
      "Organic Farming Zone",
      "24/7 CCTV Surveillance"
    ],
    "reraStatus": "Town Planning & RERA Approved",
    "status": "Immediate Registry"
  },
  {
    "id": "prop-4",
    "slug": "meridian-corporate-tower",
    "title": "The Meridian Corporate Tower",
    "category": "Commercial",
    "categorySlug": "commercial",
    "city": "Jaipur",
    "locality": "Tonk Road Central Business Corridor",
    "config": "Grade-A Office Suites & Retail Showrooms",
    "area": "1,200 – 15,000 sq.ft.",
    "priceLabel": "Price Available on Request",
    "image": "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1000&q=80",
    "gallery": [
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1000&q=80"
    ],
    "description": "High-footfall commercial headquarters with modern double-glazed glass curtain wall, multi-level automated car park, high-speed destination elevators, and IGBC Gold Green Building certification.",
    "amenities": [
      "High Speed Lifts",
      "IGBC Gold Certified",
      "Central HVAC",
      "Dedicated Food Court",
      "Conference Center",
      "BMS Automation"
    ],
    "reraStatus": "Commercial RERA Registered",
    "status": "Pre-Leased Options"
  },
  {
    "id": "prop-5",
    "slug": "udaipur-lakeside-sanctuary",
    "title": "Udaipur Lakeside Sanctuary",
    "category": "Villa",
    "categorySlug": "villas",
    "city": "Udaipur",
    "locality": "Fatehsagar Outer Ring",
    "config": "Bespoke Waterfront Estates",
    "area": "5,500 – 8,000 sq.ft.",
    "priceLabel": "Ultra-Luxury Tier (Inquire)",
    "image": "https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&w=1000&q=80",
    "gallery": [
      "https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?auto=format&fit=crop&w=1000&q=80"
    ],
    "description": "Limited edition collection of lake-facing private estates. Hand-carved white marble colonnades, private boat moorings, private courtyard fountains, and panoramic views of the water and Aravalli crests.",
    "amenities": [
      "Waterfront View",
      "Private Helipad Access",
      "Chef’s Kitchen",
      "Security Patrol",
      "Lush Gardens",
      "Butler Quarters"
    ],
    "reraStatus": "Discreet Private Offering",
    "status": "By Invitation Only"
  },
  {
    "id": "prop-6",
    "slug": "mehrangarh-view-floors",
    "title": "Mehrangarh View Floors",
    "category": "Residential",
    "categorySlug": "residential",
    "city": "Jodhpur",
    "locality": "Pal Road & Shikargarh",
    "config": "3 BHK Independent Luxury Floors",
    "area": "1,800 – 2,400 sq.ft.",
    "priceLabel": "Starting from ₹85 Lakh*",
    "image": "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&w=1000&q=80",
    "gallery": [
      "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&w=1000&q=80",
      "https://images.unsplash.com/photo-160058515526-990dced4db0d?auto=format&fit=crop&w=1000&q=80"
    ],
    "description": "Architecturally curated independent luxury floors offering unobstructed Mehrangarh Fort horizon vistas. Constructed with local Jodhpur sandstone jaalis and modern German plumbing fixtures.",
    "amenities": [
      "Fort Horizon Vista",
      "Private Stilt Parking",
      "Independent Terrace Access",
      "Vastu Compliant",
      "24/7 Security"
    ],
    "reraStatus": "Verified Registry Clearances",
    "status": "Ready to Move"
  }
]
'@

$properties = $propertiesJson | ConvertFrom-Json

# Helper to generate individual project HTML page
function Generate-ProjectPage($p) {
    $galleryJson = $p.gallery | ConvertTo-Json -Compress
    $amenitiesHtml = ""
    foreach ($a in $p.amenities) {
        $amenitiesHtml += @"
                <div class="p-3.5 rounded-2xl bg-royal-950/80 border border-white/5 flex items-center gap-2.5">
                  <div class="w-2 h-2 rounded-full bg-gold-400 shrink-0"></div>
                  <span class="font-medium">$a</span>
                </div>
"@
    }

    $galleryGridThumb1 = if ($p.gallery.Count -gt 1) { $p.gallery[1] } else { $p.image }
    $galleryGridThumb2 = if ($p.gallery.Count -gt 2) { $p.gallery[2] } else { $p.image }

    $pageHtml = @"
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
  <!-- Google Tag Manager -->
  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','dataLayer','GTM-5F2PT26S');</script>
  <!-- End Google Tag Manager -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$($p.title) | Royal Rajasthan Properties</title>
  <meta name="description" content="$($p.description.Replace('"', '\"'))">
  <meta name="robots" content="index, follow, max-image-preview:large">
  <link rel="canonical" href="https://www.royalrajasthanproperties.com/projects/$($p.slug).html">
  <meta property="og:title" content="$($p.title) | Royal Rajasthan Properties">
  <meta property="og:description" content="$($p.description.Replace('"', '\"'))">
  <meta property="og:image" content="$($p.image)">
  <meta property="og:url" content="https://www.royalrajasthanproperties.com/projects/$($p.slug).html">
  <meta property="og:type" content="website">

  <!-- Meta Pixel Code -->
  <script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '1753882205841877');
  fbq('track', 'PageView');
  </script>

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@500;600;700;800&family=Cormorant+Garamond:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  <!-- Tailwind CSS via CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      darkMode: 'class',
      theme: {
        extend: {
          fontFamily: {
            sans: ['"Plus Jakarta Sans"', 'sans-serif'],
            serif: ['"Cormorant Garamond"', 'serif'],
            display: ['"Cinzel"', 'serif'],
          },
          colors: {
            gold: {
              50: '#fdfbf7',
              100: '#f9f4ea',
              200: '#f1e6cd',
              300: '#e5d1a7',
              400: '#d5b77c',
              500: '#c5a059',
              600: '#b08846',
              700: '#8e6b36',
              800: '#73562f',
              900: '#5f462a',
            },
            royal: {
              950: '#070a10',
              900: '#0b111c',
              850: '#0e1726',
              800: '#131c2d',
              700: '#1e2c44',
            },
            sand: {
              50: '#fcfbf9',
              100: '#f7f4ee',
              200: '#eee8de',
              300: '#dfd4c3',
            }
          }
        }
      }
    }
  </script>

  <!-- Lucide Icons -->
  <script src="https://unpkg.com/lucide@latest"></script>

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="/logo.png">
  <link rel="apple-touch-icon" href="/logo.png">

  <!-- JSON-LD Structured Data Container -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "RealEstateListing",
    "name": "$($p.title)",
    "description": "$($p.description.Replace('"', '\"'))",
    "url": "https://www.royalrajasthanproperties.com/projects/$($p.slug).html",
    "image": "$($p.image)",
    "offers": {
      "@type": "Offer",
      "priceCurrency": "INR",
      "price": "$($p.priceLabel)",
      "availability": "https://schema.org/InStock"
    },
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "$($p.city)",
      "addressRegion": "Rajasthan",
      "addressCountry": "IN"
    }
  }
  </script>
</head>
<body class="bg-royal-950 text-sand-100 font-sans antialiased min-h-screen flex flex-col selection:bg-gold-500/30 selection:text-gold-200" data-slug="$($p.slug)">
  <!-- Google Tag Manager (noscript) -->
  <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5F2PT26S"
  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
  <!-- End Google Tag Manager (noscript) -->

  <!-- ==================== 1. TOP CONSULTANT HEADER ==================== -->
  <div class="bg-royal-900 border-b border-gold-900/60 py-2 px-4 sm:px-6 text-xs text-sand-200">
    <div class="max-w-7xl mx-auto flex flex-wrap items-center justify-between gap-2">
      <div class="flex items-center gap-3">
        <span class="inline-flex items-center gap-1.5 text-gold-400 font-semibold">
          <i data-lucide="shield-check" class="w-3.5 h-3.5"></i>
          <span>RERA & JDA Verified Listings</span>
        </span>
        <span class="text-white/20 hidden sm:inline">|</span>
        <span class="text-slate-400 hidden sm:inline">Jaipur • Udaipur • Jodhpur • Rajasthan</span>
      </div>
      <div class="flex items-center gap-4">
        <a href="tel:+919461812342" class="hover:text-gold-300 flex items-center gap-1 font-mono">
          <i data-lucide="phone" class="w-3.5 h-3.5 text-gold-400"></i>
          <span>+91 94618 12342</span>
        </a>
        <a href="https://wa.me/919461812342?text=Hello%20Navratan%20ji,%20I%20am%20inquiring%20about%20$([System.Uri]::EscapeDataString($p.title))" target="_blank" class="hover:text-emerald-400 flex items-center gap-1">
          <i data-lucide="message-circle" class="w-3.5 h-3.5 text-emerald-400"></i>
          <span class="hidden sm:inline">WhatsApp Sales Desk</span>
        </a>
      </div>
    </div>
  </div>

  <!-- ==================== 2. MAIN NAVIGATION ==================== -->
  <header class="sticky top-0 z-40 bg-royal-950/95 backdrop-blur-md border-b border-gold-900/40">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-20 flex items-center justify-between gap-4">
      
      <!-- Brand Logo -->
      <a href="/index.html" class="flex items-center gap-3 group">
        <img src="/logo.png" alt="Royal Rajasthan Properties Logo" class="h-12 w-auto object-contain">
        <div>
          <span class="font-display font-bold text-base sm:text-lg text-white tracking-wider block group-hover:text-gold-300 transition-colors">
            ROYAL RAJASTHAN
          </span>
          <span class="text-[10px] text-gold-400 font-bold uppercase tracking-[0.25em] block">
            PROPERTIES • JAIPUR
          </span>
        </div>
      </a>

      <!-- Desktop Nav -->
      <nav class="hidden lg:flex items-center gap-6 text-xs font-semibold uppercase tracking-wider text-sand-200">
        <a href="/index.html" class="hover:text-gold-300 transition-colors">Home</a>
        <a href="/projects/index.html" class="hover:text-gold-300 transition-colors text-gold-400">All Projects</a>
        <a href="/projects/residential-plots.html" class="hover:text-gold-300 transition-colors">Plots & Townships</a>
        <a href="/projects/commercial.html" class="hover:text-gold-300 transition-colors">Commercial</a>
        <a href="/projects/villas.html" class="hover:text-gold-300 transition-colors">Villas</a>
        <a href="/projects/residential.html" class="hover:text-gold-300 transition-colors">Residential</a>
        <a href="/index.html#contact" class="hover:text-gold-300 transition-colors">Contact</a>
      </nav>

      <!-- Header CTAs -->
      <div class="flex items-center gap-2.5">
        <a href="#enquiry-section" class="px-4 py-2.5 rounded-xl bg-gradient-to-r from-gold-300 via-gold-400 to-gold-500 hover:from-gold-200 hover:to-gold-400 text-royal-950 font-bold text-xs uppercase tracking-wider shadow-gold-sm transition-all flex items-center gap-1.5">
          <i data-lucide="send" class="w-3.5 h-3.5"></i>
          <span>Enquire Now</span>
        </a>
        <a href="tel:+919461812342" class="p-2.5 rounded-xl bg-royal-800 hover:bg-royal-750 text-gold-400 border border-gold-500/40 transition-colors" title="Call Senior Consultant">
          <i data-lucide="phone-call" class="w-4 h-4"></i>
        </a>
      </div>

    </div>
  </header>

  <!-- ==================== 3. BREADCRUMBS ==================== -->
  <div class="bg-royal-900/60 border-b border-white/5 py-2.5 px-4 sm:px-6 text-xs text-slate-400">
    <div class="max-w-7xl mx-auto flex items-center gap-2 overflow-x-auto whitespace-nowrap">
      <a href="/index.html" class="hover:text-gold-300">Home</a>
      <span>/</span>
      <a href="/projects/index.html" class="hover:text-gold-300">Projects</a>
      <span>/</span>
      <a href="/projects/$($p.categorySlug).html" class="text-gold-400 font-medium hover:underline">$($p.category)</a>
      <span>/</span>
      <span class="text-white truncate font-medium">$($p.title)</span>
    </div>
  </div>

  <!-- ==================== 4. PROJECT HERO & OVERVIEW ==================== -->
  <main class="flex-1">
    
    <section class="relative py-8 sm:py-12 bg-gradient-to-b from-royal-950 via-royal-900 to-royal-950 border-b border-white/10">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        <!-- Top Status & Location Badges -->
        <div class="flex flex-wrap items-center justify-between gap-3 mb-4">
          <div class="flex items-center gap-2 flex-wrap">
            <span class="px-3 py-1 rounded-full bg-gold-500/20 text-gold-300 border border-gold-400/40 text-xs font-bold uppercase tracking-wider">
              $($p.category)
            </span>
            <span class="px-3 py-1 rounded-full bg-emerald-950 text-emerald-300 border border-emerald-500/40 text-xs font-bold">
              $($p.status)
            </span>
            <span class="px-3 py-1 rounded-full bg-royal-800 text-sand-300 border border-white/15 text-xs font-medium">
              $($p.reraStatus)
            </span>
          </div>
          
          <div class="flex items-center gap-2">
            <button onclick="shareCurrentProject()" class="px-3 py-1.5 rounded-lg bg-royal-800 hover:bg-royal-700 text-sand-200 text-xs font-semibold flex items-center gap-1.5 transition-colors">
              <i data-lucide="share-2" class="w-3.5 h-3.5 text-gold-400"></i>
              <span>Share</span>
            </button>
            <a href="#enquiry-section" class="px-3 py-1.5 rounded-lg bg-gold-500/20 hover:bg-gold-500/30 text-gold-300 border border-gold-500/40 text-xs font-bold flex items-center gap-1.5 transition-colors">
              <i data-lucide="file-text" class="w-3.5 h-3.5"></i>
              <span>Get E-Brochure</span>
            </a>
          </div>
        </div>

        <!-- Project Title & Pricing Header Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 items-start pb-8">
          <div class="lg:col-span-2">
            <h1 class="font-serif text-3xl sm:text-4xl md:text-5xl font-bold text-white tracking-tight leading-tight">
              $($p.title)
            </h1>
            <p class="text-sm sm:text-base text-gold-400 mt-2 flex items-center gap-1.5 font-medium">
              <i data-lucide="map-pin" class="w-4 h-4 shrink-0 text-gold-500"></i>
              <span>$($p.locality), $($p.city), Rajasthan</span>
            </p>
            <p class="text-xs sm:text-sm text-sand-300 mt-1 font-mono">
              $($p.config) • $($p.area)
            </p>
          </div>

          <!-- Price & Primary CTA Card -->
          <div class="p-5 rounded-2xl bg-royal-900/90 border border-gold-400/50 shadow-xl flex flex-col justify-between">
            <div>
              <span class="text-[10px] uppercase font-bold text-slate-400 tracking-wider block">Investment / Price Range</span>
              <div class="font-serif text-2xl sm:text-3xl font-bold text-gold-300 mt-1">
                $($p.priceLabel)
              </div>
              <span class="text-[11px] text-emerald-400 font-medium block mt-1">
                ✓ 80% Bank Loan Support • Transparent Registry
              </span>
            </div>
            <div class="mt-4 pt-4 border-t border-white/10 flex items-center gap-2.5">
              <a href="#enquiry-section" class="flex-1 py-3 px-4 rounded-xl bg-gradient-to-r from-gold-400 to-gold-500 hover:from-gold-300 hover:to-gold-400 text-royal-950 font-bold text-xs uppercase tracking-wider text-center shadow-gold-sm transition-all">
                Request Details
              </a>
              <a href="https://wa.me/919461812342?text=Hello%20Navratan%20ji,%20I%20am%20interested%20in%20$([System.Uri]::EscapeDataString($p.title))" target="_blank" class="p-3 rounded-xl bg-emerald-600 hover:bg-emerald-500 text-white transition-all shadow" title="Chat on WhatsApp">
                <i data-lucide="message-circle" class="w-4 h-4"></i>
              </a>
            </div>
          </div>
        </div>

        <!-- ==================== IMAGE GALLERY SHOWCASE ==================== -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-3 rounded-3xl overflow-hidden border border-gold-900/60 shadow-2xl bg-royal-900">
          
          <!-- Main Hero Image (Takes 2 cols on desktop) -->
          <div class="md:col-span-2 relative h-72 sm:h-96 md:h-[480px] bg-royal-950 overflow-hidden group cursor-pointer" onclick="openGalleryLightbox(0)">
            <img src="$($p.image)" alt="$($p.title) Hero Photo" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105">
            <div class="absolute inset-0 bg-gradient-to-t from-royal-950/80 via-transparent to-transparent"></div>
            <div class="absolute bottom-4 left-4 flex items-center gap-2 text-xs text-white bg-royal-950/80 px-3 py-1.5 rounded-xl border border-white/10 backdrop-blur-md">
              <i data-lucide="camera" class="w-3.5 h-3.5 text-gold-400"></i>
              <span>Click to view full photo gallery ($($p.gallery.Count) Verified Photos)</span>
            </div>
          </div>

          <!-- Secondary Thumbnails Column -->
          <div class="grid grid-cols-2 md:grid-cols-1 gap-3 p-3 bg-royal-900/60">
            <div class="relative h-36 sm:h-44 md:h-[225px] rounded-2xl overflow-hidden cursor-pointer group bg-royal-950" onclick="openGalleryLightbox(1)">
              <img src="$galleryGridThumb1" alt="$($p.title) Photo 2" class="w-full h-full object-cover transition-transform group-hover:scale-105">
              <div class="absolute inset-0 bg-black/20 group-hover:bg-transparent transition-colors"></div>
            </div>
            <div class="relative h-36 sm:h-44 md:h-[225px] rounded-2xl overflow-hidden cursor-pointer group bg-royal-950" onclick="openGalleryLightbox(2)">
              <img src="$galleryGridThumb2" alt="$($p.title) Photo 3" class="w-full h-full object-cover transition-transform group-hover:scale-105">
              <div class="absolute inset-0 bg-black/20 group-hover:bg-transparent transition-colors flex items-center justify-center">
                <span class="px-3 py-1.5 rounded-xl bg-royal-950/90 text-gold-300 text-xs font-bold border border-gold-400/40 shadow">
                  + View All Photos
                </span>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section>

    <!-- ==================== 5. PROJECT DETAILS & ENQUIRY GRID ==================== -->
    <section class="py-12 sm:py-16 bg-royal-950">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-10 items-start">
          
          <!-- LEFT 2 COLS: OVERVIEW, HIGHLIGHTS, AMENITIES, CONNECTIVITY, FAQS -->
          <div class="lg:col-span-2 space-y-12">
            
            <!-- 1. Overview -->
            <div class="p-6 sm:p-8 rounded-3xl bg-royal-900/70 border border-white/10 shadow-lg">
              <h2 class="font-serif text-2xl sm:text-3xl font-bold text-white mb-4 flex items-center gap-2.5">
                <i data-lucide="sparkles" class="w-6 h-6 text-gold-400"></i>
                <span>Project Overview & Highlights</span>
              </h2>
              <div class="text-sm sm:text-base text-slate-300 leading-relaxed space-y-3 font-light">
                <p>$($p.description)</p>
              </div>

              <!-- Quick Highlights Stats -->
              <div class="grid grid-cols-2 sm:grid-cols-3 gap-3.5 mt-6 pt-6 border-t border-white/10 text-xs">
                <div class="p-3 rounded-xl bg-royal-950/80 border border-white/5">
                  <span class="text-slate-400 block text-[10px] uppercase font-bold">Location</span>
                  <strong class="text-white block mt-0.5 font-medium">$($p.locality), $($p.city)</strong>
                </div>
                <div class="p-3 rounded-xl bg-royal-950/80 border border-white/5">
                  <span class="text-slate-400 block text-[10px] uppercase font-bold">Category</span>
                  <strong class="text-gold-400 block mt-0.5 font-medium">$($p.category)</strong>
                </div>
                <div class="p-3 rounded-xl bg-royal-950/80 border border-white/5">
                  <span class="text-slate-400 block text-[10px] uppercase font-bold">Plot / Unit Sizes</span>
                  <strong class="text-white block mt-0.5 font-medium">$($p.area)</strong>
                </div>
              </div>
            </div>

            <!-- 2. Verified Amenities -->
            <div class="p-6 sm:p-8 rounded-3xl bg-royal-900/70 border border-white/10 shadow-lg">
              <h2 class="font-serif text-2xl sm:text-3xl font-bold text-white mb-2 flex items-center gap-2.5">
                <i data-lucide="check-circle-2" class="w-6 h-6 text-gold-400"></i>
                <span>Verified Lifestyle Amenities</span>
              </h2>
              <p class="text-xs text-slate-400 mb-6">
                All amenities are designed to highest civic standards with complete infrastructure on-site.
              </p>

              <div class="grid grid-cols-1 sm:grid-cols-2 gap-3 text-xs text-sand-200">
                $amenitiesHtml
              </div>
            </div>

            <!-- 3. Configuration & Pricing Table -->
            <div class="p-6 sm:p-8 rounded-3xl bg-royal-900/70 border border-white/10 shadow-lg">
              <h2 class="font-serif text-2xl sm:text-3xl font-bold text-white mb-4 flex items-center gap-2.5">
                <i data-lucide="layers" class="w-6 h-6 text-gold-400"></i>
                <span>Configuration & Pricing Matrix</span>
              </h2>
              
              <div class="overflow-x-auto">
                <table class="w-full text-left text-xs text-slate-300">
                  <thead class="bg-royal-950 text-gold-400 uppercase text-[10px] tracking-wider border-b border-white/10">
                    <tr>
                      <th class="py-3 px-4">Configuration</th>
                      <th class="py-3 px-4">Size / Area</th>
                      <th class="py-3 px-4">Price / Rate</th>
                      <th class="py-3 px-4 text-right">Inquiry</th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-white/5">
                    <tr>
                      <td class="py-3 px-4 font-semibold text-white">$($p.config)</td>
                      <td class="py-3 px-4 text-sand-300">$($p.area)</td>
                      <td class="py-3 px-4 text-gold-400 font-bold">$($p.priceLabel)</td>
                      <td class="py-3 px-4 text-right">
                        <a href="#enquiry-section" class="inline-block px-3 py-1 rounded-lg bg-gold-500/20 hover:bg-gold-500/30 text-gold-300 border border-gold-500/40 font-bold text-[11px]">
                          Book / Inquire
                        </a>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <!-- 4. Location & Map Connectivity -->
            <div class="p-6 sm:p-8 rounded-3xl bg-royal-900/70 border border-white/10 shadow-lg">
              <h2 class="font-serif text-2xl sm:text-3xl font-bold text-white mb-2 flex items-center gap-2.5">
                <i data-lucide="navigation" class="w-6 h-6 text-gold-400"></i>
                <span>Location Advantage & Connectivity</span>
              </h2>
              <p class="text-xs text-slate-300 mb-5">
                Located at $($p.locality), $($p.city), Rajasthan. Centrally positioned along major transport corridors with direct arterial road access, civic infrastructure, and high growth appreciation.
              </p>

              <div class="p-4 rounded-2xl bg-royal-950 border border-white/10 flex flex-col sm:flex-row items-center justify-between gap-4">
                <div class="flex items-center gap-3">
                  <div class="w-10 h-10 rounded-xl bg-gold-500/20 text-gold-400 border border-gold-500/40 flex items-center justify-center shrink-0">
                    <i data-lucide="map" class="w-5 h-5"></i>
                  </div>
                  <div>
                    <h4 class="text-sm font-bold text-white">Google Maps Geolocation</h4>
                    <span class="text-xs text-slate-400">$($p.locality), $($p.city)</span>
                  </div>
                </div>
                <a href="https://maps.google.com/?q=$([System.Uri]::EscapeDataString($p.title + ' ' + $p.locality + ' ' + $p.city))" target="_blank" class="px-4 py-2.5 rounded-xl bg-royal-800 hover:bg-royal-750 text-gold-300 border border-gold-500/40 text-xs font-bold flex items-center gap-2 transition-all">
                  <i data-lucide="external-link" class="w-3.5 h-3.5"></i>
                  <span>Open in Google Maps</span>
                </a>
              </div>
            </div>

            <!-- 5. Project Specific FAQs -->
            <div class="p-6 sm:p-8 rounded-3xl bg-royal-900/70 border border-white/10 shadow-lg">
              <h2 class="font-serif text-2xl sm:text-3xl font-bold text-white mb-6 flex items-center gap-2.5">
                <i data-lucide="help-circle" class="w-6 h-6 text-gold-400"></i>
                <span>Frequently Asked Questions</span>
              </h2>
              
              <div class="space-y-3.5 text-xs">
                <details class="group p-4 rounded-xl bg-royal-950 border border-white/10 open:border-gold-500/40 transition-colors">
                  <summary class="font-semibold text-white cursor-pointer list-none flex items-center justify-between">
                    <span>What is the registry process and timeline for $($p.title)?</span>
                    <i data-lucide="chevron-down" class="w-4 h-4 text-gold-400 transition-transform group-open:rotate-180"></i>
                  </summary>
                  <p class="mt-2.5 text-slate-300 leading-relaxed font-light">
                    Registry is executed directly at the sub-registrar office in $($p.city) upon completion of booking formalities. All title papers are verified and certified clear of encumbrances.
                  </p>
                </details>

                <details class="group p-4 rounded-xl bg-royal-950 border border-white/10 open:border-gold-500/40 transition-colors">
                  <summary class="font-semibold text-white cursor-pointer list-none flex items-center justify-between">
                    <span>Is bank loan finance available on $($p.title)?</span>
                    <i data-lucide="chevron-down" class="w-4 h-4 text-gold-400 transition-transform group-open:rotate-180"></i>
                  </summary>
                  <p class="mt-2.5 text-slate-300 leading-relaxed font-light">
                    Yes, up to 75% to 80% bank loan approval is available from major nationalized and private banking institutions (SBI, HDFC, ICICI, etc.) subject to eligibility.
                  </p>
                </details>

                <details class="group p-4 rounded-xl bg-royal-950 border border-white/10 open:border-gold-500/40 transition-colors">
                  <summary class="font-semibold text-white cursor-pointer list-none flex items-center justify-between">
                    <span>Can I schedule a physical site visit with pick & drop assistance?</span>
                    <i data-lucide="chevron-down" class="w-4 h-4 text-gold-400 transition-transform group-open:rotate-180"></i>
                  </summary>
                  <p class="mt-2.5 text-slate-300 leading-relaxed font-light">
                    Absolutely. Royal Rajasthan Properties provides complimentary inspection vehicle pick-and-drop from your location in $($p.city) for prospective buyers and families.
                  </p>
                </details>
              </div>
            </div>

          </div>

          <!-- RIGHT COL: DEDICATED PROJECT ENQUIRY FORM (STICKY ON DESKTOP) -->
          <div id="enquiry-section" class="lg:sticky lg:top-24 space-y-6">
            
            <div class="p-6 sm:p-8 rounded-3xl bg-royal-900 border-2 border-gold-400 shadow-[0_0_40px_rgba(197,160,89,0.2)]">
              
              <div class="mb-5 pb-4 border-b border-white/10">
                <span class="text-[10px] uppercase font-bold text-gold-400 tracking-wider">Direct Project Advisory</span>
                <h3 class="font-serif text-2xl font-bold text-white mt-1">Enquire About This Project</h3>
                <p class="text-xs text-sand-300 mt-1 font-medium">
                  $($p.title)
                </p>
              </div>

              <!-- Dedicated Project Form -->
              <form id="projectEnquiryForm" onsubmit="handleProjectEnquirySubmit(event)" class="space-y-4 text-left">
                
                <!-- Project Name (Pre-filled, read-only) -->
                <div>
                  <label class="block text-[11px] font-semibold text-gold-300 uppercase tracking-wider mb-1">
                    Project Selected
                  </label>
                  <input type="text" id="formProjectName" value="$($p.title)" readonly class="w-full bg-royal-950/80 border border-gold-500/40 rounded-xl px-3.5 py-2.5 text-xs text-gold-200 font-semibold cursor-not-allowed">
                </div>

                <!-- Full Name -->
                <div>
                  <label class="block text-[11px] font-semibold text-sand-200 uppercase tracking-wider mb-1">
                    Your Full Name *
                  </label>
                  <input type="text" id="formClientName" required placeholder="Aapka Poora Naam..." class="w-full bg-royal-950 border border-white/20 rounded-xl px-3.5 py-2.5 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-gold-400">
                </div>

                <!-- Mobile / WhatsApp Number -->
                <div>
                  <label class="block text-[11px] font-semibold text-sand-200 uppercase tracking-wider mb-1">
                    Mobile / WhatsApp Number *
                  </label>
                  <div class="relative">
                    <span class="absolute left-3.5 top-1/2 -translate-y-1/2 text-xs text-gold-400 font-mono">+91</span>
                    <input type="tel" id="formClientPhone" required maxlength="10" pattern="[0-9]{10}" placeholder="10-digit Mobile No." class="w-full bg-royal-950 border border-white/20 rounded-xl pl-12 pr-3.5 py-2.5 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-gold-400 font-mono">
                  </div>
                </div>

                <!-- Property / Plot Type -->
                <div>
                  <label class="block text-[11px] font-semibold text-sand-200 uppercase tracking-wider mb-1">
                    Unit / Configuration Preference
                  </label>
                  <select id="formUnitType" class="w-full bg-royal-950 border border-white/20 rounded-xl px-3.5 py-2.5 text-xs text-white focus:outline-none focus:border-gold-400 cursor-pointer">
                    <option value="$($p.category)">$($p.category) — $($p.config)</option>
                    <option value="Plots">Residential Plots (100 - 250 Gaj)</option>
                    <option value="Commercial">Commercial Plots / Showrooms</option>
                    <option value="Villa">Luxury Villa</option>
                    <option value="Apartment">Luxury Apartment</option>
                  </select>
                </div>

                <!-- Budget Range -->
                <div>
                  <label class="block text-[11px] font-semibold text-sand-200 uppercase tracking-wider mb-1">
                    Estimated Budget
                  </label>
                  <select id="formBudget" class="w-full bg-royal-950 border border-white/20 rounded-xl px-3.5 py-2.5 text-xs text-white focus:outline-none focus:border-gold-400 cursor-pointer">
                    <option value="Under 50 Lakh">Under ₹50 Lakh</option>
                    <option value="50 Lakh - 1 Crore">₹50 Lakh – ₹1 Crore</option>
                    <option value="1 Crore - 2 Crore">₹1 Crore – ₹2 Crore</option>
                    <option value="2 Crore - 5 Crore">₹2 Crore – ₹5 Crore</option>
                    <option value="5 Crore+">₹5 Crore+</option>
                  </select>
                </div>

                <!-- Preferred Site Visit Date -->
                <div>
                  <label class="block text-[11px] font-semibold text-sand-200 uppercase tracking-wider mb-1">
                    Preferred Site Visit Date (Optional)
                  </label>
                  <input type="date" id="formVisitDate" class="w-full bg-royal-950 border border-white/20 rounded-xl px-3.5 py-2.5 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-gold-400 cursor-pointer">
                </div>

                <!-- Message -->
                <div>
                  <label class="block text-[11px] font-semibold text-sand-200 uppercase tracking-wider mb-1">
                    Specific Requirement / Questions (Optional)
                  </label>
                  <textarea id="formMessage" rows="2" placeholder="Tell us if you need site visit, loan info, or brochure..." class="w-full bg-royal-950 border border-white/20 rounded-xl p-3 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-gold-400"></textarea>
                </div>

                <!-- Consent Checkbox -->
                <div class="flex items-start gap-2 pt-1 text-[11px] text-slate-400">
                  <input type="checkbox" id="formConsent" checked required class="mt-0.5 rounded border-white/20 text-gold-500 focus:ring-0">
                  <label for="formConsent">
                    I consent to receiving official project updates, price brochures, and WhatsApp notifications from Royal Rajasthan Properties.
                  </label>
                </div>

                <!-- Submit Button -->
                <button type="submit" id="projectSubmitBtn" class="w-full py-3.5 px-4 rounded-xl bg-gradient-to-r from-gold-300 via-gold-400 to-gold-500 hover:from-gold-200 hover:to-gold-400 text-royal-950 font-bold text-xs uppercase tracking-wider shadow-gold-sm transition-all flex items-center justify-center gap-2 cursor-pointer active:scale-95">
                  <i data-lucide="send" class="w-4 h-4"></i>
                  <span>Enquire About This Project</span>
                </button>

              </form>

              <!-- Instant WhatsApp & Call Contact Options -->
              <div class="mt-6 pt-5 border-t border-white/10 space-y-2.5">
                <a href="https://wa.me/919461812342?text=Hello%20Navratan%20ji,%20I%20am%20inquiring%20about%20$([System.Uri]::EscapeDataString($p.title))" target="_blank" class="w-full py-2.5 px-3 rounded-xl bg-emerald-600 hover:bg-emerald-500 text-white font-bold text-xs flex items-center justify-center gap-2 transition-all">
                  <i data-lucide="message-circle" class="w-4 h-4"></i>
                  <span>Chat on WhatsApp Directly</span>
                </a>
                <a href="tel:+919461812342" class="w-full py-2.5 px-3 rounded-xl bg-royal-800 hover:bg-royal-750 text-gold-300 border border-gold-500/40 font-bold text-xs flex items-center justify-center gap-2 transition-all">
                  <i data-lucide="phone-call" class="w-4 h-4"></i>
                  <span>Call Navratan Kumawat (+91 94618 12342)</span>
                </a>
              </div>

            </div>

            <!-- Consultant Credibility Card -->
            <div class="p-5 rounded-2xl bg-royal-900/60 border border-white/10 text-xs text-slate-300 flex items-center gap-3">
              <div class="w-12 h-12 rounded-full bg-gold-500/20 text-gold-400 border border-gold-500/40 flex items-center justify-center shrink-0 text-base font-bold font-display">
                NK
              </div>
              <div>
                <strong class="text-white block font-medium">Navratan Kumawat</strong>
                <span class="text-[11px] text-gold-400 block">Senior Luxury Real Estate Consultant</span>
                <span class="text-[10px] text-slate-400 block mt-0.5">15+ Yrs Industry Experience • 1,200+ Satisfied Families</span>
              </div>
            </div>

          </div>

        </div>

      </div>
    </section>

  </main>

  <!-- ==================== 7. FOOTER ==================== -->
  <footer class="bg-royal-950 border-t border-gold-900/60 py-12 px-4 sm:px-6 text-xs text-slate-400">
    <div class="max-w-7xl mx-auto flex flex-col md:flex-row items-center justify-between gap-6">
      <div class="flex items-center gap-3">
        <img src="/logo.png" alt="Royal Rajasthan Properties" class="h-10 w-auto">
        <div>
          <strong class="text-white block font-display">ROYAL RAJASTHAN PROPERTIES</strong>
          <span class="text-[10px] text-gold-400">Jaipur, Rajasthan, India • Call: +91 94618 12342</span>
        </div>
      </div>
      <div class="flex items-center gap-4 text-xs">
        <a href="/index.html" class="hover:text-gold-300">Home</a>
        <a href="/projects/index.html" class="hover:text-gold-300">Projects</a>
        <a href="/index.html#contact" class="hover:text-gold-300">Contact</a>
      </div>
    </div>
    <div class="max-w-7xl mx-auto mt-6 pt-6 border-t border-white/5 text-center text-[11px] text-slate-500">
      © 2026 ROYAL RAJASTHAN PROPERTIES. All rights reserved. Registered Real Estate Consultant, Jaipur, Rajasthan.
    </div>
  </footer>

  <!-- ==================== GALLERY LIGHTBOX MODAL ==================== -->
  <div id="galleryLightboxModal" class="fixed inset-0 z-50 hidden bg-black/95 flex items-center justify-center p-4">
    <button onclick="closeGalleryLightbox()" class="absolute top-5 right-5 p-2 rounded-full bg-white/10 hover:bg-white/20 text-white">
      <i data-lucide="x" class="w-6 h-6"></i>
    </button>
    <button onclick="prevLightboxImg()" class="absolute left-4 top-1/2 -translate-y-1/2 p-3 rounded-full bg-white/10 hover:bg-white/20 text-white">
      <i data-lucide="chevron-left" class="w-6 h-6"></i>
    </button>
    <button onclick="nextLightboxImg()" class="absolute right-4 top-1/2 -translate-y-1/2 p-3 rounded-full bg-white/10 hover:bg-white/20 text-white">
      <i data-lucide="chevron-right" class="w-6 h-6"></i>
    </button>
    <div class="max-w-4xl max-h-[85vh] overflow-hidden rounded-2xl border border-gold-400/50">
      <img id="lightboxImg" src="" class="max-w-full max-h-[80vh] object-contain mx-auto">
      <div id="lightboxCaption" class="p-3 text-center text-xs text-sand-200 bg-royal-950/90 font-medium"></div>
    </div>
  </div>

  <!-- Client-side script for lead dispatch and interactivity -->
  <script>
    const currentProject = {
      id: '$($p.id)',
      slug: '$($p.slug)',
      title: '$($p.title)',
      category: '$($p.category)',
      city: '$($p.city)',
      locality: '$($p.locality)',
      config: '$($p.config)',
      area: '$($p.area)',
      priceLabel: '$($p.priceLabel)',
      image: '$($p.image)',
      gallery: $galleryJson
    };

    let currentLightboxIdx = 0;

    function openGalleryLightbox(index) {
      if (!currentProject.gallery || currentProject.gallery.length === 0) return;
      currentLightboxIdx = index;
      updateLightboxDisplay();
      document.getElementById('galleryLightboxModal').classList.remove('hidden');
    }

    function closeGalleryLightbox() {
      document.getElementById('galleryLightboxModal').classList.add('hidden');
    }

    function prevLightboxImg() {
      if (currentLightboxIdx > 0) {
        currentLightboxIdx--;
      } else {
        currentLightboxIdx = currentProject.gallery.length - 1;
      }
      updateLightboxDisplay();
    }

    function nextLightboxImg() {
      if (currentLightboxIdx < currentProject.gallery.length - 1) {
        currentLightboxIdx++;
      } else {
        currentLightboxIdx = 0;
      }
      updateLightboxDisplay();
    }

    function updateLightboxDisplay() {
      const img = document.getElementById('lightboxImg');
      const caption = document.getElementById('lightboxCaption');
      img.src = currentProject.gallery[currentLightboxIdx];
      caption.textContent = `${currentProject.title} — Photo ${currentLightboxIdx + 1} of ${currentProject.gallery.length}`;
    }

    function shareCurrentProject() {
      if (navigator.share) {
        navigator.share({
          title: currentProject.title,
          text: `Explore ${currentProject.title} in ${currentProject.city} with Royal Rajasthan Properties`,
          url: window.location.href
        }).catch(() => null);
      } else {
        navigator.clipboard.writeText(window.location.href).then(() => {
          alert('Link copied to clipboard! You can share it anywhere.');
        });
      }
    }

    function handleProjectEnquirySubmit(e) {
      e.preventDefault();
      const submitBtn = document.getElementById('projectSubmitBtn');
      submitBtn.disabled = true;
      submitBtn.innerHTML = '<span>Submitting Inquiry...</span>';

      const name = document.getElementById('formClientName').value.trim();
      const phone = document.getElementById('formClientPhone').value.trim();
      const projectName = currentProject.title;
      const unitType = document.getElementById('formUnitType').value;
      const budget = document.getElementById('formBudget').value;
      const visitDate = document.getElementById('formVisitDate').value;
      const message = document.getElementById('formMessage').value.trim();

      const leadObj = {
        id: 'lead-' + Date.now(),
        name: name,
        phone: phone,
        email: '',
        locationPreference: currentProject.locality + ', ' + currentProject.city,
        propertyType: unitType,
        budget: budget,
        purpose: 'Investment / End-use',
        projectInterest: projectName,
        preferredCallbackTime: visitDate ? `Site Visit Date: ${visitDate}` : 'Immediate',
        message: message ? `${message} (Preferred Unit: ${unitType})` : `Inquired about ${projectName}`,
        leadSource: `Project Landing Page (${projectName})`,
        pageUrl: window.location.href,
        callbackRequested: true,
        whatsappInquiry: true,
        leadStatus: 'New',
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString()
      };

      try {
        const CRM_KEY_1 = 'royal_rajasthan_leads_v1';
        const CRM_KEY_2 = 'rrp_crm_leads';
        
        const leads1 = JSON.parse(localStorage.getItem(CRM_KEY_1) || '[]');
        leads1.unshift(leadObj);
        localStorage.setItem(CRM_KEY_1, JSON.stringify(leads1));

        const leads2 = JSON.parse(localStorage.getItem(CRM_KEY_2) || '[]');
        leads2.unshift(leadObj);
        localStorage.setItem(CRM_KEY_2, JSON.stringify(leads2));

        sessionStorage.setItem('rrp_latest_inquiry', JSON.stringify(leadObj));
        localStorage.setItem('rrp_latest_inquiry', JSON.stringify(leadObj));
      } catch (err) {
        console.error('Storage error:', err);
      }

      // Meta Pixel Lead tracking
      if (typeof fbq === 'function') {
        try {
          fbq('track', 'Lead', {
            content_name: projectName,
            content_category: currentProject.category,
            currency: 'INR'
          });
        } catch (err) {}
      }

      // FormSubmit Email dispatch to nav00900@gmail.com
      fetch('https://formsubmit.co/ajax/nav00900@gmail.com', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
        body: JSON.stringify({
          _subject: `New Project Lead: ${name} (${phone}) - ${projectName}`,
          Client_Name: name,
          Phone_WhatsApp: phone,
          Project_Name: projectName,
          Unit_Type: unitType,
          Budget: budget,
          Site_Visit_Date: visitDate || 'Not specified',
          Message: message,
          Page_URL: window.location.href
        })
      }).catch(() => null);

      // Google Sheets Webhook Dispatch if configured
      try {
        const webhookUrl = localStorage.getItem('royal_rajasthan_sheets_webhook_v1') || localStorage.getItem('rrp_google_sheets_webhook');
        if (webhookUrl && webhookUrl.startsWith('http')) {
          fetch(webhookUrl, {
            method: 'POST',
            mode: 'no-cors',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(leadObj)
          }).catch(() => null);
        }
      } catch (err) {}

      // Redirect to thank-you.html with query parameters
      setTimeout(() => {
        const targetUrl = `/thank-you.html?ref=${encodeURIComponent(leadObj.id)}&name=${encodeURIComponent(name)}&phone=${encodeURIComponent(phone)}&project=${encodeURIComponent(projectName)}&budget=${encodeURIComponent(budget)}&wa=1`;
        window.location.href = targetUrl;
      }, 700);
    }

    document.addEventListener('DOMContentLoaded', () => {
      if (window.lucide) lucide.createIcons();
    });
  </script>
</body>
</html>
"@
    return $pageHtml
}

# Generate 9 project static files in projects/<slug>.html and projects/<slug>/index.html
foreach ($p in $properties) {
    $filePath = Join-Path $projectsDir "$($p.slug).html"
    $htmlContent = Generate-ProjectPage $p
    [System.IO.File]::WriteAllText($filePath, $htmlContent, [System.Text.Encoding]::UTF8)
    Write-Host "Generated: projects/$($p.slug).html" -ForegroundColor Cyan

    # Also generate directory index for clean URL /projects/<slug>/
    $slugDir = Join-Path $projectsDir $p.slug
    if (-not (Test-Path $slugDir)) {
        New-Item -ItemType Directory -Path $slugDir -Force | Out-Null
    }
    [System.IO.File]::WriteAllText((Join-Path $slugDir 'index.html'), $htmlContent, [System.Text.Encoding]::UTF8)
}

Write-Host "All individual project static pages generated successfully." -ForegroundColor Green
