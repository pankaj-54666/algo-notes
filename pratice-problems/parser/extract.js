export function extractFunction(fd,functionName) {
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