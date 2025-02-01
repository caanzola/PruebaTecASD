import XCTest
@testable import PruebaTecASD

final class PruebaTecASDTests: XCTestCase {

    var viewModel: UserViewModel!

    override func setUpWithError() throws {
        super.setUp()
        viewModel = UserViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        super.tearDown()
    }

    func testFetchUsers_SuccessfulResponse() throws {
        let expectation = expectation(description: "Fetch users from API")
        viewModel.fetchUsers { success in
            XCTAssertTrue(success, "El método fetchUsers debería retornar true en caso de éxito")
            XCTAssertFalse(self.viewModel.users.isEmpty, "La lista de usuarios no debería estar vacía después de una respuesta exitosa")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testUserFiltering() {
        let users = [
            User(id: 1, name: "Alice Johnson", email: "alice@example.com", address: Address(street: "Main St", city: "New York"), company: Company(name: "TechCorp")),
            User(id: 2, name: "Bob Smith", email: "bob@example.com", address: Address(street: "Second St", city: "Los Angeles"), company: Company(name: "BizCorp")),
            User(id: 3, name: "Charlie Brown", email: "charlie@example.com", address: Address(street: "Third St", city: "Chicago"), company: Company(name: "DevCorp"))
        ]
        
        viewModel.users = users

        viewModel.filterUsers(with: "Alice")
        XCTAssertEqual(viewModel.filteredUsers.count, 1, "Debe haber un solo resultado para 'Alice'")
        XCTAssertEqual(viewModel.filteredUsers.first?.name, "Alice Johnson", "El usuario filtrado debe ser 'Alice Johnson'")

        viewModel.filterUsers(with: "Bob")
        XCTAssertEqual(viewModel.filteredUsers.count, 1, "Debe haber un solo resultado para 'Bob'")
        XCTAssertEqual(viewModel.filteredUsers.first?.name, "Bob Smith", "El usuario filtrado debe ser 'Bob Smith'")

        viewModel.filterUsers(with: "Zoe")
        XCTAssertEqual(viewModel.filteredUsers.count, 0, "No debe haber resultados para 'Zoe'")

        viewModel.filterUsers(with: "")
        XCTAssertEqual(viewModel.filteredUsers.count, users.count, "Si la búsqueda está vacía, deben mostrarse todos los usuarios")
    }

}
