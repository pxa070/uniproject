

async function fetchResources(keywords) {
    const apiKey = process.env.GOOGLE_API_KEY;
    const searchEngineId = process.env.SEARCH_ENGINE_ID
    const resources = [];

    for (const keyword of keywords) {
        const url = `https://www.googleapis.com/customsearch/v1?key=${apiKey}&cx=${searchEngineId}&q=${encodeURIComponent(keyword)}`;
        try {
            const fetch = await import('node-fetch');
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error(`API call failed with status ${response.status}: ${response.statusText}`);
            }
            const data = await response.json();
            data.items.forEach(item => {
                resources.push({ link: item.link, description: item.snippet });
            });
        } catch (error) {
            console.error(`Failed to fetch resources for keyword "${keyword}":`, error);
            // Handle the error appropriately - maybe continue to the next keyword or return partial results
        }
    }

    return resources;
}

module.exports = fetchResources;
