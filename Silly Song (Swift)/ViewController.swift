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

func shortNameForName(fullName: String) -> String {
    let vowelList = ["a", "e", "i", "o", "u"]
    if let fistLetter = fullName.characters.first{
        if (vowelList.contains(String(fistLetter).lowercaseString)){
            return fullName.lowercaseString
        }else{
        }
    }
    return fullName.substringFromIndex(fullName.startIndex.successor()).lowercaseString
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(sender: AnyObject) {
       // if let name =  {
            lyricsView.text = lyricsForName(bananaFanaTemplate,fullName:nameField.text!)
       // }
        
    }
    

}

