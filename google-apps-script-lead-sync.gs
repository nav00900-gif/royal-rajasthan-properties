/**
 * =========================================================================
 * ROYAL RAJASTHAN PROPERTIES - GOOGLE SHEETS LIVE LEAD AUTO-SYNC ENGINE
 * =========================================================================
 * 
 * SETUP INSTRUCTIONS (Takes only 2 minutes):
 * 1. Open Google Sheets (https://sheets.new) and name it:
 *    "Royal Rajasthan Properties - Leads Master"
 * 2. In Google Sheets top menu, click: "Extensions" -> "Apps Script"
 * 3. Delete any default code in Code.gs, and PASTE this entire script.
 * 4. Click the blue "Deploy" button (top right) -> Select "New deployment".
 * 5. Choose Type: "Web app" (click gear icon next to Select type).
 * 6. Set Description: "Royal Rajasthan Leads Sync v1"
 *    - Execute as: "Me (your email)"
 *    - Who has access: "Anyone" (CRITICAL: Select "Anyone" so website can post leads)
 * 7. Click "Deploy", authorize Google permissions if asked, and COPY the Web App URL.
 * 8. Open your Royal Rajasthan Admin Portal (https://royalrajasthanproperties.com/admin/)
 *    -> Go to "Settings" tab -> Paste Web App URL in "Google Sheets Webhook URL" -> Save!
 * 
 * That's it! Every lead from website, mobile visitors, and project pages will now:
 * - Automatically appear in your Google Sheet in real time with luxury formatting.
 * - Have a 1-click "Chat on WhatsApp" link for every buyer.
 * - Trigger an instant email notification to nav00900@gmail.com with high priority!
 */

