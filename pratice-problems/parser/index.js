const fs = require('fs');
const path  = require('path');


function extractFunctionsFromFile(filePath) {
    const fileContent = fs.readFileSync(filePath, 'utf-8');
    const functionRegex = /(?:^|\s)(?!if|while|for|switch)(?:\w+\s+){0,2}(?:(\w+)\s*)\([^;()]*\)\s*{/g;

    const functions = [];
    let match;
  
    while ((match = functionRegex.exec(fileContent)) !== null) {
      const functionName = match[1];
      functions.push(functionName);
    }
  
    return functions;
  }

const main = () =>{
    
    console.log("Starting Main\n");

    let fileList = []; //read all file list from directory

    const targetDirectory  = path.join(__dirname,"../code");
    console.log("targetDirectoyr: ",targetDirectory);

    fileList = fs.readdirSync(targetDirectory);
    fileList = fileList.filter(filename => filename.includes(".cpp")); //filter out .cpp file

    console.info("fileList: \n",fileList);

    for(let i=0;i<fileList.length;i++)
    {
        //(a) Read File Content
        //(b) Extract all functions
        //(c) Save all extracted function with specific name

        const fileName = fileList[i];
        const filePath = path.join(targetDirectory,"/",fileName);

        // const fd  = fs.readFileSync(filePath,'utf-8');
        const functionList = extractFunctionsFromFile(filePath);
        
        

        console.log("functionList: ",fileName,":",functionList);

        // break;
        
    }
}


main();