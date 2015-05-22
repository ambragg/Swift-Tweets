//
//  Requests.swift
//  Sweetr
//
//  Created by Aimee Bragg on 5/18/15.
//  Copyright (c) 2015 Aimee Bragg. All rights reserved.
//

import Foundation

import CoreLocation

class FourSquareRequest {
    
    let API_URL = "https://api.foursquare.com/v2/"
    
    let CLIENT_ID = "TZSXRRPIQNJQYK2H05AR1RN1RDCDPLY2010CUAEZCJ0JTJZQ"
    
    let CLIENT_SECRET = "42UGJMB3OJT4QKFFHDQO1EGCDOXPIH0WMO13WO4WIV5C4D2N"
    
    func getVenuesWithLocation(location: CLLocation, completion: (venues: [AnyObject])  -> ()) {
        
        // venues empty array
        var venues: [AnyObject] = []
        
        // run completion closure/block and pass venues array
        completion(venues: venues)
        
    }
    
}


class TwitterRequest {
    
    let API_URL = "https://api.twitter.com/1.1/"
    
    func findPopularFoodTweets(completion: (tweets: [AnyObject]) -> ()) {
        
        let endpoint = API_URL + "search/tweets.json?q=Food&result_type=popular"
        
        if let url = NSURL(string: endpoint) {
            let request = NSURLRequest(URL: url)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                
                var error: NSError? = nil
                
                if let tweets = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as? [AnyObject] {
                    
                    completion(tweets: tweets)
                    
                }
                
                    if let error = error {
                        
                        println(error)
                }
                
            })
            
        }
    }
    
   
}
    

