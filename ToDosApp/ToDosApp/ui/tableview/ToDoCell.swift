//
//  ToDoCell.swift
//  ToDosApp
//
//  Created by Ömercan Çolak on 25.05.2024.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    
    var cellProtocol:CellProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    //Burada protokollerle çalışmak önemli.
    //Silebilmek için index numarası gerekiyor.
    //MainScreen ve bura arasında köprü lazım
    @IBAction func buttonDelete(_ sender: Any) {
       // print("Delete button Clicked")
        cellProtocol?.buttonDeleteClicked(indexPath: indexPath!)
    }
    
}

//MainScreen de kullanıp burada tetiklemek için yapılan işlem
protocol CellProtocol {
    func buttonDeleteClicked(indexPath: IndexPath)
}
