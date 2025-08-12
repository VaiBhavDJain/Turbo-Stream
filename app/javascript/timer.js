document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".timer").forEach((timerEl) => {
    let count = parseInt(timerEl.dataset.start, 10) || 1;
    setInterval(() => {
      timerEl.textContent = count++;
    }, 1000);
  });
});
