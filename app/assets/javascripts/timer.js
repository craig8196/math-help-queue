function setHelpTime(){
  var xmlhttp = new XMLHttpRequest();
	window["helpTime"] = new Date();
}

function updateTimer()
{
  var curTime = new Date();

  var curTotal = curTime.getTime()/1000;
  var helpTotal = window["helpTime"].getTime()/1000;
  var displayTotal = Math.floor(curTotal - helpTotal);
 
  var helpHours = window["helpTime"].getHours();
  var helpMinutes = window["helpTime"].getMinutes();
  var helpSeconds = window["helpTime"].getSeconds();

  var displayHours = Math.floor(displayTotal/3600);
  displayTotal %= 3600;
  var displayMinutes = Math.floor(displayTotal/60);
  var displaySeconds = Math.floor(displayTotal%60);

  // Pad the minutes and seconds with leading zeros, if required
  displayMinutes = ( displayMinutes < 10 ? "0" : "" ) + displayMinutes;
  displaySeconds = ( displaySeconds < 10 ? "0" : "" ) + displaySeconds;

  var displayString = displayHours + ":" + displayMinutes + ":" + displaySeconds;

  // Update the time display
  document.getElementById("timer").firstChild.nodeValue = displayString;
}