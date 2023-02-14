//
//  SchoolsModel.swift
//  SchoolSystem
//
//  Created by Chika Ohaya on 2/13/23.
//



import Foundation

struct SchoolsDataModel : Codable, Hashable {
    
 
    var dbn                        : String? = nil
    var schoolName                 : String? = nil
    var numOfSatTestTakers         : String? = nil
    var satCriticalReadingAvgScore : String? = nil
    var satMathAvgScore            : String? = nil
    var satWritingAvgScore         : String? = nil

    enum CodingKeys: String, CodingKey {

      case dbn                        = "dbn"
      case schoolName                 = "school_name"
      case numOfSatTestTakers         = "num_of_sat_test_takers"
      case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
      case satMathAvgScore            = "sat_math_avg_score"
      case satWritingAvgScore         = "sat_writing_avg_score"
    
    }

    init(dbn: String?, schoolName: String?, numOfSatTestTakers: String?, satCriticalReadingAvgScore: String?, satMathAvgScore: String?, satWritingAvgScore: String?) {
            self.dbn = dbn
            self.schoolName = schoolName
            self.numOfSatTestTakers = numOfSatTestTakers
            self.satCriticalReadingAvgScore = satCriticalReadingAvgScore
            self.satMathAvgScore = satMathAvgScore
            self.satWritingAvgScore = satWritingAvgScore
        }


}
