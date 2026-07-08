import re

with open('C:\\Users\\Jenn1817\\.gemini\\antigravity\\scratch\\digit_crru\\index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update status parsing (add lat/lng)
content = content.replace(
    '''                        // SYNC: ดึงสถานะใบประกาศนียบัตรที่ฝังมาในสถานะ (ส่วนที่ 4 ของ pipe |)
                        if (stParts.length > 3) {
                            i.certEnabled = stParts[3] === 'true';
                        } else if (i.certEnabled !== undefined && i.certEnabled !== null && i.certEnabled !== "") {
                            i.certEnabled = (i.certEnabled === true || String(i.certEnabled).toLowerCase() === 'true');
                        } else {
                            i.certEnabled = certEventStatus[i.id] === true;
                        }
                        
                        // อัปเดต Object หลักเพื่อใช้แสดงผลในส่วนอื่นๆ โดยไม่ต้องกลัวโดนทับ''',
    '''                        // SYNC: ดึงสถานะใบประกาศนียบัตรที่ฝังมาในสถานะ (ส่วนที่ 4 ของ pipe |)
                        if (stParts.length > 3) {
                            i.certEnabled = stParts[3] === 'true';
                        } else if (i.certEnabled !== undefined && i.certEnabled !== null && i.certEnabled !== "") {
                            i.certEnabled = (i.certEnabled === true || String(i.certEnabled).toLowerCase() === 'true');
                        } else {
                            i.certEnabled = certEventStatus[i.id] === true;
                        }
                        
                        i.lat = stParts.length > 4 ? stParts[4] : '';
                        i.lng = stParts.length > 5 ? stParts[5] : '';
                        
                        // อัปเดต Object หลักเพื่อใช้แสดงผลในส่วนอื่นๆ โดยไม่ต้องกลัวโดนทับ'''
)

# 2. Add GPS Helpers
content = content.replace(
    '''            return `${d.getDate()} ${m[d.getMonth()]} ${d.getFullYear() + 543}${withTime ? ` ${String(d.getHours()).padStart(2,'0')}:${String(d.getMinutes()).padStart(2,'0')}` : ''}`;
        };''',
    '''            return `${d.getDate()} ${m[d.getMonth()]} ${d.getFullYear() + 543}${withTime ? ` ${String(d.getHours()).padStart(2,'0')}:${String(d.getMinutes()).padStart(2,'0')}` : ''}`;
        };
        
        window.getCurrentAdminLocation = function(latId, lngId) {
            if (navigator.geolocation) {
                const btn = event.currentTarget;
                const txt = btn.innerHTML;
                btn.innerHTML = '<i class="ph-bold ph-spinner animate-spin"></i> รอสักครู่...';
                btn.disabled = true;
                navigator.geolocation.getCurrentPosition(function(position) {
                    document.getElementById(latId).value = position.coords.latitude;
                    document.getElementById(lngId).value = position.coords.longitude;
                    window.showToast('ดึงพิกัด GPS สำเร็จ', 'success');
                    btn.innerHTML = txt; btn.disabled = false;
                }, function(error) {
                    window.showToast('ไม่สามารถดึงพิกัดได้ (โปรดอนุญาต GPS)', 'error');
                    btn.innerHTML = txt; btn.disabled = false;
                }, { enableHighAccuracy: true });
            } else {
                window.showToast('เบราว์เซอร์ไม่รองรับ GPS', 'error');
            }
        };

        window.getDistanceFromLatLonInMeters = function(lat1, lon1, lat2, lon2) {
            const R = 6371e3;
            const phi1 = lat1 * Math.PI/180;
            const phi2 = lat2 * Math.PI/180;
            const deltaPhi = (lat2-lat1) * Math.PI/180;
            const deltaLambda = (lon2-lon1) * Math.PI/180;
            const a = Math.sin(deltaPhi/2) * Math.sin(deltaPhi/2) +
                      Math.cos(phi1) * Math.cos(phi2) *
                      Math.sin(deltaLambda/2) * Math.sin(deltaLambda/2);
            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
            return R * c;
        };'''
)

# 3. Add lat/lng populating to openEditEventModal
content = content.replace(
    '''            document.getElementById('edit-event-date').value = parsedDate; 
            document.getElementById('edit-event-location').value = e.location; 
            document.getElementById('editEventModal').classList.remove('hidden');''',
    '''            document.getElementById('edit-event-date').value = parsedDate; 
            document.getElementById('edit-event-location').value = e.location; 
            document.getElementById('edit-event-lat').value = e.lat || ''; 
            document.getElementById('edit-event-lng').value = e.lng || ''; 
            document.getElementById('editEventModal').classList.remove('hidden');'''
)

# 4. Add GPS check in handleRegistrationSubmit
content = content.replace(
    '''            if (evO) {
                const now = new Date();''',
    '''            if (evO) {
                if (evO.lat && evO.lng) {
                    if (!navigator.geolocation) {
                        window.showToast('เบราว์เซอร์ไม่รองรับ GPS ไม่สามารถเช็คชื่อได้', 'error');
                        return;
                    }
                    try {
                        const position = await new Promise((resolve, reject) => {
                            navigator.geolocation.getCurrentPosition(resolve, reject, { enableHighAccuracy: true, timeout: 10000 });
                        });
                        const dist = window.getDistanceFromLatLonInMeters(
                            parseFloat(evO.lat), parseFloat(evO.lng),
                            position.coords.latitude, position.coords.longitude
                        );
                        if (dist > 150) { 
                            if (err) { err.innerHTML = 'คุณไม่ได้อยู่ในพื้นที่จัดกิจกรรม (ห่าง ' + Math.round(dist) + ' เมตร)'; err.classList.remove('hidden'); }
                            window.showToast('นอกพื้นที่กิจกรรม!', 'error');
                            return;
                        }
                    } catch(geoErr) {
                        if (err) { err.innerHTML = 'ไม่สามารถดึงพิกัดได้ โปรดเปิดใช้งานและอนุญาต GPS บนอุปกรณ์'; err.classList.remove('hidden'); }
                        window.showToast('ข้อผิดพลาด GPS', 'error');
                        return;
                    }
                }
                const now = new Date();'''
)

# 5. Add UI to Create Event Form
content = content.replace(
    '''                                <div><label class="block text-xs font-bold mb-2 text-slate-600">สถานที่ *</label><input type="text" id="new-event-location" required class="w-full px-5 py-3.5 rounded-2xl border border-slate-200 bg-white/80 focus:border-primary outline-none transition-all"></div>
                                <div class="mt-2 md:mt-0"><button type="submit" class="w-full px-6 py-3.5 bg-admin text-white font-bold rounded-2xl hover:bg-admin_hover transition-colors shadow-lg">สร้าง</button></div>''',
    '''                                <div><label class="block text-xs font-bold mb-2 text-slate-600">สถานที่ *</label><input type="text" id="new-event-location" required class="w-full px-5 py-3.5 rounded-2xl border border-slate-200 bg-white/80 focus:border-primary outline-none transition-all"></div>
                                <div class="mt-2 md:mt-0"><button type="submit" class="w-full px-6 py-3.5 bg-admin text-white font-bold rounded-2xl hover:bg-admin_hover transition-colors shadow-lg">สร้าง</button></div>
                            </div>
                            <div class="bg-white/50 border border-white shadow-sm rounded-2xl p-4 md:p-5 flex flex-col md:grid md:grid-cols-4 gap-4 items-end mt-2">
                                <div><label class="block text-xs font-bold mb-2 text-slate-600">ละติจูด (Lat)</label><input type="text" id="new-event-lat" class="w-full px-5 py-3.5 rounded-2xl border border-slate-200 bg-white/80 focus:border-primary outline-none transition-all" placeholder="(ไม่บังคับ)"></div>
                                <div><label class="block text-xs font-bold mb-2 text-slate-600">ลองจิจูด (Lng)</label><input type="text" id="new-event-lng" class="w-full px-5 py-3.5 rounded-2xl border border-slate-200 bg-white/80 focus:border-primary outline-none transition-all" placeholder="(ไม่บังคับ)"></div>
                                <div class="md:col-span-2"><button type="button" onclick="window.getCurrentAdminLocation('new-event-lat', 'new-event-lng')" class="w-full px-6 py-3.5 bg-blue-50 text-blue-600 font-bold rounded-2xl hover:bg-blue-100 transition-colors shadow-sm flex justify-center items-center gap-2"><i class="ph-bold ph-map-pin text-lg"></i> ดึงพิกัด GPS ปัจจุบัน</button></div>'''
)

# 6. Add UI to Edit Event Form
content = content.replace(
    '''                <div><label class="block text-sm font-bold mb-2">สถานที่</label><input type="text" id="edit-event-location" required class="w-full px-5 py-3.5 rounded-2xl border bg-slate-50 focus:border-primary focus:ring-4 focus:ring-primary/10 transition-all outline-none"></div>
                <button type="submit" class="w-full py-4 mt-4 rounded-2xl font-bold text-white btn-gradient flex items-center justify-center gap-2">บันทึกการแก้ไข</button>''',
    '''                <div><label class="block text-sm font-bold mb-2">สถานที่</label><input type="text" id="edit-event-location" required class="w-full px-5 py-3.5 rounded-2xl border bg-slate-50 focus:border-primary focus:ring-4 focus:ring-primary/10 transition-all outline-none"></div>
                <div class="grid grid-cols-2 gap-4">
                    <div><label class="block text-sm font-bold mb-2">ละติจูด (Lat)</label><input type="text" id="edit-event-lat" class="w-full px-5 py-3.5 rounded-2xl border bg-slate-50 focus:border-primary outline-none"></div>
                    <div><label class="block text-sm font-bold mb-2">ลองจิจูด (Lng)</label><input type="text" id="edit-event-lng" class="w-full px-5 py-3.5 rounded-2xl border bg-slate-50 focus:border-primary outline-none"></div>
                    <div class="col-span-2"><button type="button" onclick="window.getCurrentAdminLocation('edit-event-lat', 'edit-event-lng')" class="w-full py-3 bg-blue-50 text-blue-600 font-bold rounded-2xl border border-blue-100 hover:bg-blue-100 transition-colors flex items-center justify-center gap-2"><i class="ph-bold ph-map-pin text-lg"></i> ดึงพิกัด GPS ปัจจุบัน</button></div>
                </div>
                <button type="submit" class="w-full py-4 mt-4 rounded-2xl font-bold text-white btn-gradient flex items-center justify-center gap-2">บันทึกการแก้ไข</button>'''
)

# 7. Add lat/lng parsing in finalStatus
# 833:
content = content.replace("`${ev.status || 'open'}|${openT}|${closeT}|${certState}`", "`${ev.status || 'open'}|${openT}|${closeT}|${certState}|${ev.lat||''}|${ev.lng||''}`")
# 849:
content = content.replace("`${ev.status || 'open'}|||${certState}`", "`${ev.status || 'open'}|||${certState}|${ev.lat||''}|${ev.lng||''}`")
# 1522:
content = content.replace("`${ev.status || 'open'}|${ev.openTime || ''}|${ev.closeTime || ''}|${checked ? 'true' : 'false'}`", "`${ev.status || 'open'}|${ev.openTime || ''}|${ev.closeTime || ''}|${checked ? 'true' : 'false'}|${ev.lat||''}|${ev.lng||''}`")
# 2244:
content = content.replace("`open|${openT}|${closeT}|false`", "`open|${openT}|${closeT}|false|${document.getElementById('new-event-lat').value}|${document.getElementById('new-event-lng').value}`")
content = content.replace("'open|||false'", "`open|||false|${document.getElementById('new-event-lat').value}|${document.getElementById('new-event-lng').value}`")
# 2286:
content = content.replace("`${nS}|${e.openTime||''}|${e.closeTime||''}|${certState}`", "`${nS}|${e.openTime||''}|${e.closeTime||''}|${certState}|${e.lat||''}|${e.lng||''}`")
# 2308:
content = content.replace("`${event.status || 'open'}|${event.openTime || ''}|${event.closeTime || ''}|${certState}`", "`${event.status || 'open'}|${event.openTime || ''}|${event.closeTime || ''}|${certState}|${document.getElementById('edit-event-lat').value}|${document.getElementById('edit-event-lng').value}`")

with open('C:\\Users\\Jenn1817\\.gemini\\antigravity\\scratch\\digit_crru\\index.html', 'w', encoding='utf-8') as f:
    f.write(content)
print("Phase 1 Patched Successfully.")
