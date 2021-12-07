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
        
        textView.text = selectedItem.desc
    }
}

extension TextViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        
        selectedItem.desc = textView.text
        try? context.save()
    }
}
