const fs = require("fs");

function extractFunction(fd,functionName) {
  try {
    const content = fd;

    const lines = content.split("\n");

    let functionFound = false;

    let functionBody = "";
    let bcount = 0;

    for (let i = 0; i < lines.length; i++) {
      let line = lines[i];
      // console.log(line);

      if (line.includes(functionName)) {
        functionFound = true;
      }

      if (bcount == 0 && functionFound == true) {
        functionBody += line + "\n";
        if (line.includes("{")) bcount++;
        continue;
      }

      // If the function has been found, append the line to the function body
      if (functionFound == true) {
        if (line.includes("{")) bcount++;
        if (line.includes("}")) bcount--;

        functionBody += line + "\n";
        if (bcount == 0) break;
      }
    } //for loop ends here

    // console.log("functionBody:\n",functionBody);
    return functionBody;
  } catch (e) {
    console.log("Exection occurred: ", e);
  }
}



const main = () => {

  // Usage: Pass the filename of the text file as a command-line argument
  // const args = process.argv[2];
  // console.log("args: ",args);

  const margs = require('minimist')(process.argv.slice(2));
  console.log("margs: ",margs);

  const inputFile = margs['inputFile'];
  const outputFile = margs['outputFile'];
  const functionName = margs['functionName']; //function to extract

  console.log("inputFile: ",inputFile, "   ", "outputFile: ",outputFile);


  // Step1: read input file
  const fd = fs.readFileSync(inputFile,"utf-8");

  const functionBody = extractFunction(fd,functionName);

  console.log("FUNCTION BODY: \n",functionBody);

  fs.writeFileSync(outputFile,functionBody,'utf-8');

  // const functionBody = extractFunction(inputFile,functionName);
  // console.log(functionBody);
};

main();
