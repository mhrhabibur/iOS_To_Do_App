//
//  TableViewCell.swift
//  To Do App
//
//  Created by Habibur Rahman on 7/29/21.
//

import UIKit

class TableViewCell: UITableViewCell {

  
    @IBOutlet weak var checkMarkImage: UIImageView!
    
    @IBOutlet weak var toDoLable: UILabel!
    
    var isChecked = false
    
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
