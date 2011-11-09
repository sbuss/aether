// Fuck namespacing
function setSongPercent (songDOM, percent) {
    var $song = $(songDOM);
    //Set % text
    $song.find("div.progBar span").text(percent+"%");
    
    //Set length of progressbar
    $song.find("div.progBar").css("width", (percent+"%"));
    
}