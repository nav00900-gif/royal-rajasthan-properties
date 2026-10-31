/**
 * ROYAL RAJASTHAN PROPERTIES
 * Real Estate Live Catalog Synchronization Engine
 * Automatically merges custom projects created/edited in Admin Studio
 * with baseline catalogs across all website pages.
 */
(function() {
  'use strict';

  window.getMergedProperties = function(baseList) {
    var fallback = baseList || window.allProperties || window.verifiedCatalog || window.propertiesData || [];
    try {
      var deletedIds = JSON.parse(localStorage.getItem('rrp_deleted_projects') || '[]');
      var customProjects = JSON.parse(localStorage.getItem('rrp_custom_projects') || '[]');
      var overrides = JSON.parse(localStorage.getItem('rrp_project_overrides') || '{}');
      
      var overriddenBase = fallback.map(function(p) {
        return overrides[p.id] ? Object.assign({}, p, overrides[p.id]) : p;
      });

      var activeCustom = customProjects.filter(function(p) {
        if (p.isPublished === false) return false;
        var st = (p.status || '').toLowerCase();
        return !st.includes('draft') && !st.includes('unpublish');
      });

      var combined = activeCustom.concat(overriddenBase);

      return combined.filter(function(p) {
        if (deletedIds.indexOf(p.id) !== -1) return false;
        if (p.isPublished === false) return false;
        var st = (p.status || '').toLowerCase();
        return !st.includes('draft') && !st.includes('unpublish');
      });
    } catch (e) {
      console.warn('Projects sync fallback:', e);
      return fallback;
    }
  };
})();
