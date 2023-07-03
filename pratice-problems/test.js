

const main=()=>{

    console.log("CONSOLE LOG");

    // console.log("args:\n",process.argv); /* call example node test.js -e "first" "second"*/
    

    /* this is preferred*/
    var argv2 = require('minimist')(process.argv.slice(2)); /* call example: node test.js  --username="Pankaj" --email="email@gmail.com" */
    console.log("minimist log:",argv2);

    return "Hello Form JS, PANKAJ";
}

main();