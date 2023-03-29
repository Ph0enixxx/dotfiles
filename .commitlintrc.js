// Function: create a text file with utf8 encoding
// Parameters: filename
// Return: a file with utf8 encoding 
function createFile(filename) {
    // create a file with utf8 encoding
    var file = new File(filename, 'utf8');
    // write the content to the file
    file.write(JSON.stringify(config));
    // close the file
    file.close();
}