function doPost(e) {
  try {
    var ss = SpreadsheetApp.getActiveSpreadsheet();
    var sheet = ss.getActiveSheet();
    
    // Rename default sheet tab if needed
    if (sheet.getName() === "Sheet1") {
      sheet.setName("Website Leads");
    }
    
    // If sheet is empty, set up luxury Royal Rajasthan headers
    if (sheet.getLastRow() === 0) {
      var headers = [
        "Timestamp (IST)",
        "Client Name",
        "Phone / Mobile",
        "WhatsApp Click Link",
        "Email",
        "Property Interest",
        "Property Type",
        "Preferred Location",
        "Budget",
        "Callback / Site Visit",
        "Client Message / Requirements",
        "Lead Source",
        "Page URL",
        "Lead Status"
      ];
      sheet.appendRow(headers);
      
      // Luxury styling: Navy Blue background (#0b0f19) with Gold text (#d5b77c)
      var headerRange = sheet.getRange(1, 1, 1, headers.length);
      headerRange.setBackground("#0b0f19");
      headerRange.setFontColor("#d5b77c");
      headerRange.setFontWeight("bold");
      headerRange.setFontSize(10);
      headerRange.setFontFamily("Arial");
      sheet.setRowHeight(1, 35);
      sheet.setFrozenRows(1);
    }
    
    // Parse incoming payload
    var data = {};
    if (e && e.postData && e.postData.contents) {
      try {
        data = JSON.parse(e.postData.contents);
      } catch (jsonErr) {
        data = e.parameter || {};
      }
    } else if (e && e.parameter) {
      data = e.parameter;
    }
    
    // Extract & format fields
    var nowStr = Utilities.formatDate(new Date(), "Asia/Kolkata", "dd-MMM-yyyy hh:mm:ss a");
    var clientName = data.name || data.Client_Name || "Valued Client";
    var rawPhone = "" + (data.phone || data.Phone_WhatsApp || data.Phone || "");
    var cleanPhone = rawPhone.replace(/[^0-9]/g, "");
    if (cleanPhone.length === 10) cleanPhone = "91" + cleanPhone;
    
    var waLinkFormula = cleanPhone ? '=HYPERLINK("https://wa.me/' + cleanPhone + '", "💬 Chat on WhatsApp")' : "N/A";
    var email = data.email || data.Email_Address || data.Email || "Not Provided";
    var project = data.projectInterest || data.project || data.Project_Name || "General Portfolio";
    var propType = data.propertyType || data.unitType || data.Unit_Type || "Residential";
    var location = data.locationPreference || data.location || data.Location_Preference || "Jaipur";
    var budget = data.budget || data.Budget || "Flexible";
    var callback = data.preferredCallbackTime || data.visitDate || data.Preferred_Callback || "Immediate";
    var message = data.message || data.Client_Message || data.Message || "";
    var source = data.leadSource || data.Source || "Website Lead Form";
    var pageUrl = data.pageUrl || data.Page_URL || "";
    var status = data.leadStatus || "New";
    
    // Append lead to spreadsheet
    sheet.appendRow([
      nowStr,
      clientName,
      rawPhone ? "'" + rawPhone : "",
      waLinkFormula,
      email,
      project,
      propType,
      location,
      budget,
      callback,
      message,
      source,
      pageUrl,
      status
    ]);
    
    // Format the newly appended row
    var lastRow = sheet.getLastRow();
    sheet.setRowHeight(lastRow, 28);
    var rowRange = sheet.getRange(lastRow, 1, 1, 14);
    rowRange.setFontFamily("Arial");
    rowRange.setFontSize(9);
    rowRange.setVerticalAlignment("middle");
    
    // Color status cell
    var statusCell = sheet.getRange(lastRow, 14);
    statusCell.setBackground("#ecfdf5");
    statusCell.setFontColor("#065f46");
    statusCell.setFontWeight("bold");
    
    // Auto-fit columns nicely (up to column 14)
    for (var c = 1; c <= 14; c++) {
      if (c !== 11 && c !== 13) { // keep message and url columns reasonable
        sheet.autoResizeColumn(c);
      }
    }
    
    // Send Instant Push Email Notification to Navratan Kumawat
    try {
      var emailSubject = "🚨 New Lead: " + clientName + " (" + (rawPhone || "No Phone") + ") - " + project;
      var emailBody = "👑 ROYAL RAJASTHAN PROPERTIES - NEW LEAD CAPTURED\n" +
                      "====================================================\n\n" +
                      "👤 Client Name: " + clientName + "\n" +
                      "📞 Phone Number: " + rawPhone + "\n" +
                      "💬 WhatsApp Link: https://wa.me/" + cleanPhone + "\n" +
                      "🏢 Project: " + project + "\n" +
                      "🏷️ Property Type: " + propType + "\n" +
                      "📍 Location: " + location + "\n" +
                      "💰 Budget: " + budget + "\n" +
                      "📅 Preferred Callback / Visit: " + callback + "\n" +
                      "📝 Client Note: " + message + "\n" +
                      "🌐 Lead Source: " + source + "\n\n" +
                      "====================================================\n" +
                      "✅ This lead has been recorded in your Google Sheet automatically.\n" +
                      "You can tap the WhatsApp link above to message the client directly.";
                      
      MailApp.sendEmail("nav00900@gmail.com", emailSubject, emailBody);
    } catch (mailErr) {
      // Continue even if mail limit is reached
    }
    
    return ContentService.createTextOutput(JSON.stringify({ 
      status: "success", 
      id: data.id || Date.now(),
      message: "Lead recorded in Google Sheet successfully" 
    })).setMimeType(ContentService.MimeType.JSON);
    
  } catch (err) {
    return ContentService.createTextOutput(JSON.stringify({ 
      status: "error", 
      message: err.toString() 
    })).setMimeType(ContentService.MimeType.JSON);
  }
}

function doGet(e) {
  return ContentService.createTextOutput(JSON.stringify({ 
    status: "active", 
    service: "Royal Rajasthan Properties Lead Sync Webhook",
    timestamp: new Date().toISOString()
  })).setMimeType(ContentService.MimeType.JSON);
}
