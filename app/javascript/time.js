const time = () => {
  const showClock = () => {
    const time = new Date();
    const hour = time.getHours();
    const min = time.getMinutes();
    const sec = time.getSeconds();
    const clock = hour + ":" + min + ":" + sec;
    document.getElementById("clock").innerHTML = clock;
    const day = document.getElementById("day");
    day.value = clock;
    const begin = document.getElementById("begin");
    begin.value = clock;
    const finish = document.getElementById("finish");
    finish.value = clock;
  }
  setInterval(showClock, 1);
};


window.addEventListener("load",time)