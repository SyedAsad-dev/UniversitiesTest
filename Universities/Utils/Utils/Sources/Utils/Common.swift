//
//  Common.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation

public class Common {
   public static func prepareURL(suffixURL: String, key: String, value: String) -> URL? {
        guard var urlComps = URLComponents(string: suffixURL) else {return nil}
        urlComps.queryItems = [URLQueryItem(name: key, value: value)]
        guard let url = urlComps.url else {return nil}
        return url
    }
    
}
