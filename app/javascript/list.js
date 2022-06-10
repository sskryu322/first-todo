window.addEventListener('load', function(){
  const articles = document.querySelectorAll(".article, .calendar-schedule, .btn-shadow");
  
  articles.forEach(function(article) {
    article.addEventListener('mouseover', function() {
      this.setAttribute("style", "box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.4);");
    });
    article.addEventListener('mouseout', function() {
      this.removeAttribute("style", "box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.4);");
    });
  });
});