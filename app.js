const axios = require('axios');

const getPopularRepositories = async () => {
    const username = 'google'
    const url = `https://api.github.com/users/${username}/repos`
    try {
        const response = await axios.get(url);
        const repositories = response.data;

        repositories.sort((a, b) => b.stargazers_count - a.stargazers_count);

        const morePopularRepositories = repositories.slice(0, 10);

        console.log('Los 10 repositorios más populares de Google en GitHub son:');
        morePopularRepositories.forEach((repo, index) => {
            console.log(`${index + 1}. ${repo.name} - ${repo.stargazers_count} estrellas`);
        });
    } catch (error) {
        console.error('Ocurrió un error al obtener los repositorios:', error.message);
    }
}

getPopularRepositories();

// function f(x, y, z) {
//     let sum = x + y;
//     let mult = sum * z;
//     let result = Math.sin(mult);
//     return result;
// }

// console.log(f(2,4,6))