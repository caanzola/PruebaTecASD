import XCTest

final class PruebaTecASDUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testNavigationToUserDetail() {
        //let tableView = app.tables.firstMatch
        //XCTAssertTrue(tableView.exists, "La lista de usuarios no se encuentra en la pantalla")
        
        let tableView = app.tables["UsersTableView"]
        let exists = NSPredicate(format: "exists == true")

        expectation(for: exists, evaluatedWith: tableView, handler: nil)
        waitForExpectations(timeout: 2, handler: nil)

        XCTAssertTrue(tableView.exists, "La lista de usuarios no se encuentra en la pantalla")


        let firstCell = tableView.cells.element(boundBy: 0)
        let hasUsers = firstCell.waitForExistence(timeout: 5)
        XCTAssertTrue(hasUsers, "No se encontraron usuarios en la lista")

        let firstUserLabel = firstCell.staticTexts.element(boundBy: 0).label
        print("Texto de la celda: \(firstUserLabel)")
        
        let texts = firstCell.staticTexts.allElementsBoundByIndex
        for text in texts {
            print("Texto en la celda-----> \(text.label)")
        }

        firstCell.tap()
        
        let detailTitle = app.navigationBars.element(boundBy: 0)
        XCTAssertTrue(detailTitle.exists, "No se navegó correctamente a la pantalla de detalles del usuario")

        
        //let detailTitle = app.navigationBars[firstUserLabel]
        //XCTAssertTrue(detailTitle.exists, "No se navegó correctamente a la pantalla de detalles del usuario")
    }
}
