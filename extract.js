const fs = require('fs');
const readline = require('readline');

async function processLineByLine() {
  const fileStream = fs.createReadStream('C:\\Users\\Jenn1817\\.gemini\\antigravity\\brain\\5bfc2a01-1949-4bc1-905f-ba767ed379aa\\.system_generated\\logs\\transcript_full.jsonl');

  const rl = readline.createInterface({
    input: fileStream,
    crlfDelay: Infinity
  });

  for await (const line of rl) {
    if (line.includes('"type":"USER_INPUT"')) {
      const obj = JSON.parse(line);
      if (obj.content.includes('const GOOGLE_SCRIPT_URL =')) {
        console.log("Found it!");
        // write to restored_app.js
        fs.writeFileSync('C:\\Users\\Jenn1817\\.gemini\\antigravity\\scratch\\restored_app.js', obj.content);
        break;
      }
    }
  }
}

processLineByLine();
