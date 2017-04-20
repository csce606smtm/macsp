function addQuestionField() {
 
    //create Date object
    var date = new Date();
 
    //get number of milliseconds since midnight Jan 1, 1970 
    //and use it for address key
    var mSec = date.getTime(); 
 
    //Replace 0 with milliseconds
    idAttributDataType =  "qsheet_questions_attributes_0_dataType".replace("0", mSec);
    nameAttributDataType = "qsheet[questions_attributes][0][dataType]".replace("0", mSec);
 
    idAttributContent = "qsheet_questions_attributes_0_content".replace("0", mSec);
    nameAttributContent = "qsheet[questions_attributes][0][content]".replace("0", mSec);
        
    //create <div> tag
    var divType = document.createElement("div");
    var divContent = document.createElement("div"); 
    
    divType.className = "col-sm-3"; 
    divContent.className = "col-sm-9"; 
    
 
    //create label for Type, set it's for attribute, 
    //and append it to <li> element
    var labelType = document.createElement("label");
    labelType.setAttribute("for", idAttributDataType);
    var typeLabelText = document.createTextNode("Question Type");
    labelType.appendChild(typeLabelText);
    divType.appendChild(labelType);
 
    //create input for Type, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputDataType = document.createElement("INPUT");
    inputDataType.className = "form-control"; 
    inputDataType.setAttribute("type", "text");
    inputDataType.setAttribute("id", idAttributDataType);
    inputDataType.setAttribute("name", nameAttributDataType);
    inputDataType.setAttribute("placeholder", "I or S"); 
    divType.appendChild(inputDataType);
 
    //create label for Content, set it's for attribute, 
    //and append it to <li> element
    var labelContent = document.createElement("label");
    labelContent.setAttribute("for", idAttributContent);
    var contentLabelText = document.createTextNode("Question");
    labelContent.appendChild(contentLabelText);
    divContent.appendChild(labelContent);
 
    //create input for Street, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputContent = document.createElement("INPUT");
    inputContent.className = "form-control"; 
    inputContent.setAttribute("type", "text");
    inputContent.setAttribute("id", idAttributContent);
    inputContent.setAttribute("name", nameAttributContent);
    inputContent.setAttribute("placeholder", "Enter question here"); 
    divContent.appendChild(inputContent);
 
    //add created <li> element with its child elements 
    //(label and input) to myList (<ul>) element
    document.getElementById("myList").appendChild(divType);
    document.getElementById("myList").appendChild(divContent);
 
    //show address header
    $("#questionHeader").show(); 
}