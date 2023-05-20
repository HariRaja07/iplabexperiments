function fetchSmartphoneInfo() {
  var searchValue = document.getElementById("searchInput").value;

  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
      displaySmartphoneInfo(this, searchValue);
    }
  };
  xhttp.open("GET", "smartphones.xml", true); // Replace "smartphones.xml" with the path to your XML file
  xhttp.send();
}

function displaySmartphoneInfo(xml, searchValue) {
  var xmlDoc = xml.responseXML;
  var smartphones = xmlDoc.getElementsByTagName("smartphone");

  var smartphoneInfoContainer = document.getElementById("smartphoneInfoContainer");
  smartphoneInfoContainer.innerHTML = ""; // Clear previous search results

  // Iterate through each smartphone
  for (var i = 0; i < smartphones.length; i++) {
    var smartphone = smartphones[i];
    var brand = smartphone.getElementsByTagName("brand")[0].childNodes[0].nodeValue;
    var model = smartphone.getElementsByTagName("model")[0].childNodes[0].nodeValue;
    var os = smartphone.getElementsByTagName("os")[0].childNodes[0].nodeValue;

    // If search value matches any attribute, display smartphone info
    if (brand === searchValue || model === searchValue || os === searchValue) {
      // Create smartphone info elements
      var smartphoneInfo = document.createElement("div");
      var brandElement = document.createElement("p");
      var modelElement = document.createElement("p");
      var osElement = document.createElement("p");

      // Set smartphone info content
      brandElement.innerHTML = "Brand: " + brand;
      modelElement.innerHTML = "Model: " + model;
      osElement.innerHTML = "OS: " + os;

      // Append smartphone info elements to the container
      smartphoneInfo.appendChild(brandElement);
      smartphoneInfo.appendChild(modelElement);
      smartphoneInfo.appendChild(osElement);
      smartphoneInfoContainer.appendChild(smartphoneInfo);
    }
  }
}
