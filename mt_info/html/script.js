let staff = false;
let lang = "da";
let job = "citizen";

const days = {
    da: ["Søndag","Mandag","Tirsdag","Onsdag","Torsdag","Fredag","Lørdag"],
    en: ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
};

window.addEventListener("message", function(event) {

    if (event.data.action === "init") {
        const d = event.data.data;

        staff = d.staff;
        lang = d.lang;
        job = d.job.toLowerCase();

        const hud = document.getElementById("hud");
        hud.className = "";
        hud.classList.add(`job-${job}`);

        document.getElementById("ids").innerText =
            staff
            ? `ID: ${d.server_id} | UID: ${d.user_id}`
            : `ID: ${d.server_id}`;

        hud.classList.remove("hidden");
    }

    if (event.data.action === "toggle") {
        document.getElementById("hud").classList.toggle("hidden", !event.data.state);
    }
});

function updateTime() {
    const now = new Date();

    const day = days[lang][now.getDay()];
    const date = `${String(now.getDate()).padStart(2,'0')}/${String(now.getMonth()+1).padStart(2,'0')}/${now.getFullYear()}`;
    const time = `${String(now.getHours()).padStart(2,'0')}:${String(now.getMinutes()).padStart(2,'0')}:${String(now.getSeconds()).padStart(2,'0')}`;

    document.getElementById("date").innerText = `${day} ${date}`;
    document.getElementById("time").innerText = time;
}

setInterval(updateTime, 1000);
updateTime();
