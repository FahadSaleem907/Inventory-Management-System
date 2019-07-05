import UIKit

class salesTableViewCell: UITableViewCell
{

    @IBOutlet weak var sale: UILabel!
    @IBOutlet weak var showDetailsOutlet: UIButton!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        showDetailsOutlet.isHidden = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
