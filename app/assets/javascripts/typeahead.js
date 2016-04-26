$(document).ready(function() {
  var substringMatcher = function(strs) {
    return function findMatches(q, cb) {
      var matches, substringRegex;
      matches = [];
      substrRegex = new RegExp(q, 'i');
      $.each(strs, function(i, str) {
        if (substrRegex.test(str)) {
          matches.push({ value: str });
        }
      });
      cb(matches);
    };
  };
  var posters = gon.posters;
  var tvshows = gon.tvshows;
  $('.typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 1,
  },

  {
    name: 'tvshows',
    displayKey: 'value',
    source: substringMatcher(tvshows),
    templates: {
      suggestion: function(tvshows){
        return  '<div class="custom-form">' +
                '<h5 class="defaultfont">' + tvshows.value + '</h5>' +
                '</div>' ;
      }
    }
  });
});
