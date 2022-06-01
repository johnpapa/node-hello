
const assert = require('chai').assert;
const Chef = require('../app');

describe('Chef test', function(){
   
    let chef = Chef;
    
    it('check the dish has valid name.', function(){
        assert.isString(chef.checkMenu(), 'string');
    })
    
    it('check for a dish in menu.', function (){
        let dish= chef.checkMenu()
        assert.oneOf(dish, chef.dishes)

    });
    
});
