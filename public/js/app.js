
function revolveText (options = {
    target: undefined,
    span: 100,
    north: 0,
    spiral: false
}) {
const { 
    target,
    span,
    north,
    spiral,
    size
} = options;
const message = target.textContent;
const quaterWidth = target.clientWidth / 4;
const diameter = size || quaterWidth;
const messageChunks = message.split(String());
const { length } = messageChunks;
const offsetEnd = 1;
const l = length + offsetEnd;
const CIRC_MAX = 360;
const PERC_MAX = 100;
const ofDeg = span * CIRC_MAX / PERC_MAX;
const ofNorth = north * CIRC_MAX / PERC_MAX;
const segDeg = ofDeg / l;
const fontSize = 16;
let a = 0;
let i = 0;

target.setAttribute('style', `
    padding-left: ${diameter / 2}px;
    display: inline-block;
    width: ${diameter / 2}px;
    height: ${diameter}px;
    transform: rotate3d(0, 0, 1, -${segDeg + ofNorth}deg);
    border-radius: 9e9em;
    font-size: 2rem;
    letter-spacing:50px;
`);
target.classList.add('fx-Revolve');
target.textContent = '';
while (a < ofDeg) {
    a += segDeg;
    const charWrapper = document.createElement('span');
    charWrapper.textContent = messageChunks[i];
    i ++;
    charWrapper.classList.add('fx-RevolveCharWrap');
    charWrapper.setAttribute('style', `
    display: inline-block;
    transform: 
    rotate3d(0, 0, 1, ${a}deg) 
    ${spiral ? 'translateY(' + (i) + 'px)': ''};
    ${spiral ? 'font-size:' + (fontSize - (i / 10) ) + 'px': ''};
    position: absolute;
    height: ${diameter / 2}px;
    transform-origin: bottom left;
    font-size: 1em;
    `);
    target.appendChild(charWrapper);
}
}

revolveText({
    target: document.querySelector('.tar3'),
    span: 50, // percent
    north: 0, // cc rotate in percent
    spiral: false,
    size: 650 // fixed size
});


function showinfo(){
    document.querySelector(".mapdiv").classList.add("filterblur")
    document.querySelector(".Statcontainer").classList.add("filterblur")
    document.querySelector(".infoadd").classList.toggle("infoplus")
    = "Clic la carte pour voir les informations correspondant"
    document.querySelector(".statPercent").innerHTML +=""
}

function Closeinfo(){
    document.querySelector(".mapdiv").classList.remove("filterblur")
    document.querySelector(".Statcontainer").classList.remove("filterblur")
    document.querySelector(".infoadd").classList.toggle("infoplus")

}


const regions = document.querySelectorAll(".st0");
regions.forEach((region)=>{
    region.addEventListener("click", ()=>{
        document.querySelector(".activemap").classList.remove("activemap")
        region.classList.add("activemap")
        // console.log(region.id);
        fetch("http://localhost:8000/region/"+region.id,{
            method : "GET"
        })
        .then((result)=>result.json())
        .then(body=>{
            {
                const {percentPerVines} = body
                const percent1 = percentPerVines[0].percentVins
                const percent2 = percentPerVines[1].percentVins
                var sumPercent = []
                for(i = 0; i < percent1.length;i++){
                    sumPercent.push((percent1[i]+percent2[i])/2)
                }
                console.log(percentPerVines);
                console.log(sumPercent);
                document.querySelector(".titleRegion").innerHTML = region.id
                document.querySelector(".statPercent").innerHTML = "";
                for(i = 0; i < sumPercent.length; i++) {
                     document.querySelector(".statPercent").innerHTML +="Vin : "+percentPerVines[0].vins[i] +", taux de ventes : "+Math.round(sumPercent[i])+"%<br>"
                } 
            }                
        })
        .catch(err=>console.error(err))
    })
    region.addEventListener("dblclick", showinfo)
})


function popup1(){
    document.getElementById("inscription").classList.toggle("active");
}


function popup2(){
    document.getElementById("rapport-container").classList.toggle("active");
}


document.querySelector(".infospecreg").addEventListener("click", ()=>{
    fetch("http://localhost/regions/"+region, {
        method : "GET"
    })
})