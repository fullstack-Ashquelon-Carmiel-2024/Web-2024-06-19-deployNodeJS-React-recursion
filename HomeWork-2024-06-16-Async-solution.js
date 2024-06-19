// a) Random Joke Generator
   
   const badJoke = (joke) => 
         console.log(`Here is your random bad joke: \n${joke}`) 
   
   const funnyJoke = (joke) => 
       console.log(`Here is your random hilarious joke: \n${joke}`) 

   const shortJoke = (joke) =>
        console.log(`Here is your pretty short random joke: \n${joke}`) 
   
   function generateJoke(callback) {
       const jokes = ['I went shopping for a pair of camouflage pants. But I couldn\'t find any.',
       'My dad was hit on the head with a can of soda. Luckily, it was a soft drink.',
       'I used to steal soap, but I\'m clean now.',
       'Why do tigers have stripes? They don\'t want to be spotted.']
       console.log(Date.now());
       console.log('Generating a random joke...');
       setTimeout(() => {
           let joke = jokes[Math.floor(Math.random()*jokes.length)];
           console.log(Date.now());
           callback(joke);
       }, 2500); 
   }

   generateJoke(badJoke);
   generateJoke(funnyJoke);
   generateJoke(shortJoke);

// b) Weather Forecast

    function showTime() {
        const currDateTime = new Date();
        console.log(currDateTime.getHours() + ":" 
            + currDateTime.getMinutes() + ":" 
            + currDateTime.getSeconds() + ":" 
            + currDateTime.getMilliseconds());
    }

    function fetchEilatWeather() {
       
        showTime();
        console.log(`Fetching weather forecast for Eilat`);
        setTimeout(() => {
            showTime();
            console.log(`Weather forecast retrieved for Eilat`);
        }, 3000); 
    }

    function fetchTzfatWeather() {
       
        showTime();
        console.log(`Fetching weather forecast for Tzfat`);
        setTimeout(() => {
            showTime();
            console.log(`Weather forecast retrieved for Tzfat`);
        }, 3000); 
    }

    function weatherForecaster(callback,city,delay) {
        showTime();
        console.log(`In ${delay} milliseconds going to fetch
        the weather forecast for ${city} ...`)
        setTimeout(callback,delay);
    }

    weatherForecaster(fetchEilatWeather,'Eilat',1500);
    weatherForecaster(fetchTzfatWeather,'Tzfat',2500);

    // c) Weather Forecast for any city

    function fetchWeather(city) {
       
        showTime();
        console.log(`Fetching weather forecast for ${city}`);
        setTimeout(() => {
            showTime();
            console.log(`Weather forecast retrieved for ${city}`);
        }, 3000); 
    }

    function fetch2DayWeather(city) {

        showTime();
        console.log(`Fetching 1st day weather forecast for ${city}`);
 
        setTimeout(() => {
 
            showTime();
            console.log(`1st day weather forecast retrieved for ${city}`);
            console.log(`Fetching 2nd day weather forecast for ${city}`);
 
            setTimeout(() => {
                showTime();
                console.log(`2nd day weather forecast retrieved for ${city}`);
            }, 2000); 
 
        }, 2000); 
    }

    function weatherForecasterForAnyCity(callback,city,delay) {
        showTime();
        console.log(`In ${delay} milliseconds going to fetch
        the weather forecast for ${city} ...`)
        setTimeout(()=>callback(city),delay);
    }

    weatherForecasterForAnyCity(fetchWeather,'Jerusalem',2000);
    weatherForecasterForAnyCity(fetch2DayWeather,'Metula',1500);

