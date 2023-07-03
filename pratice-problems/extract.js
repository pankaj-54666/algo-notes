const fs = require("fs");

function extractLinesFromFile(filename) {
    filename="data.cpp"
 //   console.log("FILE_NAME: ",filename);

  // Read the file content
  const content = fs.readFileSync(filename, "utf-8");
//   console.log("Content is: ",content);

  // Split the content into an array of lines
  const lines = content.split("\n");

  let functionFound = false;
  let functionName = "findAns";

  let functionBody="";
  let bcount = 0;

  for (let i = 0; i < lines.length; i++) {
    let line = lines[i];
    // console.log(line);

    if (line.includes(functionName)) {
      functionFound = true;
    }
    
    if(bcount == 0 && functionFound == true)
    {
        functionBody += line + "\n";
        if(line.includes("{")) bcount++;
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
}

// Usage: Pass the filename of the text file as a command-line argument
const filename = process.argv[2];

const main=()=>{
    const functionBody = extractLinesFromFile(filename);
    console.log(functionBody);
}



main();