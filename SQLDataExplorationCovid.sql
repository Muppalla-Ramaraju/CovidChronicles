/* This script is for covid data exploration through SQL*/

--Total case, deaths, and vaccinations by country and date
/*SELECT
    d.date AS 'Date',
    d.location AS 'Country',
    d.total_cases AS 'Daily Total Cases',
    d.total_deaths AS 'Daily Total Deaths',
    v.total_vaccinations AS 'Total Cumulative # Vaccines bought',
	v.people_vaccinated AS 'Cumulative # of People Vaccinated'
FROM
    CovidDB..DeathsData d
JOIN
    CovidDB..VaccinationData v ON d.location = v.location AND d.date = v.date
GROUP BY
    d.date,
    d.location,
    d.total_cases,
    d.total_deaths,
    v.total_vaccinations,

HAVING
	count(*) > 1
ORDER BY
    d.location,
    d.date;*/



--Regional Comparison
/*SELECT 
	d.location AS 'Country',
	MAX(d.date) AS 'Date',
	d.total_cases AS 'Total Cases',
	d.total_deaths AS 'Total Deaths',
	v.people_fully_vaccinated AS 'Total Vaccinated People'
FROM
	CovidDB..DeathsData d
JOIN
    CovidDB..VaccinationData v ON d.location = v.location AND d.date = v.date
GROUP BY
	d.location;*/

/*SELECT DISTINCT
    d.location AS 'Country',
    d.date AS 'Date',
    d.total_cases AS 'Total Cases',
    d.total_deaths AS 'Total Deaths',
    v.people_fully_vaccinated AS 'Total Vaccinated People'
FROM
    CovidDB..DeathsData d
JOIN
    CovidDB..VaccinationData v ON d.location = v.location AND d.date = v.date
WHERE
    d.date = (
        SELECT
            MAX(date)
        FROM
            CovidDB..DeathsData
        WHERE
            location = d.location
    );*/



--Total Cases per million by country
SELECT 
	d.location AS 'Country',
	date AS 'date',
	MAX(d.total_cases_per_million) AS 'Total Cases Per Million'
FROM
	CovidDB..DeathsData d
--WHERE
	--d.date = (SELECT MAX(date) FROM CovidDB..DeathsData WHERE location = d.location)
GROUP BY 
	d.location, date
ORDER BY
	d.location;



---Deaths per million by country
/*SELECT 
	d.location AS 'Country',
	MAX(d.total_deaths_per_million) AS 'Total Deaths Per Million'
FROM
	CovidDB..DeathsData d
WHERE
	d.date = (SELECT MAX(date) FROM CovidDB..DeathsData WHERE location = d.location)
GROUP BY 
	d.location
ORDER BY
	d.location;*/



----Likelihood of death atfer COVID infection by country
/*SELECT DISTINCT
    d.location AS 'Country',
--    d.date AS 'Date',
    d.total_cases AS 'Total Cases',
    d.total_deaths AS 'Total Deaths',
    (CAST(d.total_deaths AS float) / CAST(d.total_cases AS float)) * 100 as 'DeathPercentage'
FROM
    CovidDB..DeathsData d
WHERE
    d.date = (
        SELECT
            MAX(date)
        FROM
            CovidDB..DeathsData
        WHERE
            location = d.location
    );*/


--Percent Population infected by country
/*SELECT DISTINCT
    d.location AS 'Country',
--    d.date AS 'Date',
    d.population AS 'Population',
    d.total_deaths AS 'Total Deaths',
    (CAST(d.total_deaths AS float) / CAST(d.population AS float)) * 100 as '%Population Infected'
FROM
    CovidDB..DeathsData d
WHERE
    d.date = (
        SELECT
            MAX(date)
        FROM
            CovidDB..DeathsData
        WHERE
            location = d.location
    )*/


---count of fully vaccinated people by country
/*SELECT DISTINCT
    v.location AS 'Country',
    d.population AS 'Population',
	v.people_fully_vaccinated AS 'Population Fully Vaccinated'
FROM
    CovidDB..DeathsData d JOIN CovidDB..VaccinationData v 
ON d.location = v.location AND d.date = v.date
WHERE
    v.date = (
        SELECT
            MAX(date)
        FROM
            CovidDB..VaccinationData
        WHERE
            location = v.location
    )
	AND v.people_fully_vaccinated IS NOT NULL;*/



---Continents with least deaths
/*Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From CovidDB..DeathsData
Where continent is not null 
Group by continent
Order by TotalDeathCount;*/



---- population that received atleast partial vaccination and full vaccination
/*SELECT DISTINCT
    v.location AS 'Country',
    d.population AS 'Population',
	v.people_vaccinated AS 'Population Vaccinated',
	v.people_fully_vaccinated AS 'Population Fully Vaccinated'
FROM
    CovidDB..DeathsData d JOIN CovidDB..VaccinationData v 
ON 
	d.location = v.location AND d.date = v.date
WHERE
    v.people_vaccinated = (
        SELECT
            MAX(people_vaccinated)
        FROM
            CovidDB..VaccinationData
        WHERE
            location = v.location
    );*/

---percent of vaccinated people that received full vaccination









