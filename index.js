var Chef = function(){
    this.dishes = ['Dosa', 'Tea', 'Pokoras', 'Pav Bhaji'];
};
Chef.prototype.checkMenu= function(){
    //returns a string
    //returns a random dish from the dishes array
    let dish = this.dishes[Math.floor(Math.random() * this.dishes.length)];

    console.log("I will like to have:", dish);
    return dish;
};

let chef = new Chef();

module.exports = chef;
