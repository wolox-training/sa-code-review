function getRepositories() {
  var url = $("#repositories").data("repositories")
  $.getJSON(url, function(data) {
    $.each(data, function(_idx, repository) {
      $("#repositories").append("<tr>")
      $("#repositories").append("<td>" + repository.name + "</td>")
      $("#repositories").append("<td><a href=\"" + repository.html_url + "\">Go</a></td>")
      $("#repositories").append("<td>" + repository.stargazers_count + "</td>")
      $("#repositories").append("<td>" + repository.forks + "</td>")
      $("#repositories").append("</tr>")
    })
  })
}

function getTemperature() {
  var url = $("#temperature").data("temp")
  $.getJSON(url, function(data) {
    $("#temperature").append(data.temperature)
  })
}

$(document).ready(function() {
  getRepositories()
  getTemperature()
});
