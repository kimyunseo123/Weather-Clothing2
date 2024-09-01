async function getWeather() {
            let city = document.getElementById("city").value.trim();
            if (!city) {
                alert("Please enter a city.");
                return;
            }

            city = encodeURIComponent(city);
            const apiKey = '2343c55dbf340490e0768e1015950a0e';
            const urlCurrent = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`;
            const urlForecast = `https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=${apiKey}&units=metric`;

            try {
                // Fetch current weather data
                const responseCurrent = await fetch(urlCurrent);
                if (!responseCurrent.ok) {
                    throw new Error(`Current weather data fetch error: ${responseCurrent.statusText}`);
                }
                const dataCurrent = await responseCurrent.json();
                
                // Fetch 3-hour forecast data
                const responseForecast = await fetch(urlForecast);
                if (!responseForecast.ok) {
                    throw new Error(`Forecast data fetch error: ${responseForecast.statusText}`);
                }
                const dataForecast = await responseForecast.json();

                // Display current weather
                const date = new Date().toISOString().split('T')[0];
                document.getElementById("currentDate").textContent = `${date}`;
                const weatherDescription = dataCurrent.weather[0].description.toLowerCase();
                const weatherIcon = getWeatherIcon(weatherDescription);
                document.getElementById("currentWeatherIcon").src = weatherIcon;
                document.getElementById("description").textContent = `${weatherDescription}`;
                document.getElementById("temperature").textContent = `Current Temperature: ${dataCurrent.main.temp} °C`;
                document.getElementById("wind").textContent = `Wind: ${dataCurrent.wind.speed} km/h`;
                document.getElementById("precipitation").textContent = `Rain: ${dataCurrent.rain ? (dataCurrent.rain['1h'] || 0) + ' mm' : '0 mm'}`;


                // Display daily forecast
                let dailyForecasts = document.getElementById("dailyForecasts");
                dailyForecasts.innerHTML = '';
                for (let i = 0; i < 5; i++) {
                    const forecastData = dataForecast.list[i * 8];
                    const forecastDate = forecastData.dt_txt.split(' ')[0];
                    const forecastWind = forecastData.wind.speed;
                    const forecastWeather = forecastData.weather[0].description.toLowerCase();
                    const forecastIcon = getWeatherIcon(forecastWeather);
                    const forecastPrecipitation = forecastData.rain ? (forecastData.rain['3h'] || 0) + ' mm' : '0 mm';

                    let dayForecast = document.createElement('div');
                    dayForecast.className = 'forecastDay';
                    dayForecast.innerHTML = `
                        <p class="date">${forecastDate}</p>
                        <img src="${forecastIcon}" alt="Weather Icon">
                        <p style="font-weight: bold;">${forecastWeather}</p>
                        <p class="wind">Wind: ${forecastWind} km/h</p>
                        <p class="precipitation">Rain: ${forecastPrecipitation}</p>
                        <div>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Time</th>
                                        <th>Temp (°C)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    ${getHourlyTableRows(dataForecast.list, i)}
                                </tbody>
                            </table>
                        </div>
                    `;

                    dailyForecasts.appendChild(dayForecast);
                }

                // Show sections after data is successfully fetched
                document.getElementById("currentWeather").style.display = 'block';
                document.getElementById("fiveDayForecast").style.display = 'block'; // Show 5-Day Forecast
                document.getElementById("dailyForecasts").style.display = 'flex';

                // Scroll smoothly to the "Today's Weather" header
                document.getElementById('city').scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            } catch (error) {
                console.error('Error:', error);
                alert('Failed to fetch weather data. Please try again later.');
            }
        }

        function getHourlyTableRows(list, dayIndex) {
    const timeOrder = ['00:00', '03:00', '06:00', '09:00', '12:00', '15:00', '18:00', '21:00'];
    let rows = '';

    // Gather data points for the specific day
    let dayData = list.slice(dayIndex * 8, (dayIndex + 1) * 8);

        // Iterate through the desired times
        timeOrder.forEach(time => {
            let found = false;

            for (let data of dayData) {
                const dataTime = data.dt_txt.split(' ')[1].slice(0, 5); // Extract HH:MM
                if (dataTime === time) {
                    const temp = data.main.temp;
                    rows += `<tr><td class="time">${dataTime}</td><td class="temp">${temp}</td></tr>`;
                    found = true;
                    break;
                }
            }

            // If no data was found for this time, insert a row with "N/A" or leave it empty
            if (!found) {
                rows += `<tr><td class="time">${time}</td><td class="temp">N/A</td></tr>`;
            }
        });

        return rows;
    }

        function getWeatherIcon(description) {
            if (description.includes('clear') || description.includes('sunny')) {
                return 'images/clear.png';
            } else if (description.includes('cloud')) {
                return 'images/partly_cloudy.png';
            } else if (description.includes('rain')) {
                return 'images/rainy.png';
            } else if (description.includes('thunderstorm') || description.includes('lighthen')) {
                return 'images/lighting.png';
            } else if (description.includes('snow')) {
                return 'images/snow.png';
            } else {
                return 'images/unknown.png';
            }
        }

        function updateButtonColor() {
            let searchButton = document.getElementById("searchButton");
            let cityInput = document.getElementById("city").value;
            searchButton.style.backgroundColor = cityInput.length > 0 ? "#3a7abf" : "#82c4ff";
        }