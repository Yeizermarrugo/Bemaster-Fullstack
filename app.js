//? Ejercicio #1
const axios = require('axios');

const getPopularRepositories = async () => {
    const username = 'google'
    const url = `https://api.github.com/users/${username}/repos`
    try {
        const response = await axios.get(url);
        const repositories = response.data;
        console.log("---Ejercicio #1---");
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

//? Ejercicio #2
console.log("---Ejercicio #2---");
function f(x, y, z) {
    let sum = x + y;
    let mult = sum * z;
    let result = Math.sin(mult);
    return result;
}

const x = Math.floor(Math.random() * 100) + 1;
const y = Math.floor(Math.random() * 100) + 1;
const z = Math.floor(Math.random() * 100) + 1;
console.log(f(x,y,z))


//? Ejercicio #3
console.log("---Ejercicio #3---");
const numImpar = (num) => {
    let arr = [];
    for (let i = 1; i <= num; i++) {
        if (i % 2 != 0) {
            arr.push(i);
        }
    }
    return arr;
}
const n = Math.floor(Math.random() * 100) + 1;
console.log("El numero generado es: ", n);
console.log(numImpar(n))