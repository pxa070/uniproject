const axios = require("axios");
async function fetchResources(keywords) {
    const apiKey = process.env.GOOGLE_API_KEY;
    const searchEngineId = process.env.SEARCH_ENGINE_ID;
    const resources = [];

    const url = `https://www.googleapis.com/customsearch/v1?key=${apiKey}&cx=${searchEngineId}&q=${encodeURIComponent(keywords)}`;
    try {
        const { data } = await axios.get(url);
        data.items.forEach((item) => {
            resources.push({ link: item.link, description: item.snippet });
        });
    } catch (error) {
        console.error(
            `Failed to fetch resources for keyword "${keywords}":`,
            error,
        );
        // Handle the error appropriately - maybe continue to the next keyword or return partial results
    }

    return resources;
}
module.exports = fetchResources;