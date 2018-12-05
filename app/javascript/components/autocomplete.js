function findMatches(wordToMatch, airports) {
  return airports.filter(location => {
    const regex = new RegExp(wordToMatch, 'gi')
    return location.name.match(regex) || location.icao.match(regex);
  })
}

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

function fillInput() {
  console.log(event.currentTarget.innerText, "im working");
  searchInput.value = event.currentTarget.innerText;
  const suggestions = document.querySelector('.suggestions');
  suggestions.innerHTML = "";
}

function displayMatches(airports) {
  // check if there is a search term.
  // if the searchinput is empty, we set the results to be empty and exit the function.
  const suggestions = document.querySelector('.suggestions');
  if (searchInput.value === "") {
    suggestions.innerHTML = "" ;
    return;
  }

  const resultArray = findMatches(searchInput.value, airports);
  const html = resultArray.map(location => {
    const regex = new RegExp(searchInput.value, 'gi')
    const airportName = location.name.replace(regex, `<span class="hl">${searchInput.value}</span>`);
    const airportIcao = location.code.replace(regex, `<span class="hl">${searchInput.value}</span>`);
    return `
    <li>
      <span class="name">${airportName}, ${airportIcao}</span>
    </li>
    `;
  }).join('');


  suggestions.innerHTML = html;


  // call a function that adds a click listener to all the newly appenden list items
   const listElements = document.querySelectorAll(".suggestions li");
   console.log(listElements)
   listElements.forEach((element) => {
    element.addEventListener('click', () => fillInput());
   });

}

const searchInput = document.getElementById('query_airport');

if (searchInput) {
  const endpoint = 'https://gist.githubusercontent.com/goga2004/8da810820326fb4e0576dad883ffdc16/raw/61e7f971e0dd58395e73456939ab39ff50db6bc9/airports.json';

  const airports = [];

  fetch(endpoint)
    .then(response => response.json())
    // .then(data => data.forEach(city => airports.push(city)))
    .then(data => airports.push(...data));

  // searchInput.addEventListener('change', () => displayMatches(airports));
  searchInput.addEventListener('keyup', () => displayMatches(airports));
}
