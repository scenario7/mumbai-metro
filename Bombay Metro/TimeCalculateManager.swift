//
//  TimeCalculateManager.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 11/06/22.
//

import SwiftUI

class TimeCalculateManager {
    func calculateTime(line : Line, stationID : Int) -> Date {
        if line.intervalAvailible == true{
            var timeToStation : TimeInterval = 0
            let newStations = line.stations.reversed()
            if line == line2A{
            for station in newStations{
                if (station.id>stationID){
                    timeToStation += Double(station.secToNext ?? 0) + 20
                }
            }
            } else {
                for station in line.stations{
                    if (station.id<stationID){
                        timeToStation += Double(station.secToNext ?? 0) + 20
                    }
                }
            }
            let firstTrainAtStation = line.operationBeginsAt.addingTimeInterval(timeToStation)
            var currentTimeIteration = firstTrainAtStation
            var arrivalArray : [Date] = [firstTrainAtStation]
            var closestTrainArray : [TimeInterval] = []
            while (currentTimeIteration < line.operationEndsAt) {
                currentTimeIteration = currentTimeIteration.addingTimeInterval(720)
                arrivalArray.append(currentTimeIteration)
            }
            for time in arrivalArray {
                closestTrainArray.append(time.timeIntervalSince(Date()))
            }
            closestTrainArray.removeAll(where: { $0 < 0 })
            let nextTrainExpectedAt = Date().addingTimeInterval((closestTrainArray.min() ?? 0))            
            return (nextTrainExpectedAt)
        }
        else {
            return Date()
        }
    }
    func returnMinutes(currentTime : Date, expectedTime : Date) -> String {
        let timeInterval = expectedTime.timeIntervalSince(currentTime)
        let formatter = DateComponentsFormatter()
        let delimiter = ":"
        let token = formatter.string(from: timeInterval)!.components(separatedBy: delimiter)
        if (token.count == 1){
            return "<1 min"
        } else {
        return ("\(token[0]) min")
        }
    }
    func returnInt(currentTime : Date, expectedTime : Date) -> CGFloat {
        let timeInterval = expectedTime.timeIntervalSince(currentTime)
        let timeInt = Float(timeInterval/720)
        print("THIS IS THE TIME INT \(timeInt)")
        return CGFloat(timeInt)
    }
}
