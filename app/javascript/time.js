const time = () => {
  const showClock = () => {
    const time = new Date();
    const hour = time.getHours();
    const min = time.getMinutes();
    const sec = time.getSeconds();
    const year = time.getFullYear();
    const month = (time.getMonth()+1);
    const day = time.getDate();
    const toDay = year + "-" + month + "-" + day;
    const beginDay = document.getElementById("begin-day");
    beginDay.value = toDay;
    const finishDay = document.getElementById("finish-day");
    finishDay.value = toDay;

    const clock = hour + ":" + min + ":" + sec;
    document.getElementById("clock").innerHTML = clock;
    const begin = document.getElementById("begin");
    begin.value = clock;
    const finish = document.getElementById("finish");
    finish.value = clock;
  }
  setInterval(showClock, 1000);
};


window.addEventListener("load",time)