struct User: Decodable {
    let id: Int
    let name: String
    let email: String
    let address: Address
    let company: Company
}
