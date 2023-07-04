const fs = require('fs');

function extractFunctionsFromFile(filePath) {
  const fileContent = fs.readFileSync(filePath, 'utf-8');
  const functionRegex = /[\w\s]+[\*|\s]+([\w\d_]+)\s*\([^;]*\)\s*\{/g;
  const functions = [];
  let match;

  while ((match = functionRegex.exec(fileContent)) !== null) {
    const functionName = match[1];
    functions.push(functionName);
  }

  return functions;
}

// Example usage
const filePath = 'path/to/your/cpp/file.cpp';
const functions = extractFunctionsFromFile(filePath);
console.log('Extracted functions:', functions);