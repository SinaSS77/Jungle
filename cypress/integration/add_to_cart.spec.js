describe('add_to_card', () => {


  beforeEach(() => {
    cy.request('/cypress_rails_reset_state');
    cy.visit('http://localhost:3000/');
  });

 it("containd a cart", () => {
    cy.get(".nav-item.end-0").should("contain", "My Cart (0)");
  });
  
  it("Adds a product to the cart and increases the cart size by 1", () => {
    // click the "Add to Cart" button for the first product
    cy.get(":nth-child(1) > div > .button_to > .btn").click({ force: true });
    // assert that the cart size has increased by 1
    cy.get(".nav-item.end-0").should("contain", "My Cart (1)");
  });

});