describe('example to-do app', () => {


  beforeEach(() => {
    cy.request('/cypress_rails_reset_state');
    cy.visit('http://localhost:3000/');
  });

  it('users can navigate from the home page to the product detail page by clicking on a product', () => {
    cy.get('.product-list').first().find('a').click();
    cy.get('.quantity').first().should('exist');

  });

});