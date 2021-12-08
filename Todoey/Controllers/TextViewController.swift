//
//  TextViewController.swift
//  Todoey
//
//  Created by Kanat on 6/12/21.

import UIKit

class TextViewController: UIViewController {
    
    var selectedItem: Item!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet private var textView: UITextView! 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let desc = selectedItem.desc, !desc.isEmpty {
            textView.text = desc
        } else {
            textView.text = "Добавьте описание"
            textView.textColor = UIColor.lightGray
        }
    }
}

extension TextViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {

        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        selectedItem.desc = textView.text
        try? context.save()
    }
}
