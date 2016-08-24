//
//  ViewController.swift
//  Silly Song (Swift)
//
//  Created by 翁 旭扬 on 16/8/24.
//  Copyright © 2016年 翁 旭扬. All rights reserved.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

func shortNameForName(name: String) -> String {
    let lowercaseName = name.lowercaseString
    let vowelSet = NSCharacterSet(charactersInString: "aeiouAEIOU")
    
    if let firstVowelRange = name.rangeOfCharacterFromSet(vowelSet, options: .CaseInsensitiveSearch) {
        return lowercaseName.substringFromIndex(firstVowelRange.startIndex)
    }
    
    // No vowels - return the full name
    return lowercaseName
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameForName(fullName)
    
    let lyrics = lyricsTemplate
        .stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName)
        .stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName)
    
    return lyrics
}
class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    
    @IBAction func reset(sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(sender: AnyObject) {
        if let name = nameField.text where !name.isEmpty {
            lyricsView.text = lyricsForName(bananaFanaTemplate,fullName:name)
        } else {
            lyricsView.text = "Enter your name"
        }
        
       
        
    }
    

}

