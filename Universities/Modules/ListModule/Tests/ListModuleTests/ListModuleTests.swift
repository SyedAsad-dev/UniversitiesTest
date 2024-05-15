import XCTest
import Entities
import Utils
import Protocols
@testable import ListModule

final class ListModuleTests: XCTestCase {
    
    var intrector: UniversityListInteractor!
    var mockApiService: MockAPIService!
    var mockCoreDataService: MockCoreDataService!
    
    override func setUp() {
           super.setUp()
        mockApiService = MockAPIService()
        mockCoreDataService = MockCoreDataService()

       }
       
    func test_loadList_APIService_RetrunAndSaveTwoObjects_InUniversitiesObject_IsSuccess() async  {
        
       let testApi = [UniversityModel(stateProvince: "Dubai", domains: [], webPages: [], name: "Uni Canada", alphaTwoCode: "AE", country: "UAE"), UniversityModel(stateProvince: "Dubai", domains: [], webPages: [], name: "Uni Canada", alphaTwoCode: "AE", country: "UAE")]
          
          mockApiService = MockAPIService(model: testApi)
          intrector = UniversityListInteractor(listService: mockApiService, listCoreData: mockCoreDataService)

        intrector.loadUniversities()
        await fulfillment(of: [], timeout: 2)
        XCTAssertEqual(intrector.universities.count, 2)
        
    }
    
    func test_GetList_CoreDataService_RequestThreeObjects_InUniversitiesObject_IsSuccess() async  {
        
       let mockCoreDataList = [UniversityModel(stateProvince: "Dubai", domains: [], webPages: [], name: "Uni Canada", alphaTwoCode: "AE", country: "UAE"), UniversityModel(stateProvince: "Dubai", domains: [], webPages: [], name: "Uni Canada", alphaTwoCode: "AE", country: "UAE"),UniversityModel(stateProvince: "Dubai", domains: [], webPages: [], name: "Uni Canada", alphaTwoCode: "AE", country: "UAE")]
        
        mockCoreDataService = MockCoreDataService(model: mockCoreDataList)
          
          mockApiService = MockAPIService(testCoreData: true)
        
          intrector = UniversityListInteractor(listService: mockApiService, listCoreData: mockCoreDataService)
        
        intrector.loadUniversities()
        
        await fulfillment(of: [], timeout: 2)


        XCTAssertEqual(intrector.universities.count, 3)
        
    }
    
    func test_loadList_And_GetList_CoreDataService_And_APIService_FailTest() async  {
        
        mockApiService = MockAPIService(testCoreData: true)
        mockCoreDataService = MockCoreDataService(checkFailCondition: true)

          intrector = UniversityListInteractor(listService: mockApiService, listCoreData: mockCoreDataService)

        intrector.loadUniversities()
        await fulfillment(of: [], timeout: 2)
        XCTAssertEqual(intrector.universities.count, 2)
        
    }
    
}
