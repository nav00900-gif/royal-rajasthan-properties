/**
 * ROYAL RAJASTHAN PROPERTIES — Global Background Images & Page Selection System
 * Shared client-side background engine for Homepage, Hubs, Categories & Project Landing Pages.
 */

(function () {
  'use strict';

  // Prevent multiple initializations on the same page
  if (window.RRP_PageBackgroundInitialized) return;
  window.RRP_PageBackgroundInitialized = true;

  // 1. DEFAULT HERO DISPLAY SETTINGS (Visual Controls & Timing)
  const DEFAULT_HERO_DISPLAY_SETTINGS = {
    global: {
      blur: 2.5,
      brightness: 100,
      overlayOpacity: 65,
      goldTint: 10,
      scale: 100,
      fit: 'cover',
      position: 'center center',
      focalX: 50,
      focalY: 50
    },
    devices: {
      desktop: { enabled: false, blur: 2.5, brightness: 100, overlayOpacity: 65, scale: 100, fit: 'cover', position: 'center center', focalX: 50, focalY: 50 },
      laptop:  { enabled: false, blur: 2.5, brightness: 100, overlayOpacity: 65, scale: 100, fit: 'cover', position: 'center center', focalX: 50, focalY: 50 },
      tablet:  { enabled: false, blur: 3.0, brightness: 100, overlayOpacity: 70, scale: 100, fit: 'cover', position: 'center center', focalX: 50, focalY: 50 },
      mobile:  { enabled: false, blur: 3.5, brightness: 100, overlayOpacity: 75, scale: 100, fit: 'cover', position: 'center center', focalX: 50, focalY: 50 }
    },
    slideshow: {
      autoPlay: true,
      duration: 6,
      transitionDuration: 1.5,
      crossfade: true,
      kenBurns: true,
      fallbackUrl: 'https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=2000&q=85'
    }
  };

  // 2. DEFAULT 20 CURATED LUXURY RAJASTHAN VISUALS
  const DEFAULT_HERO_BACKGROUNDS = [
    { id: 'hero-bg-01', title: 'Jaipur Royal Palace', category: 'Royal Heritage', url: 'https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-02', title: 'Rajasthan Royal Heritage', category: 'Heritage Architecture', url: 'https://images.unsplash.com/photo-1609137144813-7d9921338f24?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-03', title: 'Luxury Villa with Private Pool', category: 'Luxury Villa', url: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-04', title: 'Residential Township Aerial View', category: 'Township Aerial', url: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-05', title: 'Rajasthani Sandstone Haveli', category: 'Heritage Haveli', url: 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-06', title: 'Modern Luxury Mansion Entrance', category: 'Modern Mansion', url: 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-07', title: 'Jaipur Heritage & City Horizon', category: 'Heritage Architecture', url: 'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-08', title: 'Premium Villa Exterior at Dusk', category: 'Evening Architecture', url: 'https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-09', title: 'Green Township Boulevard', category: 'Township Aerial', url: 'https://images.unsplash.com/photo-1513694203232-719a280e022f?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-10', title: 'Bespoke Royal Courtyard Villa', category: 'Luxury Villa', url: 'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-11', title: 'Royal Palace Sandstone Arches', category: 'Royal Heritage', url: 'https://images.unsplash.com/photo-1598890777032-bde835ba27c2?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-12', title: 'Contemporary Glass & Stone Villa', category: 'Modern Mansion', url: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-13', title: 'Aerial View of Gated Plots', category: 'Plotted Development', url: 'https://images.unsplash.com/photo-1448375240586-882707db888b?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-14', title: 'Heritage Mansion with Domes', category: 'Heritage Haveli', url: 'https://images.unsplash.com/photo-1587474260584-136574528ed5?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-15', title: 'Private Forest & Garden Estate', category: 'Luxury Villa', url: 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-16', title: 'Residential Community Clubhouse', category: 'Modern Mansion', url: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-17', title: 'Sunset over Royal Architecture', category: 'Evening Architecture', url: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-18', title: 'Illuminated Pool Villa at Blue Hour', category: 'Luxury Villa', url: 'https://images.unsplash.com/photo-1576013551627-0cc20b96c2a7?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-19', title: 'Grand Heritage Monumental Estate', category: 'Royal Heritage', url: 'https://images.unsplash.com/photo-1544717305-2782549b5136?auto=format&fit=crop&w=2000&q=85', isEnabled: true },
    { id: 'hero-bg-20', title: 'Cinematic Panoramic Royal Estate', category: 'Cinematic Panorama', url: 'https://images.unsplash.com/photo-160058515526-990dced4db0d?auto=format&fit=crop&w=2000&q=85', isEnabled: true }
  ];

  // 3. DEFAULT PAGE BACKGROUND SETTINGS & ROUTE SELECTION
  const DEFAULT_PAGE_BACKGROUND_SETTINGS = {
    version: '2.0',
    globalDefaults: {
      enabled: true,
      mode: 'global', // 'global' | 'single' | 'custom' | 'disabled'
      singleImageId: 'hero-bg-01',
      selectedImageIds: []
    },
    groups: {
      'project-pages': {
        name: 'All Project Landing Pages',
        pattern: '^/projects/[^/]+(/index\\.html)?$',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-04',
        selectedImageIds: []
      },
      'category-pages': {
        name: 'Category Listings',
        pattern: '^/projects/(residential|commercial|residential-plots|villas)(/index\\.html)?$',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-03',
        selectedImageIds: []
      }
    },
    pages: {
      '/': {
        name: 'Homepage',
        route: '/',
        category: 'core',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-01',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/': {
        name: 'Projects Listing Hub',
        route: '/projects/',
        category: 'core',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-04',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/catalog/': {
        name: 'Property Catalog',
        route: '/catalog/',
        category: 'core',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-03',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/advisor/': {
        name: 'Senior Advisor',
        route: '/advisor/',
        category: 'core',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-02',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/inquiry/': {
        name: 'Inquiry Desk',
        route: '/inquiry/',
        category: 'core',
        enabled: false, // Disabled by default as requested in prompt example
        mode: 'disabled',
        singleImageId: 'hero-bg-06',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/schedule-visit/': {
        name: 'Schedule Site Visit',
        route: '/schedule-visit/',
        category: 'core',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-09',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/privacy-policy/': {
        name: 'Privacy Policy',
        route: '/privacy-policy/',
        category: 'core',
        enabled: false,
        mode: 'disabled',
        singleImageId: 'hero-bg-05',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/thank-you.html': {
        name: 'Thank You Page',
        route: '/thank-you.html',
        category: 'core',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-01',
        selectedImageIds: [],
        visualOverrides: null
      },
      // Category Listings
      '/projects/residential/': {
        name: 'Residential Projects',
        route: '/projects/residential/',
        category: 'category',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-03',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/commercial/': {
        name: 'Commercial Projects',
        route: '/projects/commercial/',
        category: 'category',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-06',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/residential-plots/': {
        name: 'Residential Plots & Mega Townships',
        route: '/projects/residential-plots/',
        category: 'category',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-04',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/villas/': {
        name: 'Luxury Villas & Haveli Enclaves',
        route: '/projects/villas/',
        category: 'category',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-10',
        selectedImageIds: [],
        visualOverrides: null
      },
      // Individual Project Landing Pages
      '/projects/300-bigha-mega-township/': {
        name: '300 Bigha Mega Township — Diggi Road',
        route: '/projects/300-bigha-mega-township/',
        category: 'project',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-04',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/aravalli-greens-township/': {
        name: 'Aravalli Greens Township — Ajmer Road',
        route: '/projects/aravalli-greens-township/',
        category: 'project',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-09',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/commercial-boulevard-plots/': {
        name: 'Commercial Boulevard Plots — Ring Road',
        route: '/projects/commercial-boulevard-plots/',
        category: 'project',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-06',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/jaipur-skyward-residences/': {
        name: 'Jaipur Skyward Residences — Mansarovar',
        route: '/projects/jaipur-skyward-residences/',
        category: 'project',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-16',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/mehrangarh-view-floors/': {
        name: 'Mehrangarh View Floors — Jodhpur',
        route: '/projects/mehrangarh-view-floors/',
        category: 'project',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-07',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/meridian-corporate-tower/': {
        name: 'Meridian Corporate Tower — Tonk Road',
        route: '/projects/meridian-corporate-tower/',
        category: 'project',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-06',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/residential-gated-plots/': {
        name: 'Residential Gated Plots — Sirsi Road',
        route: '/projects/residential-gated-plots/',
        category: 'project',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-13',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/the-royal-haveli-enclave/': {
        name: 'The Royal Haveli Enclave — Jagatpura',
        route: '/projects/the-royal-haveli-enclave/',
        category: 'project',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-14',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/projects/udaipur-lakeside-sanctuary/': {
        name: 'Udaipur Lakeside Sanctuary — Fateh Sagar',
        route: '/projects/udaipur-lakeside-sanctuary/',
        category: 'project',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-18',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/project.html': {
        name: 'Generic Project Detail Template',
        route: '/project.html',
        category: 'project',
        enabled: true,
        mode: 'global',
        singleImageId: 'hero-bg-04',
        selectedImageIds: [],
        visualOverrides: null
      },
      '/admin/': {
        name: 'Admin Portal (CRM & Management)',
        route: '/admin/',
        category: 'admin',
        enabled: false, // Always disabled by default
        mode: 'disabled',
        singleImageId: 'hero-bg-01',
        selectedImageIds: [],
        visualOverrides: null
      }
    }
  };

  // 4. CLIENT-SIDE INDEXEDDB MEDIA STORAGE LOADER
  const RRP_MediaStorage = {
    dbName: 'RRP_HeroMediaDB',
    storeName: 'hero_images',
    open() {
      return new Promise((resolve) => {
        if (!window.indexedDB) return resolve(null);
        try {
          const req = indexedDB.open(this.dbName, 1);
          req.onupgradeneeded = (e) => {
            const db = e.target.result;
            if (!db.objectStoreNames.contains(this.storeName)) {
              db.createObjectStore(this.storeName, { keyPath: 'id' });
            }
          };
          req.onsuccess = () => resolve(req.result);
          req.onerror = () => resolve(null);
        } catch (err) {
          resolve(null);
        }
      });
    },
    async getImage(id) {
      const db = await this.open();
      if (!db) return null;
      return new Promise((resolve) => {
        try {
          const tx = db.transaction([this.storeName], 'readonly');
          const store = tx.objectStore(this.storeName);
          const req = store.get(id);
          req.onsuccess = () => resolve(req.result ? req.result.dataUrl : null);
          req.onerror = () => resolve(null);
        } catch (e) {
          resolve(null);
        }
      });
    }
  };

  // 5. HELPER: NORMALIZE PATH ROUTE
  function normalizeRoute(pathname) {
    if (!pathname) return '/';
    let p = pathname.toLowerCase();
    // Strip trailing /index.html
    p = p.replace(/\/index\.html$/, '/');
    // Ensure root
    if (p === '' || p === '/index.html') return '/';
    // If ends without trailing slash and no dot, add slash
    if (!p.includes('.') && !p.endsWith('/')) {
      p += '/';
    }
    return p;
  }

  // 6. HELPER: GET CURRENT BREAKPOINT
  function getCurrentBreakpoint() {
    const w = window.innerWidth;
    if (w >= 1280) return 'desktop';
    if (w >= 1024) return 'laptop';
    if (w >= 768) return 'tablet';
    return 'mobile';
  }

  // 7. INJECT SHARED CSS STYLES
  function injectBackgroundStyles() {
    if (document.getElementById('rrp-page-bg-styles')) return;
    const style = document.createElement('style');
    style.id = 'rrp-page-bg-styles';
    style.textContent = `
      .hero-slideshow-container {
        --hero-blur: 2.5px;
        --hero-brightness: 1;
        --hero-scale: 1;
        --hero-fit: cover;
        --hero-pos: center center;
        --hero-overlay-opacity: 0.65;
        --hero-gold-tint: 0.1;
        --hero-trans-duration: 1.5s;
      }
      .hero-slide-layer {
        transform: scale(var(--hero-scale, 1));
        filter: brightness(var(--hero-brightness, 1));
        background-size: var(--hero-fit, cover);
        background-position: var(--hero-pos, center center);
        background-repeat: no-repeat;
        transition: opacity var(--hero-trans-duration, 1.5s) ease-in-out, transform 6.5s cubic-bezier(0.25, 1, 0.5, 1);
        will-change: opacity, transform, filter;
      }
      .hero-slide-layer.is-zoomed {
        transform: scale(calc(var(--hero-scale, 1) * 1.06));
      }
      .hero-slide-layer.no-zoom {
        transform: scale(var(--hero-scale, 1)) !important;
      }
      .hero-slide-layer.no-crossfade {
        transition: none !important;
      }
      @media (prefers-reduced-motion: reduce) {
        .hero-slide-layer {
          transition: opacity var(--hero-trans-duration, 1.5s) ease-in-out !important;
          transform: scale(var(--hero-scale, 1)) !important;
        }
      }
    `;
    document.head.appendChild(style);
  }

  // 8. RESOLVE PAGE CONFIGURATION
  function getPageBackgroundSettings() {
    try {
      const raw = localStorage.getItem('rrp_page_background_settings');
      if (raw) {
        const parsed = JSON.parse(raw);
        return {
          ...DEFAULT_PAGE_BACKGROUND_SETTINGS,
          ...parsed,
          pages: { ...DEFAULT_PAGE_BACKGROUND_SETTINGS.pages, ...(parsed.pages || {}) },
          groups: { ...DEFAULT_PAGE_BACKGROUND_SETTINGS.groups, ...(parsed.groups || {}) },
          globalDefaults: { ...DEFAULT_PAGE_BACKGROUND_SETTINGS.globalDefaults, ...(parsed.globalDefaults || {}) }
        };
      }
    } catch (e) {
      console.warn('Error reading rrp_page_background_settings from localStorage', e);
    }
    return DEFAULT_PAGE_BACKGROUND_SETTINGS;
  }

  function getGlobalDisplaySettings() {
    try {
      const raw = localStorage.getItem('rrp_hero_display_settings');
      if (raw) {
        const parsed = JSON.parse(raw);
        return {
          global: { ...DEFAULT_HERO_DISPLAY_SETTINGS.global, ...(parsed.global || {}) },
          devices: { ...DEFAULT_HERO_DISPLAY_SETTINGS.devices, ...(parsed.devices || {}) },
          slideshow: { ...DEFAULT_HERO_DISPLAY_SETTINGS.slideshow, ...(parsed.slideshow || {}) }
        };
      }
    } catch (e) {}
    return DEFAULT_HERO_DISPLAY_SETTINGS;
  }

  function getAllHeroBackgrounds() {
    try {
      const raw = localStorage.getItem('rrp_admin_hero_backgrounds');
      if (raw) {
        const parsed = JSON.parse(raw);
        if (Array.isArray(parsed) && parsed.length > 0) return parsed;
      }
    } catch (e) {}
    return DEFAULT_HERO_BACKGROUNDS;
  }

  function resolvePageConfig(pathname) {
    const settings = getPageBackgroundSettings();
    const route = normalizeRoute(pathname);

    // Exact page match
    if (settings.pages[route]) {
      return { ...settings.pages[route], routeKey: route };
    }

    // Match without trailing slash or with .html
    for (const key of Object.keys(settings.pages)) {
      if (key === route || key.replace(/\/$/, '') === route.replace(/\/$/, '')) {
        return { ...settings.pages[key], routeKey: key };
      }
    }

    // Check dynamic group rules (e.g. project pages)
    for (const [gid, grp] of Object.entries(settings.groups || {})) {
      if (grp.pattern) {
        try {
          const re = new RegExp(grp.pattern);
          if (re.test(pathname) || re.test(route)) {
            return {
              name: grp.name,
              route: route,
              category: 'project',
              enabled: grp.enabled !== false,
              mode: grp.mode || 'global',
              singleImageId: grp.singleImageId || 'hero-bg-04',
              selectedImageIds: grp.selectedImageIds || [],
              visualOverrides: grp.visualOverrides || null,
              routeKey: 'group:' + gid
            };
          }
        } catch (e) {}
      }
    }

    // Fallback to Global Defaults
    return {
      name: 'Default Page',
      route: route,
      category: 'other',
      enabled: settings.globalDefaults ? settings.globalDefaults.enabled : true,
      mode: settings.globalDefaults ? settings.globalDefaults.mode : 'global',
      singleImageId: settings.globalDefaults ? settings.globalDefaults.singleImageId : 'hero-bg-01',
      selectedImageIds: settings.globalDefaults ? settings.globalDefaults.selectedImageIds : [],
      visualOverrides: null,
      routeKey: '*'
    };
  }

  // 9. RESOLVE IMAGE URL (From IndexedDB or Cloud / Fallback)
  async function resolveImageUrl(item, fallbackUrl) {
    if (!item) return fallbackUrl;
    if (item.storageType === 'indexeddb' && item.blobKey) {
      const dbUrl = await RRP_MediaStorage.getImage(item.blobKey);
      if (dbUrl) return dbUrl;
    }
    if (item.url && item.url.startsWith('indexeddb:')) {
      const id = item.url.replace('indexeddb:', '');
      const dbUrl = await RRP_MediaStorage.getImage(id);
      if (dbUrl) return dbUrl;
    }
    return item.url || fallbackUrl;
  }

  // 10. ATTACH OR CREATE BACKGROUND CONTAINER IN DOM
  function ensureBackgroundContainer(targetElement) {
    let container = document.getElementById('heroSlideshowContainer');
    if (container) return container;

    // Check if targetElement has a hero banner
    let host = targetElement;
    if (!host) {
      host = document.querySelector('[data-rrp-hero]') ||
             document.querySelector('main > section:first-of-type') ||
             document.querySelector('body > section:first-of-type') ||
             document.querySelector('section.py-12, section.py-16, section.py-8');
    }

    if (!host) {
      // Fallback: full-page fixed background
      container = document.createElement('div');
      container.id = 'heroSlideshowContainer';
      container.className = 'hero-slideshow-container fixed inset-0 z-0 overflow-hidden pointer-events-none select-none';
      document.body.insertBefore(container, document.body.firstChild);
    } else {
      // Ensure host is relative & overflow hidden
      if (!host.classList.contains('relative')) host.classList.add('relative');
      if (!host.classList.contains('overflow-hidden')) host.classList.add('overflow-hidden');

      // Ensure direct children of host have relative z-10 for sharpness
      Array.from(host.children).forEach(child => {
        if (!child.classList.contains('relative') && !child.classList.contains('absolute') && !child.classList.contains('fixed')) {
          child.classList.add('relative', 'z-10');
        }
      });

      container = document.createElement('div');
      container.id = 'heroSlideshowContainer';
      container.className = 'hero-slideshow-container absolute inset-0 z-0 overflow-hidden pointer-events-none select-none';
      host.insertBefore(container, host.firstChild);
    }

    // Build standard high-end DOM structure
    container.innerHTML = `
      <div id="heroSlideA" class="hero-slide-layer absolute inset-0 opacity-100 will-change-transform will-change-opacity"></div>
      <div id="heroSlideB" class="hero-slide-layer absolute inset-0 opacity-0 will-change-transform will-change-opacity"></div>
      <div id="heroBlurLayer" class="absolute inset-0 pointer-events-none" style="backdrop-filter: blur(var(--hero-blur, 2.5px)); -webkit-backdrop-filter: blur(var(--hero-blur, 2.5px));"></div>
      <div id="heroOverlayLayer" class="absolute inset-0 pointer-events-none" style="background: linear-gradient(to top, rgba(7, 10, 16, var(--hero-overlay-opacity, 0.65)), rgba(7, 10, 16, calc(var(--hero-overlay-opacity, 0.65) * 0.85)), rgba(7, 10, 16, calc(var(--hero-overlay-opacity, 0.65) * 0.65)));"></div>
      <div id="heroOverlaySideLayer" class="absolute inset-0 pointer-events-none" style="background: linear-gradient(to right, rgba(7, 10, 16, calc(var(--hero-overlay-opacity, 0.65) * 1.15)), rgba(7, 10, 16, calc(var(--hero-overlay-opacity, 0.65) * 0.75)), rgba(7, 10, 16, calc(var(--hero-overlay-opacity, 0.65) * 0.45)));"></div>
      <div id="heroGoldTintLayer" class="absolute inset-0 pointer-events-none" style="background: radial-gradient(circle at 35% 50%, rgba(197, 160, 89, var(--hero-gold-tint, 0.1)), transparent 75%);"></div>
      <div class="absolute inset-0 bg-jali-pattern opacity-15 pointer-events-none"></div>
      <div class="absolute inset-0 shadow-[inset_0_0_120px_rgba(7,10,16,0.9)] pointer-events-none"></div>
      <div id="heroSlideIndicator" class="absolute bottom-4 left-6 z-10 flex items-center gap-2 text-[10px] text-gold-400/80 font-mono tracking-wider pointer-events-auto bg-royal-950/80 px-2.5 py-1 rounded-full border border-gold-500/20 backdrop-blur-md">
        <span class="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse"></span>
        <span id="heroSlideCaption">Royal Rajasthan</span>
        <span class="text-white/30">|</span>
        <span id="heroSlideCounter">1 / 1</span>
      </div>
    `;

    return container;
  }

  // 11. APPLY RESPONSIVE CSS VARIABLES
  function applyVisualSettings(container, displaySettings, visualOverrides) {
    if (!container) return;
    const bp = getCurrentBreakpoint();
    const globalSettings = displaySettings.global;
    const dev = (displaySettings.devices && displaySettings.devices[bp] && displaySettings.devices[bp].enabled)
      ? displaySettings.devices[bp]
      : null;

    // Base settings
    let blur = dev ? dev.blur : globalSettings.blur;
    let brightness = (dev ? dev.brightness : globalSettings.brightness) / 100;
    let scale = (dev ? dev.scale : globalSettings.scale) / 100;
    let fit = dev ? dev.fit : globalSettings.fit;
    let pos = dev ? dev.position : globalSettings.position;
    let overlayOpacity = (dev ? dev.overlayOpacity : globalSettings.overlayOpacity) / 100;
    let goldTint = (globalSettings.goldTint || 10) / 100;
    let transDuration = (displaySettings.slideshow?.transitionDuration || 1.5) + 's';

    // Page-specific overrides take ultimate precedence
    if (visualOverrides) {
      if (visualOverrides.blur !== undefined) blur = visualOverrides.blur;
      if (visualOverrides.brightness !== undefined) brightness = visualOverrides.brightness / 100;
      if (visualOverrides.scale !== undefined) scale = visualOverrides.scale / 100;
      if (visualOverrides.fit !== undefined) fit = visualOverrides.fit;
      if (visualOverrides.position !== undefined) pos = visualOverrides.position;
      if (visualOverrides.overlayOpacity !== undefined) overlayOpacity = visualOverrides.overlayOpacity / 100;
      if (visualOverrides.goldTint !== undefined) goldTint = visualOverrides.goldTint / 100;
      if (visualOverrides.transitionDuration !== undefined) transDuration = visualOverrides.transitionDuration + 's';
    }

    container.style.setProperty('--hero-blur', blur + 'px');
    container.style.setProperty('--hero-brightness', brightness);
    container.style.setProperty('--hero-scale', scale);
    container.style.setProperty('--hero-fit', fit);
    container.style.setProperty('--hero-pos', pos);
    container.style.setProperty('--hero-overlay-opacity', overlayOpacity);
    container.style.setProperty('--hero-gold-tint', goldTint);
    container.style.setProperty('--hero-trans-duration', transDuration);
  }

  // 12. RUNTIME ENGINE
  let slideshowTimer = null;
  let activeSlideIndex = 0;
  let isLayerAActive = true;
  let activeSlides = [];

  async function initPageBackground() {
    injectBackgroundStyles();

    const pageConfig = resolvePageConfig(window.location.pathname);

    // If disabled, remove or hide container and exit
    if (!pageConfig.enabled || pageConfig.mode === 'disabled') {
      const existing = document.getElementById('heroSlideshowContainer');
      if (existing) existing.style.display = 'none';
      return;
    }

    const displaySettings = getGlobalDisplaySettings();
    const allBackgrounds = getAllHeroBackgrounds();
    const container = ensureBackgroundContainer();
    if (!container) return;
    container.style.display = '';

    // Apply visual variables
    applyVisualSettings(container, displaySettings, pageConfig.visualOverrides);

    // Window resize debounced listener
    let resizeTimer;
    window.addEventListener('resize', () => {
      clearTimeout(resizeTimer);
      resizeTimer = setTimeout(() => {
        applyVisualSettings(container, displaySettings, pageConfig.visualOverrides);
      }, 150);
    });

    // Resolve slides to show based on mode
    let targetSlides = [];
    if (pageConfig.mode === 'single') {
      const match = allBackgrounds.find(b => b.id === pageConfig.singleImageId) || allBackgrounds[0];
      targetSlides = [match];
    } else if (pageConfig.mode === 'custom' && Array.isArray(pageConfig.selectedImageIds) && pageConfig.selectedImageIds.length > 0) {
      targetSlides = pageConfig.selectedImageIds
        .map(id => allBackgrounds.find(b => b.id === id))
        .filter(Boolean);
      if (targetSlides.length === 0) {
        targetSlides = allBackgrounds.filter(b => b.isEnabled !== false);
      }
    } else {
      // Global Default: all enabled backgrounds
      targetSlides = allBackgrounds.filter(b => b.isEnabled !== false);
      if (targetSlides.length === 0) targetSlides = allBackgrounds.slice(0, 5);
    }

    activeSlides = targetSlides;
    if (activeSlides.length === 0) return;

    const layerA = document.getElementById('heroSlideA');
    const layerB = document.getElementById('heroSlideB');
    const captionEl = document.getElementById('heroSlideCaption');
    const counterEl = document.getElementById('heroSlideCounter');
    const fallbackUrl = displaySettings.slideshow.fallbackUrl || DEFAULT_HERO_DISPLAY_SETTINGS.slideshow.fallbackUrl;

    // Preload image with safe error fallback
    function loadImageSafely(url) {
      return new Promise((resolve) => {
        const img = new Image();
        img.onload = () => resolve(url);
        img.onerror = () => {
          console.warn('Hero background image failed to load, falling back to default:', url);
          resolve(fallbackUrl);
        };
        img.src = url;
      });
    }

    // Set first slide
    activeSlideIndex = 0;
    const firstSlide = activeSlides[0];
    const resolvedFirstUrl = await resolveImageUrl(firstSlide, fallbackUrl);
    const verifiedFirstUrl = await loadImageSafely(resolvedFirstUrl);

    if (layerA) {
      layerA.style.backgroundImage = `url('${verifiedFirstUrl}')`;
      layerA.classList.remove('opacity-0');
      layerA.classList.add('opacity-100');
      if (displaySettings.slideshow.kenBurns) {
        layerA.classList.add('is-zoomed');
      } else {
        layerA.classList.add('no-zoom');
      }
    }
    if (layerB) {
      layerB.classList.remove('opacity-100');
      layerB.classList.add('opacity-0');
    }

    if (captionEl) captionEl.textContent = firstSlide.title || 'Rajasthan Estate';
    if (counterEl) counterEl.textContent = `1 / ${activeSlides.length}`;

    // If only 1 slide or autoPlay disabled, do not start timer
    if (activeSlides.length <= 1 || displaySettings.slideshow.autoPlay === false) {
      return;
    }

    // Slideshow crossfade loop
    if (slideshowTimer) clearInterval(slideshowTimer);
    const intervalMs = Math.max(3, displaySettings.slideshow.duration || 6) * 1000;

    slideshowTimer = setInterval(async () => {
      activeSlideIndex = (activeSlideIndex + 1) % activeSlides.length;
      const nextSlide = activeSlides[activeSlideIndex];
      const rawUrl = await resolveImageUrl(nextSlide, fallbackUrl);
      const safeUrl = await loadImageSafely(rawUrl);

      const incoming = isLayerAActive ? layerB : layerA;
      const outgoing = isLayerAActive ? layerA : layerB;

      if (incoming && outgoing) {
        incoming.style.backgroundImage = `url('${safeUrl}')`;

        if (displaySettings.slideshow.kenBurns) {
          incoming.classList.remove('is-zoomed', 'no-zoom');
          void incoming.offsetWidth;
          incoming.classList.add('is-zoomed');
        } else {
          incoming.classList.add('no-zoom');
        }

        if (!displaySettings.slideshow.crossfade) {
          incoming.classList.add('no-crossfade');
          outgoing.classList.add('no-crossfade');
        } else {
          incoming.classList.remove('no-crossfade');
          outgoing.classList.remove('no-crossfade');
        }

        incoming.classList.remove('opacity-0');
        incoming.classList.add('opacity-100');
        outgoing.classList.remove('opacity-100');
        outgoing.classList.add('opacity-0');

        isLayerAActive = !isLayerAActive;

        if (captionEl) captionEl.textContent = nextSlide.title || 'Rajasthan Estate';
        if (counterEl) counterEl.textContent = `${activeSlideIndex + 1} / ${activeSlides.length}`;
      }
    }, intervalMs);
  }

  // Public API on window
  window.RRP_PageBackground = {
    init: initPageBackground,
    getSettings: getPageBackgroundSettings,
    resolvePageConfig: resolvePageConfig,
    DEFAULT_PAGE_BACKGROUND_SETTINGS: DEFAULT_PAGE_BACKGROUND_SETTINGS,
    DEFAULT_HERO_DISPLAY_SETTINGS: DEFAULT_HERO_DISPLAY_SETTINGS,
    DEFAULT_HERO_BACKGROUNDS: DEFAULT_HERO_BACKGROUNDS
  };

  // Run on DOM ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initPageBackground);
  } else {
    initPageBackground();
  }
})();
