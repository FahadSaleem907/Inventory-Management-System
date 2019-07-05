import UIKit

class StoreTableViewCell: UITableViewCell
{

    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeLocation: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        //storeDetailOut.isHidden = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
