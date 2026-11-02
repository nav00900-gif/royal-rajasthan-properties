/**
 * ROYAL RAJASTHAN PROPERTIES
 * Centralized Lead Auto-Sync & Google Sheets Webhook Engine
 * 
 * Features:
 * 1. Synchronizes leads seamlessly across rrp_crm_leads and royal_rajasthan_leads_v1
 * 2. Instant Google Sheets Webhook transmission with retry, keepalive and sendBeacon
 * 3. Instant WhatsApp alert URL generation with luxury formatted message
 * 4. Backup dispatch via FormSubmit to nav00900@gmail.com
 * 5. Meta Pixel Lead event firing
 */
(function() {
  'use strict';

  var STORAGE_KEY_MAIN = 'rrp_crm_leads';
  var STORAGE_KEY_LEGACY = 'royal_rajasthan_leads_v1';
  var WEBHOOK_KEY_MAIN = 'rrp_google_sheets_webhook';
  var WEBHOOK_KEY_LEGACY = 'royal_rajasthan_sheets_webhook_v1';
  var LATEST_INQUIRY_KEY = 'rrp_latest_inquiry';
  var ADMIN_PHONE = '9461812342';
  var ADMIN_EMAIL = 'nav00900@gmail.com';

  // Fallback production webhook URL (can be customized via Admin Portal)
  var DEFAULT_WEBHOOK_URL = '';

  var RRP_Leads = {
    getWebhookUrl: function() {
      try {
        return localStorage.getItem(WEBHOOK_KEY_MAIN) || 
               localStorage.getItem(WEBHOOK_KEY_LEGACY) || 
               window.RRP_DEFAULT_SHEETS_WEBHOOK || 
               DEFAULT_WEBHOOK_URL || '';
      } catch (e) {
        return DEFAULT_WEBHOOK_URL || '';
      }
    },

    setWebhookUrl: function(url) {
      var clean = (url || '').trim();
      try {
        if (clean) {
          localStorage.setItem(WEBHOOK_KEY_MAIN, clean);
          localStorage.setItem(WEBHOOK_KEY_LEGACY, clean);
        } else {
          localStorage.removeItem(WEBHOOK_KEY_MAIN);
          localStorage.removeItem(WEBHOOK_KEY_LEGACY);
        }
      } catch (e) {
        console.warn('Unable to persist webhook URL:', e);
      }
      return clean;
    },

    getLeads: function() {
      try {
        var leads1 = JSON.parse(localStorage.getItem(STORAGE_KEY_MAIN) || '[]');
        var leads2 = JSON.parse(localStorage.getItem(STORAGE_KEY_LEGACY) || '[]');
        var map = {};
        var merged = [];
        leads1.concat(leads2).forEach(function(l) {
          if (!l) return;
          var key = l.id || (l.phone + '_' + (l.timestamp || l.createdAt || ''));
          if (!map[key]) {
            map[key] = true;
            merged.push(l);
          }
        });
        merged.sort(function(a, b) {
          var tA = a.timestamp || (a.createdAt ? new Date(a.createdAt).getTime() : 0);
          var tB = b.timestamp || (b.createdAt ? new Date(b.createdAt).getTime() : 0);
          return tB - tA;
        });
        return merged;
      } catch (e) {
        console.warn('Error reading leads:', e);
        return [];
      }
    },

    saveLeadLocally: function(lead) {
      try {
        var leads = this.getLeads();
        var existingIdx = leads.findIndex(function(x) { return x.id === lead.id; });
        if (existingIdx !== -1) {
          leads[existingIdx] = lead;
        } else {
          leads.unshift(lead);
        }
        localStorage.setItem(STORAGE_KEY_MAIN, JSON.stringify(leads));
        localStorage.setItem(STORAGE_KEY_LEGACY, JSON.stringify(leads));
      } catch (e) {
        console.warn('Error saving lead locally:', e);
      }

      try {
        sessionStorage.setItem(LATEST_INQUIRY_KEY, JSON.stringify(lead));
        localStorage.setItem(LATEST_INQUIRY_KEY, JSON.stringify(lead));
      } catch (e) {}
    },

    dispatchToGoogleSheets: function(lead) {
      var webhook = this.getWebhookUrl();
      if (!webhook || !webhook.startsWith('http')) {
        console.info('Google Sheets Webhook not configured or invalid:', webhook);
        return Promise.resolve({ status: 'no_webhook' });
      }

      var cleanPhone = (lead.phone || '').replace(/[^0-9]/g, '');
      if (cleanPhone.length === 10) cleanPhone = '91' + cleanPhone;

      var payload = {
        id: lead.id || ('lead-' + Date.now()),
        timestamp: new Date().toLocaleString('en-IN', { timeZone: 'Asia/Kolkata' }),
        name: lead.name || 'Anonymous Client',
        phone: lead.phone || '',
        whatsAppUrl: cleanPhone ? ('https://wa.me/' + cleanPhone) : '',
        email: lead.email || 'Not Provided',
        projectInterest: lead.projectInterest || lead.project || 'General Portfolio',
        propertyType: lead.propertyType || lead.unitType || 'Residential',
        locationPreference: lead.locationPreference || lead.location || 'Jaipur',
        budget: lead.budget || 'Flexible',
        preferredCallbackTime: lead.preferredCallbackTime || lead.visitDate || 'Immediate Callback',
        message: lead.message || '',
        leadSource: lead.leadSource || 'Website Form',
        pageUrl: lead.pageUrl || window.location.href,
        leadStatus: lead.leadStatus || 'New'
      };

      var payloadStr = JSON.stringify(payload);

      var fetchPromise = fetch(webhook, {
        method: 'POST',
        mode: 'no-cors',
        keepalive: true,
        headers: { 'Content-Type': 'application/json' },
        body: payloadStr
      }).catch(function(err) {
        console.warn('Google Sheets fetch warning:', err);
        return null;
      });

      try {
        if (navigator.sendBeacon) {
          var blob = new Blob([payloadStr], { type: 'text/plain;charset=UTF-8' });
          navigator.sendBeacon(webhook, blob);
        }
      } catch (e) {}

      return fetchPromise;
    },

    dispatchBackupEmail: function(lead) {
      try {
        var emailBody = {
          _subject: '🚨 New Lead: ' + (lead.name || 'Client') + ' (' + (lead.phone || 'No phone') + ') - ' + (lead.projectInterest || 'Portfolio'),
          Client_Name: lead.name || 'Anonymous',
          Phone_WhatsApp: lead.phone || '',
          Email: lead.email || 'Not Provided',
          Project_Interest: lead.projectInterest || 'General Portfolio',
          Property_Type: lead.propertyType || 'Residential',
          Location_Preference: lead.locationPreference || 'Jaipur',
          Budget: lead.budget || 'Flexible',
          Preferred_Callback: lead.preferredCallbackTime || 'Immediate',
          Message: lead.message || 'None',
          Source: lead.leadSource || 'Website Form',
          Page_URL: lead.pageUrl || window.location.href
        };

        return fetch('https://formsubmit.co/ajax/' + ADMIN_EMAIL, {
          method: 'POST',
          keepalive: true,
          headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
          body: JSON.stringify(emailBody)
        }).catch(function() { return null; });
      } catch (e) {
        return Promise.resolve(null);
      }
    },

    trackMetaLead: function(lead) {
      if (typeof window.fbq === 'function') {
        try {
          window.fbq('track', 'Lead', {
            content_name: lead.projectInterest || 'Real Estate Inquiry',
            content_category: lead.propertyType || 'Real Estate',
            currency: 'INR'
          });
        } catch (e) {}
      }
    },

    formatWhatsAppMessage: function(lead) {
      var lines = [
        '👑 *NEW LEAD - ROYAL RAJASTHAN PROPERTIES*',
        '---------------------------------------',
        '👤 *Client:* ' + (lead.name || 'Valued Buyer'),
        '📞 *Phone:* ' + (lead.phone || 'N/A'),
        '🏢 *Project:* ' + (lead.projectInterest || 'General Inquiry'),
        '🏷️ *Type:* ' + (lead.propertyType || 'Residential'),
        '📍 *Location:* ' + (lead.locationPreference || 'Jaipur'),
        '💰 *Budget:* ' + (lead.budget || 'Standard'),
        '📅 *Callback / Visit:* ' + (lead.preferredCallbackTime || 'Immediate'),
        lead.message ? ('💬 *Note:* ' + lead.message) : '',
        '🌐 *Source:* ' + (lead.leadSource || 'Website Form'),
        '---------------------------------------',
        '🔗 *URL:* ' + (lead.pageUrl || window.location.href)
      ].filter(Boolean);
      return lines.join('\n');
    },

    getAdminWhatsAppLink: function(lead) {
      var msg = this.formatWhatsAppMessage(lead);
      return 'https://wa.me/91' + ADMIN_PHONE + '?text=' + encodeURIComponent(msg);
    },

    getClientWhatsAppLink: function(lead) {
      var name = lead.name || '';
      var project = lead.projectInterest || lead.project || 'Royal Rajasthan Properties';
      var text = 'Hello Navratan ji, I have submitted an inquiry on your website.\n' +
                 (name ? ('*Name:* ' + name + '\n') : '') +
                 (lead.phone ? ('*Phone:* ' + lead.phone + '\n') : '') +
                 '*Project:* ' + project + '\n' +
                 '*Budget:* ' + (lead.budget || 'Flexible') + '\n' +
                 'Please share project brochure, price list & JDA layout.';
      return 'https://wa.me/91' + ADMIN_PHONE + '?text=' + encodeURIComponent(text);
    },

    getClientDirectChatLink: function(lead) {
      var cleanPhone = (lead.phone || '').replace(/[^0-9]/g, '');
      if (cleanPhone.length === 10) cleanPhone = '91' + cleanPhone;
      var name = lead.name || 'Sir';
      var project = lead.projectInterest || lead.project || 'our luxury projects';
      var text = 'Hello ' + name + ' ji, Namaste from Royal Rajasthan Properties Jaipur. ' +
                 'Regarding your enquiry for ' + project + ', I have your requested details and brochure ready to share with you.';
      return 'https://wa.me/' + cleanPhone + '?text=' + encodeURIComponent(text);
    },

    buildThankYouUrl: function(lead) {
      var params = new URLSearchParams();
      if (lead.id) params.set('ref', lead.id);
      if (lead.name) params.set('name', lead.name);
      if (lead.phone) params.set('phone', lead.phone);
      if (lead.projectInterest) params.set('project', lead.projectInterest);
      if (lead.budget) params.set('budget', lead.budget);
      if (lead.locationPreference) params.set('location', lead.locationPreference);
      if (lead.preferredCallbackTime) params.set('time', lead.preferredCallbackTime);
      params.set('wa', '1');
      return '/thank-you.html?' + params.toString();
    },

    submitLead: async function(rawLead) {
      var lead = Object.assign({}, rawLead);
      lead.id = lead.id || ('rrp-' + Date.now());
      lead.timestamp = lead.timestamp || Date.now();
      lead.createdAt = lead.createdAt || new Date().toISOString();
      lead.updatedAt = lead.updatedAt || new Date().toISOString();
      lead.leadStatus = lead.leadStatus || 'New';
      lead.pageUrl = lead.pageUrl || window.location.href;

      this.saveLeadLocally(lead);
      this.trackMetaLead(lead);

      var sheetsPromise = this.dispatchToGoogleSheets(lead);
      var emailPromise = this.dispatchBackupEmail(lead);

      try {
        await Promise.race([
          Promise.all([sheetsPromise, emailPromise]),
          new Promise(function(resolve) { setTimeout(resolve, 1400); })
        ]);
      } catch (e) {}

      return lead;
    }
  };

  window.RRP_Leads = RRP_Leads;
})();
