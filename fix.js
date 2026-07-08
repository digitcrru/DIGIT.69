const fs = require('fs');
let c = fs.readFileSync('C:/Users/Jenn1817/Downloads/digit_crru_frontend/app.js', 'utf8');

c = c.replace(
    /window\.showToast\('แต้งกิ้วนะ ถ้าไม่มีเธอ\.\.\.ก็คงต้องหาคนอื่นช่วย 😜', 'success'\);/g,
    window.showToast('ลงทะเบียนสำเร็จ!', 'success', { actionLabel: 'ดูประวัติ', actionFn: () => navigate('history') });
);

c = c.replace(
    /window\.apiCall\('POST', pL\)\.then\(\(\) => \{ window\.showToast\('[^']+', 'success'\); window\.navigate\('events'\); \}\)/g,
    window.apiCall('POST', pL).then(() => { window.showToast('แต้งกิ้วนะ ถ้าไม่มีเธอ...ก็คงต้องหาคนอื่นช่วย 😜', 'success'); window.navigate('events'); })
);

fs.writeFileSync('C:/Users/Jenn1817/Downloads/digit_crru_frontend/app.js', c, 'utf8');
console.log('Done!');
